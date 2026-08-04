varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_fromColor;
uniform vec3 u_toColor;

void main()
{
    vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    // Small tolerance because texture colors aren't always exact.
    const float tolerance = 1.0 / 255.0;

    if (distance(tex.rgb, u_fromColor) <= tolerance)
    {
        tex.rgb = u_toColor;
    }

    gl_FragColor = tex;
}