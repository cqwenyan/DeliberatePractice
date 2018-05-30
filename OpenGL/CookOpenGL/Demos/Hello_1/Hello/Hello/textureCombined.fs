#version 330 core
out vec4 FragColor;

in vec3 ourColor;
in vec2 TexCoord;

// texture samplers
uniform sampler2D textureOne;
uniform sampler2D textureTwo;

void main()
{
	// linearly interpolate between both textures (80% container, 20% awesomeface)
	FragColor = mix(texture(textureOne, TexCoord), texture(textureTwo, TexCoord), 0.2);
}