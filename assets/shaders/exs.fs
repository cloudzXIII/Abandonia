#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif
extern PRECISION vec2 exs;
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
vec3 cellColor(vec2 cell_id, float t) {
    float h = hash(cell_id);
    float h2 = hash(cell_id + vec2(31.7, 53.1));
    float selector = fract(h * 7.0 + floor(t * 0.5 + h2 * 10.0) * 0.13);
    vec3 col;
    if (selector < 0.143) {
        col = vec3(1.0, 0.1, 0.1);       
    } else if (selector < 0.286) {
        col = vec3(0.1, 0.9, 0.1);       
    } else if (selector < 0.429) {
        col = vec3(0.15, 0.35, 1.0);     
    } else if (selector < 0.572) {
        col = vec3(0.0, 0.9, 1.0);       
    } else if (selector < 0.715) {
        col = vec3(1.0, 0.9, 0.0);       
    } else if (selector < 0.858) {
        col = vec3(0.6, 0.6, 0.65);      
    } else {
        col = vec3(1.0, 0.0, 0.8);       
    }
    return col;
}
float xShape(vec2 local) {
    vec2 sub = floor(local * 3.0);
    float sx = sub.x; 
    float sy = sub.y; 
    bool center = (sx == 1.0 && sy == 1.0);
    bool corner = ((sx == 0.0 || sx == 2.0) && (sy == 0.0 || sy == 2.0));
    return (center || corner) ? 1.0 : 0.0;
}
vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;
    vec4 basetex = Texel(texture, texture_coords);
    float t = exs.g + time;
    if (tex.a == 0){
        tex.a = 0;
    } else {
        vec2 floored_uv = floor(uv * texture_details.ba) / texture_details.ba;
        float cell_size = 9.0 / max(texture_details.b, texture_details.a);
        vec2 cell_id = floor(floored_uv / cell_size);
        vec2 cell_local = fract(floored_uv / cell_size);
        float is_x = xShape(cell_local);
        vec3 x_color = cellColor(cell_id, t);
        float density = hash(cell_id + vec2(7.3, 2.9));
        float show = step(0.25, density); 
        float blink = hash(cell_id + vec2(t * 0.3, t * 0.17));
        float blink_speed = 0.5 + hash(cell_id + vec2(1.1, 2.2)) * 2.0;
        float blink_mask = step(0.3, sin(t * blink_speed + blink * 6.28));
        vec3 base = tex.rgb;
        vec2 checker = floor(floored_uv * texture_details.ba * 0.5);
        float check = mod(checker.x + checker.y, 2.0);
        vec3 bg = mix(vec3(0.88, 0.88, 0.90), vec3(0.78, 0.78, 0.80), check);
        float x_mask = is_x * show * blink_mask;
        vec3 final_color = mix(bg, x_color, x_mask * 0.9);
        final_color = mix(final_color, base, 0.12);
        tex = vec4(final_color, tex.a);
        float ratio = 0.9;
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
