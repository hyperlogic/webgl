// from THREE.js
/*
uniform vec3 cameraPosition;
*/

uniform vec3 color;
varying vec3 n;
varying vec3 p;

void main(void)
{
    vec3 v = normalize(cameraPosition - p);
	gl_FragColor.rgb = color.rgb * dot(v, n);
    gl_FragColor.a = 1.0;
}
