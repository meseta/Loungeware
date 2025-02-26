//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec3 vert_pos;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    
    mat4 world = gm_Matrices[MATRIX_WORLD_VIEW];
    // world[0][0] = distance()
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
	v_vTexcoord = vec2(in_TextureCoord.x, 1.0 - in_TextureCoord.y); // lmao
    
    vert_pos = (gm_Matrices[MATRIX_WORLD] * object_space_pos).xyz;
}