shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform int levels = 3;
uniform float spread = 0.01;
uniform float blur_radius : hint_range(0, 1) = 0.2;
uniform float blur_amount : hint_range(0, 5) = 1.0;
uniform float blur_inner : hint_range(0, 1) = 0.6;
uniform float blur_outer : hint_range(0, 1) = 0.66;

vec3 chromatic_slice(float t){
    vec3 res = vec3(1.0 - t, 1.0 - abs(t - 1.0), t - 1.0);
    return max(res, 0.0);
}

void fragment() {
    vec3 sum = vec3(0);
    vec2 offset = (UV - vec2(0.5)) * vec2(1,-1);

    vec4 pixelColor = texture(screen_texture, UV);
    vec4 blurColor = textureLod(screen_texture, SCREEN_UV, blur_amount);

    float distance = length(UV - vec2(0.5, 0.5));
    float blur = smoothstep(blur_inner - blur_radius, blur_outer, distance);

    for(int i = 0; i < levels; i++){
        float t = 2.0 * float(i) / float(levels - 1); 
        vec3 slice = chromatic_slice(t);
        sum += slice;
        vec2 slice_offset = (t - 1.0) * spread * offset;
        pixelColor.rgb += slice * texture(screen_texture, SCREEN_UV + slice_offset).rgb;
    }

    pixelColor.rgb /= sum;
    pixelColor.rgb = mix(blurColor.rgb, pixelColor.rgb, -blur);
    
    COLOR = pixelColor;
}
