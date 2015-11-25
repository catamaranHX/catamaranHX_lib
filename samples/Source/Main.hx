package;

import com.catamaranHx.utils.Interface;

#if phaserJS
import js.Lib;
import phaser.core.Game;
import phaser.Phaser;
#end

class Main extends Sprite {
	public function new () {
		#if phaserJS
			untyped window.game = new Game(800, 600, Phaser.CANVAS, 'phaser');
		#end
		super ();
		var _imgMsk = new ImageMaskSample({stage:stage});
		addChild(_imgMsk);
	}
	#if phaserJS
	static function main ():Void {
		new Main();
	}
	#end
}