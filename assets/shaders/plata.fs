#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif
extern PRECISION vec2 plata;
extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;
vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);
float smoothNoise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    vec2 u = f * f * (3.0 - 2.0 * f);
    float a = fract(sin(dot(i + vec2(0,0), vec2(127.1, 311.7))) * 43758.5453);
    float b = fract(sin(dot(i + vec2(1,0), vec2(127.1, 311.7))) * 43758.5453);
    float c = fract(sin(dot(i + vec2(0,1), vec2(127.1, 311.7))) * 43758.5453);
    float d = fract(sin(dot(i + vec2(1,1), vec2(127.1, 311.7))) * 43758.5453);
    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
}
float fbm(vec2 p) {
    float val = 0.0;
    float amp = 0.5;
    float freq = 1.0;
    for (int i = 0; i < 5; i++) {
        val += smoothNoise(p * freq) * amp;
        amp *= 0.5;
        freq *= 2.0;
    }
    return val;
}
vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;
    vec4 basetex = Texel(texture, texture_coords);
    float t = plata.g + time * 0.4;
    if (tex.a == 0){
        tex.a = 0;
    } else {
        vec2 floored_uv = floor(uv * texture_details.ba) / texture_details.ba;
        vec2 flow_uv = floored_uv * 3.0 + vec2(t * 0.15, t * 0.08);
        float warp_x = fbm(flow_uv + vec2(1.7, 9.2));
        float warp_y = fbm(flow_uv + vec2(8.3, 2.8));
        vec2 warped = flow_uv + vec2(warp_x, warp_y) * 0.8;
        float flow = fbm(warped + t * 0.1);
        float wave1 = sin(floored_uv.x * 6.0 + flow * 4.0 + t * 0.7) * 0.5 + 0.5;
        float wave2 = cos(floored_uv.y * 5.0 + flow * 3.5 - t * 0.5) * 0.5 + 0.5;
        float wave3 = sin((floored_uv.x + floored_uv.y) * 4.0 + flow * 5.0 + t * 0.9) * 0.5 + 0.5;
        float diagonal = (floored_uv.x * 0.6 + floored_uv.y * 0.4);
        vec3 silver_light = vec3(0.92, 0.94, 0.97);   
        vec3 silver_mid   = vec3(0.72, 0.75, 0.80);   
        vec3 silver_dark  = vec3(0.45, 0.48, 0.55);   
        vec3 white_hot    = vec3(0.98, 0.99, 1.00);   
        vec3 blue_cold    = vec3(0.75, 0.88, 1.00);   
        vec3 metal = mix(silver_dark, silver_mid, wave1);
        metal = mix(metal, silver_light, wave2 * 0.7);
        metal = mix(metal, blue_cold, wave3 * 0.25);
        float spec_base = wave1 * wave2;
        float specular = pow(spec_base, 8.0);
        metal += white_hot * specular * 0.6;
        float filament = sin(flow * 30.0 + diagonal * 20.0 - t * 2.0);
        filament = smoothstep(0.85, 1.0, filament) * 0.3;
        metal += silver_light * filament;
        float spark = smoothNoise(floored_uv * 25.0 + vec2(t * 0.5));
        spark = smoothstep(0.92, 1.0, spark);
        float spark_anim = sin(t * 4.0 + spark * 20.0) * 0.5 + 0.5;
        metal += white_hot * spark * spark_anim * 0.5;
        float chromatic_shift = (wave1 - 0.5) * 0.04;
        metal.r = clamp(metal.r - chromatic_shift, 0.0, 1.0);
        metal.b = clamp(metal.b + chromatic_shift, 0.0, 1.0);
        vec3 base = tex.rgb;
        vec3 final_color = mix(base * 0.3, metal, 0.82);
        tex = vec4(final_color, tex.a);
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
