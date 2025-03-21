shader_type canvas_item;
render_mode blend_mix;

uniform float speed : hint_range(0.1, 5.0) = 2.0;
uniform float strength : hint_range(0.0, 5.0) = 1.0;

void fragment() {
    vec2 uv = UV;
    
    // Sample the texture
    vec4 tex_color = texture(TEXTURE, uv);
    
    // **Green Mask: Detect Green Areas**
    float green_amount = tex_color.g - max(tex_color.r, tex_color.b);
    float is_leaf = step(0.1, green_amount); // 1.0 for leaves, 0.0 for non-leaves

    // **Apply Wave Motion Only to Leaves**
    float offset = sin(TIME * speed + uv.x * 10.0) * strength * is_leaf;

    // Sample the texture again with the offset applied
    vec4 final_color = texture(TEXTURE, uv + vec2(0.0, offset * 0.01));

    // Output final color
    COLOR = final_color;
}

void vertex() {
	// Called for every vertex the material is visible on.
	if (VERTEX.y < 0.0) {
		VERTEX += vec2(sin(TIME * 0.7) * 7.0, 0);
	}
}