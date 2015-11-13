package com.catamaranHx.ui;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.sensors.Accelerometer;
import openfl.geom.Point;
import openfl.Assets;
import openfl.display.Stage;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.events.AccelerometerEvent;
import motion.Actuate;
import motion.easing.Quad;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.SimpleButton;

 /**
     ImageMask simple ui component to have an image masked.
      _options:Dynamic = {x:0, y:0, image:"assets/image.jpg", text:"name"}
 **/


@:expose('CATAMARAN.ImageMask') class ImageMask extends Sprite {
	
	var _sprite_mask:Sprite;
	var _stage:Stage;
	var _options:Dynamic = {x:0, y:0, rotation:-20};
	var _image:Bitmap;
	var _topLeftStage:Point;
	var _topRightStage:Point;
	var _bottomRightStage:Point;
	var _bottomLeftStage:Point;
	var _width:Float;
	var _height:Float;
	var _acc:Accelerometer = new Accelerometer();
	var _isOpen:Bool = false;



	@:dox(show)
	public function new (_stage:Stage, ?_options:Dynamic) {
		this._stage = _stage;

		if(_options != null){
			this._options = _options;
		}
		super ();
		initialize ();
		construct ();
		setUPTxt(this._options.text);

	}


	
	private function animateCircle (circle:Sprite):Void {
		var duration = 1.5 + Math.random () * 4.5;
		var targetX = Math.random () * this._stage.stageWidth;
		var targetY = Math.random () * this._stage.stageHeight;
		Actuate.tween (circle, duration, { x: targetX, y: targetY }, false).ease (Quad.easeOut).onComplete (animateCircle, [ circle ]);
	}

	private function setUPTxt(_txt:String){
		var format = new TextFormat (Assets.getFont("assets/fonts/OpenSansRegular.ttf").fontName, 30, 0xFFFFFF);
		var textField = new TextField ();
        textField.defaultTextFormat = format;
        textField.x = this._options.textX;
        textField.y = 15;
		textField.text = _txt;
		addChild(textField);
	}
	
	private function construct ():Void {
		var bitmapData = Assets.getBitmapData (this._options.image);
		this._image = new Bitmap (bitmapData);
		var imgMsk = new Sprite();
     	imgMsk.addChild(this._image);
     	//imgMsk.rotation = (this._options.rotation * -1);
     	//imgMsk.y = this._options.rotation;
     	addChild(imgMsk);
		_sprite_mask = new Sprite();
		_sprite_mask.graphics.beginFill(0x000000);
		this._height = this._image.get_height() / 10;
		this._width = this._stage.stageWidth * 1.5;
		_sprite_mask.graphics.drawRect(this._options.x, this._options.y,  this._width, this._height);
		_sprite_mask.graphics.endFill();
		addChild(_sprite_mask);
		imgMsk.mask = _sprite_mask;
		var imgSpr = new Sprite();
     	imgSpr.mouseChildren = true;
		imgSpr.mouseEnabled = true;
		imgSpr.buttonMode = true;
		imgSpr.graphics.beginFill (0x000000,0);
		imgSpr.graphics.drawRect (0, 0, this._stage.stageWidth, this._stage.stageHeight);
		imgSpr.graphics.endFill();
		var bitmapData = Assets.getBitmapData ('assets/imgs/sc9bg1B.jpg');
		var trsp = new Bitmap (bitmapData);
		//trsp.width = this._height;
		//trsp.height = this._width;
		trsp.alpha = 0;
		imgSpr.addChild(trsp);
		imgSpr.addEventListener(MouseEvent.MOUSE_DOWN, openMask);
		addChild(imgSpr);
		
	}
	

	
	private function initialize ():Void {
		mouseChildren = true;
		mouseEnabled = true;
		this._stage.addEventListener (Event.ACTIVATE, stage_onActivate);
		this._stage.addEventListener (Event.DEACTIVATE, stage_onDeactivate);
		addEventListener(Event.ENTER_FRAME, gameLoop);
		untyped window.addEventListener('devicemotion', updateDevice, false);
		//this._stage.addEventListener(MouseEvent.MOUSE_MOVE, scrollDown);
		
	}

	public function openMask(event:MouseEvent){
		parent.setChildIndex(this, parent.numChildren-1);
		untyped window.console.log(this); 
		untyped _mask = this;
		Actuate.tween (_sprite_mask, 2, { height: this._stage.stageHeight, y:0 }, false).ease(Quad.easeOut);
	}

	private function adjustTile(offset:Float, increase:Bool = true):Float{
		var newY = 0.0;
		if(increase){
			newY = this._image.get_y() + offset;
		}else{
			newY = this._image.get_y() - offset;
		}
		return newY;
	} 

	private function updateDevice(_update:Dynamic):Void{
		var acceleration = _update.accelerationIncludingGravity;
		updateTilePos(acceleration.y);

	}

	public function updateTilePos(_y:Float){
		var newY = 0.0;
		var offset = _y * 2;
			if(this._image.get_y() * 1.5  > (this._image.get_height() * -1)  && this._image.get_y() + offset < 0 ){
				newY = adjustTile(offset);
			}
		//untyped console.log(this._image);	
		if(!_isOpen){
			Actuate.tween (this._image, 0.05, { y: newY } );
		}
		
	}

	// Event Handlers
	
	private function stage_onActivate (event:Event):Void {
		
		Actuate.resumeAll ();
		
	}
	
	private function stage_onDeactivate (event:Event):Void {
		
		Actuate.pauseAll ();
		
	}

	 
	// called when the "down" button is clicked  
	private function scrollDown(event:MouseEvent):Void 
	{ 
	  updateTilePos((event.localY * 0.005)); 
	} 
 


	private function gameLoop(event:Event):Void
	{
		this._topLeftStage = this.localToGlobal(new Point(0, 0));
		this._topRightStage = this.localToGlobal(new Point(0, this._height));
		this._bottomRightStage = this.localToGlobal(new Point(this._width, this._height));
		this._bottomLeftStage = this.localToGlobal(new Point(this._width, 0));
	}
	
}