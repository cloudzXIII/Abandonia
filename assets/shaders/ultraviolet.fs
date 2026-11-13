#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP number dissolve;
extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP number spin_time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;
extern MY_HIGHP_OR_MEDIUMP vec2 mouse_screen_pos;
extern MY_HIGHP_OR_MEDIUMP float hovering;
extern MY_HIGHP_OR_MEDIUMP float screen_scale;

extern MY_HIGHP_OR_MEDIUMP vec2 ultraviolet;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv) {
    if (dissolve < 0.001) { return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a); }
    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01;
    float t = time * 10.0 + 2003.;
    vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
    vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
    vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
    vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));
    float field = (1.+ (cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) + cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);
    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);
    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) { tex.rgba = burn_colour_1.rgba; } else if (burn_colour_2.a > 0.01) { tex.rgba = burn_colour_2.rgba; }
    }
    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords ) {
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;
    vec4 tex = Texel(texture, texture_coords);
    vec3 col = tex.rgb;
    
    float current_time = spin_time;

    float lum = dot(col, vec3(0.299, 0.587, 0.114));
    
    vec3 uv_base = mix(col, vec3(0.4, 0.1, 0.8) * col, 0.5); 
    
    float c_max = max(col.r, max(col.g, col.b));
    float c_min = min(col.r, min(col.g, col.b));
    float delta = c_max - c_min; 

    float red_mask = smoothstep(0.2, 0.6, col.r - max(col.g, col.b)) * delta;
    vec3 glow_red = vec3(1.0, 0.2, 0.8) * red_mask * 1.2;

    float green_mask = smoothstep(0.1, 0.5, col.g - col.b) * delta;
    vec3 glow_green = vec3(0.3, 0.9, 0.5) * green_mask * 1.0;

    float blue_mask = smoothstep(0.2, 0.6, col.b - max(col.r, col.g)) * delta;
    vec3 glow_blue = vec3(0.2, 0.5, 1.0) * blue_mask * 1.0;

    vec3 total_glow = glow_red + glow_green + glow_blue;

    vec3 fluor_glow = vec3(0.6, 0.2, 0.9) * pow(lum, 1.5) * 0.8;

    float base_pulse = sin(current_time * 2.0) * 0.04 + 0.96;
    
    float glitch = step(0.92, sin(current_time * 2.5)) * fract(sin(current_time * 100.0) * 43758.5453) * 0.15;
    
    float pulse = base_pulse - glitch;

    vec3 final_rgb = (uv_base + total_glow + fluor_glow) * pulse;
    
    vec4 final_color = vec4(clamp(final_rgb, 0.0, 1.0), tex.a);
    final_color.a += (ultraviolet.x + ultraviolet.y) * 0.00000001;
    
    return dissolve_mask(final_color * colour, texture_coords, uv);
}

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position ) {
    if (hovering <= 0.){ return transform_projection * vertex_position; }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))*hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);
    return transform_projection * vertex_position + vec4(0.,0.,0.,scale);
}
#endif