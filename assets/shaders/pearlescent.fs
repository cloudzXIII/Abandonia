#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif

extern PRECISION vec2 pearlescent;
extern PRECISION float dissolve;
extern PRECISION float time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);

vec3 pearl_palette(float t) {
    t = fract(t);
    vec3 c0 = vec3(0.05, 0.03, 0.18);
    vec3 c1 = vec3(0.42, 0.22, 0.72);
    vec3 c2 = vec3(0.68, 0.28, 0.85);
    vec3 c3 = vec3(0.85, 0.45, 0.90);
    vec3 c4 = vec3(0.55, 0.55, 0.95);
    vec3 c5 = vec3(0.25, 0.35, 0.82);
    vec3 c6 = vec3(0.05, 0.03, 0.18);
    float s = t * 6.0;
    float f = fract(s);
    int i = int(floor(s));
    if (i == 0) return mix(c0, c1, f);
    if (i == 1) return mix(c1, c2, f);
    if (i == 2) return mix(c2, c3, f);
    if (i == 3) return mix(c3, c4, f);
    if (i == 4) return mix(c4, c5, f);
                return mix(c5, c6, f);
}

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords) * (image_details)) - texture_details.xy * texture_details.ba) / texture_details.ba;

    if (tex.a == 0.0) return vec4(0.0);

    float lum = dot(tex.rgb, vec3(0.299, 0.587, 0.114));

    float wave1 = sin(uv.x * 4.8 + uv.y * 2.1 + pearlescent.x * 0.0001);
    float wave2 = sin(uv.x * 2.3 - uv.y * 5.5 + pearlescent.x * 0.0002);
    float wave3 = sin((uv.x + uv.y) * 3.7 + pearlescent.y * 0.0001);
    float ripple = (wave1 * 0.45 + wave2 * 0.35 + wave3 * 0.20);

    float angle = fract(ripple * 0.5 + 0.5 + lum * 0.25);

    vec3 pearl = pearl_palette(angle);

    float specular = pow(lum, 1.8);
    pearl = mix(pearl, vec3(0.90, 0.82, 1.00), specular * 0.55);

    float dark = 1.0 - smoothstep(0.0, 0.25, lum);
    pearl = mix(pearl, vec3(0.04, 0.02, 0.14), dark * 0.65);

    float blend = smoothstep(0.08, 0.70, lum);
    vec3 col = mix(tex.rgb * vec3(0.55, 0.45, 0.75), pearl, blend * 0.92 + 0.08);

    float shine = smoothstep(0.82, 1.0, lum);
    col = mix(col, vec3(0.95, 0.90, 1.00), shine * 0.50);

    tex.rgb = clamp(col, 0.0, 1.0);
    return dissolve_mask(tex * colour, texture_coords, uv);
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
    vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t/143.6340), cos(-t/99.4324));
    vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t/53.1532),  cos( t/61.4532));
    vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t/87.53218), sin(-t/49.0000));
    float field = (1.+(cos(length(field_part1)/19.483)+sin(length(field_part2)/33.155)*cos(field_part2.y/15.73)+cos(length(field_part3)/27.193)*sin(field_part3.x/21.92)))/2.;
    vec2 borders = vec2(0.2, 0.8);
    float res = (.5+.5*cos((adjusted_dissolve)/82.612+(field+-.5)*3.14))
    -(floored_uv.x>borders.y?(floored_uv.x-borders.y)*(5.+5.*dissolve):0.)*(dissolve)
    -(floored_uv.y>borders.y?(floored_uv.y-borders.y)*(5.+5.*dissolve):0.)*(dissolve)
    -(floored_uv.x<borders.x?(borders.x-floored_uv.x)*(5.+5.*dissolve):0.)*(dissolve)
    -(floored_uv.y<borders.x?(borders.x-floored_uv.y)*(5.+5.*dissolve):0.)*(dissolve);
    if (tex.a>0.01&&burn_colour_1.a>0.01&&!shadow&&res<adjusted_dissolve+0.8*(0.5-abs(adjusted_dissolve-0.5))&&res>adjusted_dissolve) {
        if (!shadow&&res<adjusted_dissolve+0.5*(0.5-abs(adjusted_dissolve-0.5))&&res>adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) { tex.rgba = burn_colour_2.rgba; }
    }
    return vec4(shadow?vec3(0.,0.,0.):tex.xyz, res>adjusted_dissolve?(shadow?tex.a*0.3:tex.a):.0);
}

extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;

#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position)
{
    if (hovering <= 0.) { return transform_projection * vertex_position; }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03-0.3*max(0.,0.3-mid_dist))*hovering*(length(mouse_offset)*length(mouse_offset))/(2.-mid_dist);
    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif