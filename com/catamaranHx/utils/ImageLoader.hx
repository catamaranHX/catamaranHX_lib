package com.catamaranHx.utils;

import com.catamaranHx.utils.Interface;
#if !phaserJS
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
#end


class ImageLoader {

	public static inline function getImage(key:String, options:Dynamic):Bitmap{
		#if phaserJS
		return new phaser.gameobjects.Sprite(untyped window.game, 0, 0, options.name, 0);
		#else
		var bitmapData = Assets.getBitmapData (key);
		return new Bitmap(bitmapData);
		#end
	}

}