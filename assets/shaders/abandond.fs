#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif

extern PRECISION vec2 abandond;
extern PRECISION float dissolve;
extern PRECISION float time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);

float hash(vec2 p) { return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453); }
float noise(vec2 p) {
    vec2 i = floor(p); vec2 f = fract(p);
    f = f*f*(3.0-2.0*f);
    return mix(mix(hash(i),hash(i+vec2(1,0)),f.x),mix(hash(i+vec2(0,1)),hash(i+vec2(1,1)),f.x),f.y);
}

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details))-texture_details.xy*texture_details.ba)/texture_details.ba;
    if (tex.a == 0.0) return vec4(0.0);

    float focus = 0.5 + abandond.x * 0.0001;
    vec2 pixel_size = 1.0 / image_details;
    float ca = 1.5 * pixel_size.x * focus;
    float r = Texel(texture, texture_coords + vec2( ca,  ca*0.3)).r;
    float g = tex.g;
    float b = Texel(texture, texture_coords + vec2(-ca, -ca*0.3)).b;
    vec3 col = vec3(r, g, b);
    float lum = dot(col, vec3(0.299, 0.587, 0.114));

    vec3 sepia_dark  = vec3(0.18, 0.14, 0.10);
    vec3 sepia_light = vec3(0.92, 0.86, 0.72);
    col = mix(sepia_dark, sepia_light, lum);

    float ghost_strength = 0.28 * focus;
    vec2 ghost_offset = vec2(0.04, 0.015) * focus;
    vec4 ghost1 = Texel(texture, texture_coords + ghost_offset);
    vec4 ghost2 = Texel(texture, texture_coords + ghost_offset * 1.7);
    col += mix(sepia_dark, sepia_light, dot(ghost1.rgb, vec3(0.299,0.587,0.114))) * ghost_strength;
    col += mix(sepia_dark, sepia_light, dot(ghost2.rgb, vec3(0.299,0.587,0.114))) * ghost_strength * 0.5;
    col /= (1.0 + ghost_strength * 1.5);

    vec2 grain_uv = texture_coords * texture_details.ba;
    float t_frame = floor(time * 12.0);
    col += (noise(grain_uv*0.8+vec2(t_frame*17.3,t_frame*31.7))*0.7 + noise(grain_uv*1.6+vec2(t_frame*41.1,t_frame*13.9))*0.3 - 0.5) * 0.18 * focus;

    float scratch_x = hash(vec2(floor(texture_coords.x*texture_details.b*0.5), t_frame));
    if (scratch_x > 0.97) {
        float sy = fract(texture_coords.y*texture_details.a*0.3+hash(vec2(scratch_x,t_frame)));
        col += (1.0 - smoothstep(0.0, 0.04, abs(sy-0.5))) * 0.35;
    }

    vec2 vc = uv - 0.5;
    float vignette = pow(clamp(1.0-dot(vc,vc)*2.8*focus,0.0,1.0),1.4);
    col *= vignette;
    col = mix(col, col*1.08, clamp(1.0-dot(vc,vc)*0.5-0.5,0.0,1.0));
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