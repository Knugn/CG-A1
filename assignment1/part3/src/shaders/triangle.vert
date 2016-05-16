// Vertex shader
#version 150
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in vec4 a_position;

uniform float u_time;

void main() {
	float c = cos(u_time);
	float s = sin(u_time);
	mat4 R = mat4(
		c,s,0,0,
		-s,c,0,0,
		0,0,0,0,
		0,0,0,1);
    gl_Position = R * a_position;
}
