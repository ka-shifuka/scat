vec4 effect(vec4 color, sampler2D tex, vec2 uv, vec2 screen_coord) {
    vec4 pixel = texture2D(tex, uv);

    return vec4(color.r * pixel.r, color.g * pixel.g, color.b * pixel.b, uv.y * pixel.a);
}
