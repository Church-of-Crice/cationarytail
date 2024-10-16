shader_type canvas_item;

uniform sampler2D my_texture;  // The texture to tile and animate.
uniform vec2 velocity = vec2(0.1, 0.1); // The velocity to move the tiles.
uniform bool pixel_snap = false;
uniform float scale = 1.0;  // Scale factor for texture size on screen (higher values = larger texture)

void fragment() {
    // Adjust UV coordinates by the scale to control the size of the texture on the screen.
    vec2 uv = FRAGCOORD.xy / (vec2(textureSize(my_texture, 0)) * scale);

    // Calculate the displacement based on time, applying it to both axes at the same time.
    vec2 total_displacement = velocity * TIME;

    if (pixel_snap) {
        // Snaps the texture movement to integer pixel steps, ensuring movement on both axes is simultaneous.
        vec2 pixel_displacement = floor(total_displacement * vec2(textureSize(my_texture, 0)) * scale);
        total_displacement = pixel_displacement / vec2(textureSize(my_texture, 0)) / scale;
    }

    // Offset the UV coordinates by the synchronized total displacement.
    uv -= total_displacement;

    // Use modulo to tile the texture without interpolation.
    uv = fract(uv);

    // Sample the texture using the modified UV coordinates.
    COLOR = texture(my_texture, uv);
}
