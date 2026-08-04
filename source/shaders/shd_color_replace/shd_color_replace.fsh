varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_fromColor;
uniform vec3 u_toColor;

void main()
{
    vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    tex.rgb = u_toColor;

    gl_FragColor = tex;
}