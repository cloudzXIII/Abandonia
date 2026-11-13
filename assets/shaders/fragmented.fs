#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP number dissolve;
extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;
extern MY_HIGHP_OR_MEDIUMP vec2 mouse_screen_pos;
extern MY_HIGHP_OR_MEDIUMP float hovering;
extern MY_HIGHP_OR_MEDIUMP float screen_scale;

extern MY_HIGHP_OR_MEDIUMP vec2 fragmented;

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
    
    float current_time = fragmented.y * 2.0;
    float radius = 0.035 + sin(current_time * 1.2) * 0.015;
    
    float angle_r = current_time;
    float angle_g = current_time + 2.09439;
    float angle_b = current_time + 4.18879;
    
    vec2 off_r = vec2(cos(angle_r), sin(angle_r)) * radius;
    vec2 off_g = vec2(cos(angle_g), sin(angle_g)) * radius;
    vec2 off_b = vec2(cos(angle_b), sin(angle_b)) * radius;
    
    vec2 scale = texture_details.ba / image_details;
    
    vec2 uv_r = uv + off_r;
    vec2 uv_g = uv + off_g;
    vec2 uv_b = uv + off_b;
    
    float mask_r = smoothstep(0.0, 0.02, uv_r.x) * smoothstep(1.0, 0.98, uv_r.x) * smoothstep(0.0, 0.02, uv_r.y) * smoothstep(1.0, 0.98, uv_r.y);
    float mask_g = smoothstep(0.0, 0.02, uv_g.x) * smoothstep(1.0, 0.98, uv_g.x) * smoothstep(0.0, 0.02, uv_g.y) * smoothstep(1.0, 0.98, uv_g.y);
    float mask_b = smoothstep(0.0, 0.02, uv_b.x) * smoothstep(1.0, 0.98, uv_b.x) * smoothstep(0.0, 0.02, uv_b.y) * smoothstep(1.0, 0.98, uv_b.y);
    
    vec4 col_r = Texel(texture, texture_coords + off_r * scale) * mask_r;
    vec4 col_g = Texel(texture, texture_coords + off_g * scale) * mask_g;
    vec4 col_b = Texel(texture, texture_coords + off_b * scale) * mask_b;
    
    vec3 final_rgb = vec3(col_r.r, col_g.g, col_b.b);
    
    float final_a = max(max(col_r.a, col_g.a), col_b.a);
    
    vec4 final_color = vec4(final_rgb, final_a);
    
    final_color.a += (fragmented.x + fragmented.y + time) * 0.00000001;

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