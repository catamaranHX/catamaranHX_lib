package;

import com.catamaranHx.utils.Interface;
import com.catamaranHx.ui.ImageMask;

class ImageMaskSample extends Sprite {
	
	var _sp:Array<Dynamic> = [];
	var _rotation:Float = -20.0;
	var _stage:Stage;
	var _game:Dynamic = null;
	var _imgString:Array<Dynamic>;


	public function new (options:Dynamic) {
		_stage = options.stage;
		_imgString = options._imgString;
		super();
		this.setTileLoop();
		this.setTileLoop();
		this.setTileLoop();
		this.setTileLoop();
		untyped window._stage = this._stage;
		#if !phaserJS
		_stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		#end
	}

	public function setTileLoop(){
		for(i in 0..._imgString.length){
			setUpTiles(_imgString[i]);
		}
	}

	public function setUpTiles(img:Dynamic){
		var sp = new ImageMask(this._stage, {x:0,y:0, image:img, text:'test', textX:((_rotation * 5 - 20)*-1 ), rotation:_rotation});
		sp.rotation = this._rotation;
		sp.x = sp.rotation * 5;
		sp._initY = sp.y = this.getTileHeight();
		addChild(sp);
		this._sp.push(sp);
	}

	public function getTileHeight():Float{
		var heightOfTile:Float = 0;
		for(i in 0...this._sp.length){
			heightOfTile += this._sp[i]._height;
		}
		return heightOfTile;
	}

	private function gameLoop(event:Event):Void
	{
		untyped window._sp = _sp;
	}

	
	
	
	
}