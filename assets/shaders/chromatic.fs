#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif

extern PRECISION vec2 chromatic;
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
    float v = 0.0;
    float a = 0.5;
    for (int i = 0; i < 5; i++) {
        v += smoothNoise(p) * a;
        p *= 2.0;
        a *= 0.5;
    }
    return v;
}

vec3 chromaticpalette(float t) {
    t = fract(t);
    vec3 c0 = vec3(0.15, 0.75, 1.00);
    vec3 c1 = vec3(0.55, 0.30, 1.00);
    vec3 c2 = vec3(1.00, 0.20, 0.75);
    vec3 c3 = vec3(1.00, 0.70, 0.10);
    vec3 c4 = vec3(0.10, 0.90, 0.75);
    vec3 c5 = vec3(0.15, 0.75, 1.00);
    float s = t * 5.0;
    int i = int(floor(s));
    float f = smoothstep(0.0, 1.0, fract(s));
    if (i == 0) return mix(c0, c1, f);
    if (i == 1) return mix(c1, c2, f);
    if (i == 2) return mix(c2, c3, f);
    if (i == 3) return mix(c3, c4, f);
                return mix(c4, c5, f);
}

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords) * (image_details)) - texture_details.xy * texture_details.ba) / texture_details.ba;

    if (tex.a == 0.0) return vec4(0.0);

    vec2 floored_uv = floor(uv * texture_details.ba) / texture_details.ba;
    float t = chromatic.g + time * 0.3;

    vec2 warp_uv = floored_uv * 2.5 + vec2(t * 0.12, t * 0.07);
    float wx = fbm(warp_uv + vec2(1.7, 9.2));
    float wy = fbm(warp_uv + vec2(8.3, 2.8));
    vec2 warped = warp_uv + vec2(wx, wy) * 1.2;
    float flow = fbm(warped + t * 0.08);

    float lum = dot(tex.rgb, vec3(0.299, 0.587, 0.114));

    float wave1 = sin(floored_uv.x * 5.0 + flow * 6.0 + t * 0.6) * 0.5 + 0.5;
    float wave2 = cos(floored_uv.y * 4.0 + flow * 5.0 - t * 0.8) * 0.5 + 0.5;
    float wave3 = sin((floored_uv.x - floored_uv.y) * 3.5 + flow * 4.0 + t * 0.5) * 0.5 + 0.5;

    float hue = fract(flow * 0.6 + wave1 * 0.25 + wave2 * 0.15 + t * 0.04);
    vec3 chromatic_col = chromaticpalette(hue);

    float specular = pow(max(wave1 * wave2, 0.0), 4.0);
    chromatic_col += vec3(1.0) * specular * 0.55;

    float filament = smoothstep(0.88, 1.0, sin(flow * 25.0 + t * 1.5)) * 0.2;
    chromatic_col += vec3(1.0, 1.0, 1.0) * filament;

    float depth = smoothstep(0.0, 0.5, wave3);
    chromatic_col = mix(chromatic_col * 0.5, chromatic_col, depth);

    float highlight = pow(lum, 2.5);
    chromatic_col = mix(chromatic_col, vec3(1.0), highlight * 0.35);

    float shadow_areas = smoothstep(0.55, 0.0, lum);
    chromatic_col = mix(chromatic_col, chromatic_col * vec3(0.4, 0.35, 0.6), shadow_areas * 0.5);

    tex.rgb = chromatic_col;

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
vec4 position(mat4 transform_projection, vec4 vertex_position)
{
    if (hovering <= 0.) {
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);
    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif