RSRC                    VisualShader            ��������                                            5      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    linked_parent_graph_frame    input_name    script    op_type 	   operator 	   function    parameter_name 
   qualifier    default_value_enabled    default_value    code    graph_offset    mode    modes/blend    flags/skip_vertex_transform    flags/unshaded    flags/light_only    flags/world_vertex_coords    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/4/node    nodes/fragment/4/position    nodes/fragment/5/node    nodes/fragment/5/position    nodes/fragment/6/node    nodes/fragment/6/position    nodes/fragment/7/node    nodes/fragment/7/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        $   local://VisualShaderNodeInput_wycg6 �      '   local://VisualShaderNodeVectorOp_rr3yq       )   local://VisualShaderNodeVectorFunc_ttdh2 9      '   local://VisualShaderNodeVectorOp_h6lna p      -   local://VisualShaderNodeColorParameter_hkxoi �         res://assets/water.tres           VisualShaderNodeInput                             color          VisualShaderNodeVectorOp             VisualShaderNodeVectorFunc    
                   VisualShaderNodeVectorOp    	                  VisualShaderNodeColorParameter                             color_water          VisualShader          �  shader_type canvas_item;
render_mode blend_mix;

uniform vec4 color_water : source_color;



void fragment() {
// Input:3
	vec4 n_out3p0 = COLOR;


// VectorFunc:5
	vec3 n_out5p0 = vec3(1.0) - vec3(n_out3p0.xyz);


// ColorParameter:7
	vec4 n_out7p0 = color_water;


// VectorOp:6
	vec3 n_out6p0 = n_out5p0 * vec3(n_out7p0.xyz);


// VectorOp:4
	vec3 n_out4p0 = vec3(n_out3p0.xyz) + n_out6p0;


// Output:0
	COLOR.rgb = n_out4p0;


}
                       
     �C  HC                
     R�  \C               
     HC  �C               
     ��  �C             !   
   �%&�݄�C"            #   
   �B�JdD$                                                                                                   RSRC