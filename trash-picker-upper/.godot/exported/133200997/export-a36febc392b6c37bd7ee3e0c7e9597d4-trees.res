RSRC                    VisualShader            ��������                                            ;      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    linked_parent_graph_frame    input_name    script 	   operator 	   function    op_type    code    graph_offset    mode    modes/blend    flags/skip_vertex_transform    flags/unshaded    flags/light_only    flags/world_vertex_coords    nodes/vertex/0/position    nodes/vertex/2/node    nodes/vertex/2/position    nodes/vertex/3/node    nodes/vertex/3/position    nodes/vertex/4/node    nodes/vertex/4/position    nodes/vertex/5/node    nodes/vertex/5/position    nodes/vertex/6/node    nodes/vertex/6/position    nodes/vertex/7/node    nodes/vertex/7/position    nodes/vertex/8/node    nodes/vertex/8/position    nodes/vertex/9/node    nodes/vertex/9/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        $   local://VisualShaderNodeInput_do8y6 [      &   local://VisualShaderNodeFloatOp_p23rm �      (   local://VisualShaderNodeFloatFunc_jljql �      &   local://VisualShaderNodeFloatOp_cecr5 (	      ,   local://VisualShaderNodeVectorCompose_ib0ff �	      $   local://VisualShaderNodeInput_yppdb �	      !   local://VisualShaderNodeIf_4yadr 
      '   local://VisualShaderNodeVectorOp_0ki21 &
      $   local://VisualShaderNodeInput_jo8l4 O
      $   local://VisualShaderNodeInput_gr472 �
         res://assets/trees.tres �
         VisualShaderNodeInput             time          VisualShaderNodeFloatOp                                      �?                  VisualShaderNodeFloatFunc    	                   VisualShaderNodeFloatOp                                      �@                  VisualShaderNodeVectorCompose             VisualShaderNodeInput                             vertex          VisualShaderNodeIf             VisualShaderNodeVectorOp             VisualShaderNodeInput                             uv          VisualShaderNodeInput             texture          VisualShader          �  shader_type canvas_item;
render_mode blend_mix;




void vertex() {
// Input:7
	vec2 n_out7p0 = VERTEX;
	float n_out7p2 = n_out7p0.g;


// Input:2
	float n_out2p0 = TIME;


// FloatOp:3
	float n_in3p1 = 1.00000;
	float n_out3p0 = n_out2p0 * n_in3p1;


// FloatFunc:4
	float n_out4p0 = sin(n_out3p0);


// FloatOp:5
	float n_in5p1 = 7.00000;
	float n_out5p0 = n_out4p0 * n_in5p1;


// VectorCompose:6
	float n_in6p1 = 0.00000;
	float n_in6p2 = 0.00000;
	vec3 n_out6p0 = vec3(n_out5p0, n_in6p1, n_in6p2);


	vec3 n_out8p0;
// If:8
	float n_in8p1 = 0.00000;
	float n_in8p2 = 0.00001;
	vec3 n_in8p3 = vec3(0.00000, 0.00000, 0.00000);
	vec3 n_in8p4 = vec3(0.00000, 0.00000, 0.00000);
	if(abs(n_out7p2 - n_in8p1) < n_in8p2)
	{
		n_out8p0 = n_in8p3;
	}
	else if(n_out7p2 < n_in8p1)
	{
		n_out8p0 = n_out6p0;
	}
	else
	{
		n_out8p0 = n_in8p4;
	}


// VectorOp:9
	vec3 n_out9p0 = vec3(n_out7p0, 0.0) + n_out8p0;


// Output:0
	VERTEX = vec2(n_out9p0.xy);


}
                       
    ��D  �B                
     �  �C               
     ��  �C               
     p�  �C               
     C  �C               
     �C  �C               
     pC  �B             !   
   o�D��C"            #   
     MD  C$       $                                                                                            	             	       	               %   
     D  �B&            '   
     �  �B(         	   )   
     ��  �C      RSRC