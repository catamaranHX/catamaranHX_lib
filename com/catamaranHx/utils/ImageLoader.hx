package com.catamaranHx.utils;

import com.catamaranHx.utils.Interface;
#if !pixiJS
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
#end


class ImageLoader {

	public static inline function getImage(key:String, options:Dynamic):Bitmap{
		#if pixiJS
		return new Bitmap.fromImage(key);
		#else
		return new Bitmap(Assets.getBitmapData(key));
		#end
	}

}