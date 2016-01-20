package com.catamaranHx.filters;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Shader;
import openfl.Assets;
import openfl.Lib;
import openfl.filters.*;
import openfl.events.*;

@:expose('CATAMARAN.filters.CubeTransitionFilter') class  CubeTransitionFilter extends ShaderFilter {
		public var _progressInc:Float = 1.0;
		public var _container:Sprite;
		public var _startInc = 1;
		public var _prevInc = 0;
		private var _imgArr:Array<String>; 
		public var _reset:Bool;
		public var _progress= new GLShaderParameter("float");
		public var _persp:GLShaderParameter = new GLShaderParameter("float");
		public var _unzoom:GLShaderParameter = new GLShaderParameter("float");
		public var _reflection:GLShaderParameter = new GLShaderParameter("float");
		public var _floating:GLShaderParameter = new GLShaderParameter("float");
		public var _resolution:GLShaderParameter = new GLShaderParameter("vec2");
		public var _from:GLShaderParameter = new GLShaderParameter("sampler2D");
		public var _to:GLShaderParameter = new GLShaderParameter("sampler2D");

		public function new (_containerV:Sprite = null, _perspV:Float = 0.8, _unzoomV:Float = 0.2, _reflectionV:Float = 0.4, _floatingV:Float = 1.0,  _resolutionV:Array<Float>, _imgArrV:Array<String>){
			

			this.shader = new CubeTransition2();
			super(this.shader);

			_progress.value = [_progressInc];
			shader.data.set('progress', _progress);

			this._persp.value = [_perspV];
			shader.data.set('persp', this._persp);


			_unzoom.value = [_unzoomV];
			shader.data.set('unzoom', _unzoom);


			_reflection.value = [_reflectionV];
			shader.data.set('reflection', _reflection);

			_floating.value = [_floatingV];
			shader.data.set('floating', _floating);

			_resolution.value = _resolutionV;
			shader.data.set('resolution',_resolution );

			this._imgArr = _imgArrV;

			Assets.loadBitmapData (_imgArrV[0], function(bitmapData:BitmapData):Void {
				setBitmapData(false, bitmapData);
	    	});

	    	Assets.loadBitmapData (_imgArrV[1], function(bitmapData:BitmapData):Void {
				setBitmapData(true, bitmapData);
	    	});

	    	_container = _containerV;

	  		_container.addEventListener(MouseEvent.CLICK, initFlip);

	  		untyped window._container = _container;

		}

	public function setBitmapData(isTo:Bool = false, _bitmapDataV:BitmapData){
		if(isTo){
			untyped console.log(_bitmapDataV); 
			untyped window._bit = _bitmapDataV;
			/*_bitmapDataV.width = _resolution.value[0];
			_bitmapDataV.height = _resolution.value[1];*/
			_to.bitmap = _bitmapDataV;
			shader.data.set('to', _to );
			addFilter();
		}else{
			/*_bitmapDataV.width = _resolution.value[0];
			_bitmapDataV.height = _resolution.value[1];*/
			_from.bitmap = _bitmapDataV;
			shader.data.set('from', _from );
		}
	}

	public function countDown(){
    	if(_progressInc > 0.0){
			_progressInc -= 0.008;
		}
    }

	public function addFilter(){
		_container.filters = [this];
	}

	public function resetCube(_fromPicPathV:String, _toPicPathV:String, _resetV:Bool = true){
			_reset = _resetV;
    		_container.removeEventListener(Event.ENTER_FRAME, onCubeFlip);
			
			Assets.loadBitmapData (_fromPicPathV, function(bitmapData:BitmapData):Void {
					setBitmapData(false, bitmapData);
    		});
			Assets.loadBitmapData (_toPicPathV,  function(bitmapData:BitmapData):Void {
					setBitmapData(true, bitmapData);
    		});

			if(_reset){
				_progressInc = 1.0;
			}
			_container.addEventListener(MouseEvent.CLICK, initFlip);
    }

	private function initFlip(event:Event):Void {
    	_container.addEventListener(Event.ENTER_FRAME, onCubeFlip);
    }


    private function onCubeFlip(event:Event){
    		_container.removeEventListener(MouseEvent.CLICK, initFlip);
			countDown();
			if(_progressInc == 0.0 || _progressInc <= 0.0){
				_startInc++;
				if(_startInc < this._imgArr.length){
					var reset = true;
					if(_startInc == this._imgArr.length){
						reset = false;
					}
					resetCube(_imgArr[_startInc],_imgArr[(_prevInc)], reset);
					_prevInc = _startInc;
				}
				
			}
			_progress.value = [_progressInc];
	        addFilter();
    } 

}

