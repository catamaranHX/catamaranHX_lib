package com.catamaranHx.filters;

import openfl.display.Shader;

@:expose('CATAMARAN.filters.Noise') class Noise extends Shader {

	@fragment var fragment = [
		"uniform float noise;" ,
		"float rand(vec2 co)" ,
		"{" ,
		"    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);" ,
		"}" ,
		"void main()" ,
		"{" ,
		"    vec4 color = texture2D(${Shader.uSampler}, ${Shader.vTexCoord});" ,
		"    float diff = (rand(${Shader.vTexCoord}) - 0.5) * noise;" ,
		"    color.r += diff;" ,
		"    color.g += diff;" ,
		"    color.b += diff;" ,
		"    gl_FragColor = color;" ,
		"}",
	];
	public function new () {
		super ();
	}
	
	
}
