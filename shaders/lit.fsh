// from THREE.js
/*

*/

uniform vec3 ambientColor;
uniform vec3 directionalLightColor;
uniform vec3 directionalLightDirection;

uniform vec3 color;
varying vec3 n;
varying vec3 v;

void main(void)
{
    vec3 l = directionalLightDirection;
    vec3 r = reflect(l, n);
	gl_FragColor.rgb = directionalLightColor * max(0.0, dot(n, l)) + ambientColor;
    gl_FragColor.a = 1.0;
}
