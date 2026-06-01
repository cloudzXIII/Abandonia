#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif
extern PRECISION vec2 flash;
extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;
vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}
float dustSpeck(vec2 uv, float t) {
    vec2 cell = floor(uv * 80.0 + vec2(t * 0.2, 0.0));
    float h = hash(cell);
    if (h > 0.96) {
        vec2 local = fract(uv * 80.0 + vec2(t * 0.2, 0.0));
        float d = length(local - 0.5);
        return smoothstep(0.3, 0.05, d) * hash(cell + 0.5);
    }
    return 0.0;
}
vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;
    vec4 basetex = Texel(texture, texture_coords);
    float t = flash.g + time * 0.6;
    if (tex.a == 0){
        tex.a = 0;
    } else {
        vec2 floored_uv = floor(uv * texture_details.ba) / texture_details.ba;
        vec2 center = vec2(0.5, 0.48);
        vec2 dir = floored_uv - center;
        float dist = length(dir);
        float angle = atan(dir.y, dir.x);
        float ray_count = 32.0;
        float ray_wave = sin(angle * ray_count + t * 0.8) * 0.5 + 0.5;
        float ray_wave2 = sin(angle * (ray_count * 0.7) - t * 1.1 + 1.3) * 0.5 + 0.5;
        float ray_wave3 = sin(angle * (ray_count * 1.3) + t * 0.5 + 2.7) * 0.5 + 0.5;
        float ray_falloff = smoothstep(0.0, 0.15, dist) * smoothstep(1.0, 0.3, dist);
        float rays = (ray_wave * 0.5 + ray_wave2 * 0.3 + ray_wave3 * 0.2) * ray_falloff;
        float hue = fract(angle / 6.2832 + t * 0.08);
        float h6 = hue * 6.0;
        float f = fract(h6);
        float p = 0.0;
        float q = 1.0 - f;
        float r_v = f;
        vec3 ray_hue_color;
        int hi = int(floor(h6));
        if (hi == 0)      ray_hue_color = vec3(1.0, r_v, p);
        else if (hi == 1) ray_hue_color = vec3(q, 1.0, p);
        else if (hi == 2) ray_hue_color = vec3(p, 1.0, r_v);
        else if (hi == 3) ray_hue_color = vec3(p, q, 1.0);
        else if (hi == 4) ray_hue_color = vec3(r_v, p, 1.0);
        else              ray_hue_color = vec3(1.0, p, q);
        vec3 blue_cyan = vec3(0.2, 0.65, 1.0);
        vec3 warm = vec3(1.0, 0.7, 0.2);
        float warm_mix = smoothstep(0.4, 0.8, ray_wave2);
        vec3 ray_color = mix(mix(blue_cyan, ray_hue_color, 0.5), warm, warm_mix * 0.4);
        vec3 bg_warm = vec3(0.95, 0.92, 0.88);
        float smear1 = sin(floored_uv.x * 4.3 + t * 0.3) * cos(floored_uv.y * 5.1 - t * 0.4) * 0.5 + 0.5;
        float smear2 = cos(floored_uv.x * 6.1 - t * 0.5) * sin(floored_uv.y * 3.7 + t * 0.6) * 0.5 + 0.5;
        vec3 smear_color = mix(vec3(0.3, 0.8, 1.0), vec3(1.0, 0.9, 0.2), smear1);
        smear_color = mix(smear_color, vec3(0.8, 0.2, 0.6), smear2 * 0.4);
        vec3 background = mix(bg_warm, smear_color, 0.35);
        vec3 ray_layer = background + ray_color * rays * 0.8;
        vec3 base = tex.rgb;
        float lum_orig = dot(base, vec3(0.299, 0.587, 0.114));
        float silhouette = smoothstep(0.25, 0.15, lum_orig);
        vec3 silhouette_dark = vec3(0.05, 0.06, 0.12);
        vec3 final_color = mix(ray_layer, silhouette_dark, silhouette * 0.75);
        float dust = dustSpeck(floored_uv, t);
        final_color = mix(final_color, vec3(0.02, 0.02, 0.04), dust * 0.7);
        float motion = hash(vec2(floor(angle * 60.0), floor(dist * 40.0)));
        float motion_lines = smoothstep(0.92, 1.0, motion) * ray_falloff * 0.3;
        final_color += vec3(0.85, 0.9, 1.0) * motion_lines;
        tex = vec4(final_color, tex.a);
        float ratio = 0.88;
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