@:expose('CATAMARAN.filters.CubeTransition') class CubeTransition2 extends Shader {
	//http://transitions.glsl.io/transition/ee15128c2b87d0e74dee

	@fragment var fragment = [
		"uniform sampler2D from, to;" ,
		"uniform float progress;" ,
		"uniform vec2 resolution;" ,
		"uniform float persp;" ,
		"uniform float unzoom;" ,
		"uniform float reflection;" ,
		"uniform float floating;" ,
		"vec2 project (vec2 p) {" ,
		"  return p * vec2(1.0, -1.2) + vec2(0.0, -floating/100.);" ,
		"}" ,
		"bool inBounds (vec2 p) {" ,
		"  return all(lessThan(vec2(0.0), p)) && all(lessThan(p, vec2(1.0)));" ,
		"}" ,
		"vec4 bgColor (vec2 p, vec2 pfr, vec2 pto) {" ,
		"  vec4 c = vec4(0.0, 0.0, 0.0, 1.0);" ,
		"  pfr = project(pfr);" ,
		"  if (inBounds(pfr)) {" ,
		"    c += mix(vec4(0.0), texture2D(from, pfr), reflection * mix(1.0, 0.0, pfr.y));" ,
		"  }" ,
		"  pto = project(pto);" ,
		"  if (inBounds(pto)) {" ,
		"    c += mix(vec4(0.0), texture2D(to, pto), reflection * mix(1.0, 0.0, pto.y));" ,
		"  }" ,
		"  return c;" ,
		"}" ,
		"// p : the position" ,
		"// persp : the perspective in [ 0, 1 ]" ,
		"// center : the xcenter in [0, 1] 0.5 excluded" ,
		"vec2 xskew (vec2 p, float persp, float center) {" ,
		"  float x = mix(p.x, 1.0-p.x, center);" ,
		"  return (" ,
		"    (" ,
		"      vec2( x, (p.y - 0.5*(1.0-persp) * x) / (1.0+(persp-1.0)*x) )" ,
		"      - vec2(0.5-distance(center, 0.5), 0.0)" ,
		"    )" ,
		"    * vec2(0.5 / distance(center, 0.5) * (center<0.5 ? 1.0 : -1.0), 1.0)" ,
		"    + vec2(center<0.5 ? 0.0 : 1.0, 0.0)" ,
		"  );" ,
		"}" ,
		"void main() {" ,
		"  vec2 op = gl_FragCoord.xy / resolution.xy;" ,
		"  float uz = unzoom * 2.0*(0.5-distance(0.5, progress));" ,
		"  vec2 p = -uz*0.5+(1.0+uz) * op;" ,
		"  vec2 fromP = xskew(" ,
		"    (p - vec2(progress, 0.0)) / vec2(1.0-progress, 1.0)," ,
		"    1.0-mix(progress, 0.0, persp)," ,
		"    0.0" ,
		"  );" ,
		"  vec2 toP = xskew(" ,
		"    p / vec2(progress, 1.0)," ,
		"    mix(pow(progress, 2.0), 1.0, persp)," ,
		"    1.0" ,
		"  );" ,
		"  if (inBounds(fromP)) {" ,
		"    gl_FragColor = texture2D(from, fromP);" ,
		"  }" ,
		"  else if (inBounds(toP)) {" ,
		"    gl_FragColor = texture2D(to, toP);" ,
		"  }" ,
		"  else {" ,
		"    gl_FragColor = bgColor(op, fromP, toP);" ,
		"  }" ,
		"}"
	];


	public function new () {
		super ();
		
	}
	
}
