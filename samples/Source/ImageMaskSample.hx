package;

import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.Event;
import openfl.events.MouseEvent;
import com.catamaranHx.ui.ImageMask;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Assets;

class ImageMaskSample extends Sprite {
	
	var _sp:Array<Dynamic> = [];
	var _rotation:Float = -20.0;
	var _stage:Stage;
	var _imgString:Array<String> = ['assets/imgs/sc9bg1A.jpg', 'assets/imgs/sc9bg1B.jpg'];

	public function new (stage:Stage) {
		super ();
		_stage = stage;
		this.setTileLoop();
		this.setTileLoop();
		this.setTileLoop();
		this.setTileLoop();
		untyped window._stage = this._stage;
		addEventListener(Event.ENTER_FRAME, gameLoop);
	}

	public function setTileLoop(){
		for(i in 0..._imgString.length){
			setUpTiles(_imgString[i]);
		}
	}

	public function setUpTiles(img:String){
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