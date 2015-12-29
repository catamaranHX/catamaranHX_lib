package com.catamaranHx.filters;

import openfl.display.Shader;

@:expose('CATAMARAN.filters.Displacement') class Displacement extends Shader {
	@vertex var vertex = [
		"uniform mat3 otherMatrix;" ,
		"varying vec2 vMapCoord;" ,
		"void main(void)" ,
		"{" ,
		"   gl_Position = vec4((${Shader.uProjectionMatrix} * vec3(${Shader.aPosition}, 1.0)).xy, 0.0, 1.0);" ,
		"   ${Shader.vTexCoord} = ${Shader.aTexCoord};" ,
		"   vMapCoord = ( otherMatrix * vec3( ${Shader.aTexCoord}, 1.0)  ).xy;" ,
		"   ${Shader.vColor} = vec4(${Shader.aColor}.rgb * ${Shader.aColor}.a, ${Shader.aColor}.a);" ,
		"}",
	];

	@fragment var fragment = [
		"varying vec2 vMapCoord;" ,
		"uniform vec2 scale;" ,
		"uniform sampler2D mapSampler;" ,
		"void main(void)" ,
		"{" ,
		"   vec4 map =  texture2D(mapSampler, vMapCoord);" ,
		"   map -= 0.5;" ,
		"   map.xy *= scale;" ,
		"   gl_FragColor = texture2D(${Shader.uSampler}, vec2(${Shader.vTexCoord}.x + map.x, ${Shader.vTexCoord}.y + map.y));" ,
		"}",
	];
	public function new () {
		super ();
	}
	
	
}
