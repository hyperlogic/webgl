// from THREE.js
/*

*/

#define SPECULAR_GLOSS 15.0
#define SPECULAR_COLOR vec3(1.0, 1.0, 1.0)
#define PI_OVER_TWO 1.5707963267948966

uniform vec3 ambientColor;
uniform vec3 directionalLightColor;
uniform vec3 directionalLightDirection;
uniform sampler2D diffuseMap;
uniform sampler2D specularMap;

uniform vec3 color;
varying vec3 n;
varying vec3 v;
varying vec2 texCoord;

void main(void)
{
    vec3 l = directionalLightDirection;
    vec3 r = reflect(l, n);
    float diffuse = max(0.0, dot(n, l));
    vec4 diffuseTex = texture2D(diffuseMap, texCoord);
    float offset = (diffuseTex.r * 2.0) - 1.0;
    float theta = acos(max(0.0, dot(r + 0.2 * offset, v)));  // 0 < theta < PI/2
    vec3 specular = texture2D(specularMap, vec2(theta / PI_OVER_TWO, 0.5)).rgb;
	gl_FragColor.rgb = color * diffuseTex.rgb * directionalLightColor * diffuse +
                       specular + ambientColor;
    gl_FragColor.a = diffuseTex.a;
}
