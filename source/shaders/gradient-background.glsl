uniform vec4 color1;
uniform vec4 color2;

vec4 effect(vec4 color, sampler2D tex, vec2 uv, vec2 screen_coord) {
    return mix(color1, color2, uv.y);
}
