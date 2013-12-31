// from THREE.js
/*

*/

#define SPECULAR_GLOSS 15.0
#define SPECULAR_COLOR vec3(1.0, 1.0, 1.0)

uniform vec3 ambientColor;
uniform vec3 directionalLightColor;
uniform vec3 directionalLightDirection;
uniform sampler2D map;

uniform vec3 color;
varying vec3 n;
varying vec3 v;
varying vec2 texCoord;

void main(void)
{
    vec3 l = directionalLightDirection;
    vec3 r = reflect(l, n);
    float diffuse = max(0.0, dot(n, l));
    float specular = pow(max(0.0, dot(r, v)), SPECULAR_GLOSS);
    vec4 tex = texture2D(map, texCoord);
	gl_FragColor.rgb = color * tex.rgb * directionalLightColor * diffuse +
                       SPECULAR_COLOR * specular +
                       ambientColor;
    gl_FragColor.a = tex.a;
}
