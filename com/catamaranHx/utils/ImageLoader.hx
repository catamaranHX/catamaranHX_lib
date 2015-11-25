package com.catamaranHx.utils;

import com.catamaranHx.utils.Interface;




class ImageLoader {

	public static inline function getImage(key:String, options:Dynamic):Bitmap{
		#if phaserJS
		untyped window.game.load.image(options.name, key);
		return new Bitmap( untyped window.game, 0, 0, options.name, 0);
		#else
		var bitmapData = Assets.getBitmapData (key);
		return new Bitmap(bitmapData);
		#end
	}

}