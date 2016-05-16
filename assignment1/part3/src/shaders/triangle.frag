// Fragment shader
#version 150

out vec4 frag_color;

uniform float u_time;

void main() {
    frag_color = vec4(sin(u_time), sin(u_time+3.14*2/3), sin(u_time+3.14*2*2/3), 1.0);
}
