#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif
extern PRECISION vec2 cam;
extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;
vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);
float filmGrain(vec2 uv, float t) {
    float n = fract(sin(dot(uv * 100.0 + vec2(t * 7.3, t * 3.1), vec2(127.1, 311.7))) * 43758.5453);
    return n;
}
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}
vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;
    vec4 basetex = Texel(texture, texture_coords);
    float t = cam.g + time * 0.5;
    if (tex.a == 0){
        tex.a = 0;
    } else {
        vec2 floored_uv = floor(uv * texture_details.ba) / texture_details.ba;
        float strip_count = 3.0;
        float strip_height = 1.0 / strip_count;
        float strip_id = floor(floored_uv.y / strip_height); 
        float local_y = fract(floored_uv.y / strip_height);  
        vec2 frame_uv = vec2(floored_uv.x, local_y);
        vec2 sample_tc = (frame_uv * texture_details.ba + texture_details.xy * texture_details.ba) / image_details;
        vec4 frame_tex = Texel(texture, sample_tc);
        float frame_offset = strip_id * 0.03;
        float exposure_var = 1.0 + frame_offset * sin(t * 0.7 + strip_id);
        vec3 c = frame_tex.rgb;
        float lum = dot(c, vec3(0.299, 0.587, 0.114));
        vec3 sepia = vec3(
            min(lum * 1.35 + 0.08, 1.0),
            min(lum * 1.10 + 0.02, 1.0),
            min(lum * 0.78, 1.0)
        );
        vec3 film_color = mix(c, sepia, 0.75) * exposure_var;
        float cx = floored_uv.x - 0.5;
        float cy = local_y - 0.5;
        float vign = 1.0 - smoothstep(0.3, 0.7, length(vec2(cx * 1.2, cy * 1.8)));
        film_color *= (0.7 + 0.3 * vign);
        float grain = filmGrain(floored_uv, t + strip_id * 13.7);
        film_color += (grain - 0.5) * 0.08;
        float border_h = 0.07;
        float border_fade = smoothstep(0.0, border_h, local_y) * smoothstep(1.0, 1.0 - border_h, local_y);
        film_color = mix(vec3(0.05, 0.03, 0.01), film_color, border_fade);
        float sep_line = smoothstep(0.0, 0.015, local_y) * (1.0 - smoothstep(0.985, 1.0, local_y));
        film_color *= sep_line;
        float scratch_x = hash(vec2(floor(floored_uv.x * 60.0), floor(t * 3.0)));
        float scratch = step(0.97, scratch_x);
        float scratch_v = hash(vec2(floor(floored_uv.x * 60.0) + 0.5, t));
        film_color += vec3(0.9, 0.85, 0.7) * scratch * scratch_v * 0.4;
        float frame_alpha = frame_tex.a * border_fade * sep_line;
        tex = vec4(film_color, frame_alpha);
        float ratio = 0.85;
        tex = ratio * tex + (1.0 - ratio) * basetex;
    }
    return dissolve_mask(tex*colour, texture_coords, uv);
}
vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }
    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01;
	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));
    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);
    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);
    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }
    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}
extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;
#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);
    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif
