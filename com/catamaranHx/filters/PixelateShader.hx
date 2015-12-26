package com.catamaranHx.filters;

import openfl.display.Shader;

@:expose('CATAMARAN.filters.PixelateShader') class PixelateShader extends Shader {

	@fragment var fragment = [

		"uniform vec4 dimensions;" ,
		"uniform vec2 pixelSize;" ,
		"void main(void) {" ,
		"   vec2 coord = ${Shader.vTexCoord};" ,
		"   vec2 size = dimensions.xy / pixelSize;" ,
		"   vec2 color = floor( ( ${Shader.vTexCoord} * size ) ) / size + pixelSize / dimensions.xy * 0.5;" ,
		"   gl_FragColor = texture2D(${Shader.uSampler}, color);" ,
		"}",
	];
	
	
	public function new () {
		
		super ();
		
	}
	
	
}
