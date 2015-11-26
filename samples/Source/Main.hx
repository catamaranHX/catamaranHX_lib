package;

import com.catamaranHx.utils.Interface;

#if phaserJS
import js.Lib;
import phaser.core.Game;
import phaser.Phaser;
#end

class Main extends Sprite {
	public var _imgString:Array<Dynamic> = [{key:'sc9bg1A', asset:'assets/imgs/sc9bg1A.jpg'}, {key:'sc9bg1B', asset:'assets/imgs/sc9bg1B.jpg'}];

	public function new () {
		#if phaserJS
			untyped window.game = new Game(800, 600, Phaser.CANVAS, 'phaser', { preload: preload, create: create } ); //add create methdo..
		#end
		super ();
		#if !phaserJS
			create();
		#end	
	}
	#if phaserJS
	static function main ():Void {
		new Main();
	}
	#end

	public function preload() {
    	untyped window.game.load.image(_imgString[0].key, _imgString[0].asset);
    	untyped window.game.load.image(_imgString[1].key, _imgString[1].asset);
	}

	public function create() {
		if(stage == null){
			 stage = untyped window.game;
		}
		var _imgMsk = new ImageMaskSample({stage:stage, _imgString:_imgString });
		addChild(_imgMsk);
	   
	}

}