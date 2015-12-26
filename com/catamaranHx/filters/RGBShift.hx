package com.catamaranHx.filters;

import openfl.display.Shader;

@:expose('CATAMARAN.filters.RGBShift') class RGBShift extends Shader {

	@fragment var fragment = [
		"uniform vec4 dimensions;" ,
		"uniform vec2 red;" ,
		"uniform vec2 green;" ,
		"uniform vec2 blue;" ,
		"void main(void)" ,
		"{" ,
		"   gl_FragColor.r = texture2D(${Shader.uSampler}, ${Shader.vTexCoord} + red/dimensions.xy).r;" ,
		"   gl_FragColor.g = texture2D(${Shader.uSampler}, ${Shader.vTexCoord} + green/dimensions.xy).g;" ,
		"   gl_FragColor.b = texture2D(${Shader.uSampler}, ${Shader.vTexCoord} + blue/dimensions.xy).b;" ,
		"   gl_FragColor.a = texture2D(${Shader.uSampler}, ${Shader.vTexCoord}).a;" ,
		"}",
	];
	public function new () {
		super ();
	}
	
	
}
