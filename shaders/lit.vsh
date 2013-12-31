// from THREE.js
/*
uniform mat4 modelViewMatrix;
uniform mat4 modelMatrix;
uniform mat4 projectionMatrix;
uniform mat4 normalMatrix;
uniform vec3 cameraPosition;
attribute vec3 position;
attribute vec3 normal;
*/

varying vec3 n;
varying vec3 v;

void main(void)
{
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1);
    n = normalMatrix * normal;
    vec3 p = (modelMatrix * vec4(position, 1)).xyz;
    v = normalize(p - cameraPosition);
}


