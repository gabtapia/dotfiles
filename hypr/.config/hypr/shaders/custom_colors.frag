precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 texColor = texture2D(tex, v_texcoord);
    vec3 color = texColor.rgb;

    // 1. Ajuste de Contraste (65% -> fator 1.3) e Brilho (55% -> fator 1.1)
    color = (color - 0.5) * 1.3 + 0.5;
    color = color * 1.1;

    // 2. Ajuste de Gama (0.86)
    color = pow(max(color, vec3(0.0)), vec3(1.0 / 0.86));

    // 3. Ajuste de Digital Vibrance (65% -> fator 1.65)
    float luma = dot(color, vec3(0.2126, 0.7152, 0.0722));
    color = mix(vec3(luma), color, 1.65);

    gl_FragColor = vec4(color, texColor.a);
}
