package com.catamaranHx.filters;

import openfl.display.Shader;

@:expose('CATAMARAN.filters.DotScreen') class DotScreen extends Shader {

	@fragment var fragment = [
		"uniform vec4 dimensions;" ,
		"uniform float angle;" ,
		"uniform float scale;" ,
		"float pattern()" ,
		"{" ,
		"   float s = sin(angle), c = cos(angle);" ,
		"   vec2 tex = ${Shader.vTexCoord} * dimensions.xy;" ,
		"   vec2 point = vec2(" ,
		"       c * tex.x - s * tex.y," ,
		"       s * tex.x + c * tex.y" ,
		"   ) * scale;" ,
		"   return (sin(point.x) * sin(point.y)) * 4.0;" ,
		"}" ,
		"void main()" ,
		"{" ,
		"   vec4 color = texture2D(${Shader.uSampler}, ${Shader.vTexCoord});" ,
		"   float average = (color.r + color.g + color.b) / 3.0;" ,
		"   gl_FragColor = vec4(vec3(average * 10.0 - 5.0 + pattern()), color.a);" ,
		"}",
	];
	public function new () {
		super ();
	}
	
	
}
