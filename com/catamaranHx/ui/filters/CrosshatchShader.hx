
import openfl.display.Shader;

class CrosshatchShader extends Shader {

	@fragment var fragment = [
		"void main(void)" ,
		"{" ,
		"    float lum = length(texture2D(${Shader.uSampler}, ${Shader.vTexCoord}.xy).rgb);" ,
		"    gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);" ,
		"    if (lum < 1.00)" ,
		"    {" ,
		"        if (mod(gl_FragCoord.x + gl_FragCoord.y, 10.0) == 0.0)" ,
		"        {" ,
		"            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);" ,
		"        }" ,
		"    }" ,
		"    if (lum < 0.75)" ,
		"    {" ,
		"        if (mod(gl_FragCoord.x - gl_FragCoord.y, 10.0) == 0.0)" ,
		"        {" ,
		"            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);" ,
		"        }" ,
		"    }" ,
		"    if (lum < 0.50)" ,
		"    {" ,
		"        if (mod(gl_FragCoord.x + gl_FragCoord.y - 5.0, 10.0) == 0.0)" ,
		"        {" ,
		"            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);" ,
		"        }" ,
		"    }" ,
		"    if (lum < 0.3)" ,
		"    {" ,
		"        if (mod(gl_FragCoord.x - gl_FragCoord.y - 5.0, 10.0) == 0.0)" ,
		"        {" ,
		"            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);" ,
		"        }" ,
		"    }" ,
		"}",
	];
	public function new () {
		super ();
	}
	
	
}
