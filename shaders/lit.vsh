// from THREE.js
/*
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 normalMatrix;
attribute vec3 position;
attribute vec3 normal;
*/

varying vec3 n;
varying vec3 p;

void main(void)
{
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1);
    n = normalMatrix * normal;
    p.xyz = (modelViewMatrix * vec4(position, 1)).xyz;
}


