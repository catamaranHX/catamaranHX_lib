package com.catamaranHx;

import com.catamaranHx.ui;
import openfl.display.*;

 /**
     catamaranHx root class
     catamaranHx array of self executing anonymous functions 
	 _glFunc:Dynamic  array of self executing anonymous functions

 **/


@:expose('CATAMARAN')  class Catamaran {
	
	public var _mobileOS:String;
	public var _stage:Stage;
	public var _glFunc:Array<Dynamic>;

	@:dox(show)
	public function new (_stage:Stage, ?_options:Dynamic) {
		this._stage = _stage;
		addEventListener(Event.ENTER_FRAME, _gL);
		trace("            `--.-+.        `--..--o.               \n           `.---+..``     `------o.               \n           `-.--+. .``.`:/.//:.--o.               \n           `----+ossoyyyyyys/.---o.               \n          ..:oyhysosssssoooooo/:-o.               \n        `.+sooossoo+oos-.:+++++oos:               \n           +ys++oo+++/++/--/ssyoohho-             \n            /yysoo+//+osys/..-/  ./sys/`          \n             -yyyo+oso/-`           ./sy+-        \n              `oyyy:`                  `/ss-      \n                :yys.                     `.      \n                 `oyy:                            \n                   -sy+`                          \n                     :so`                         \n                       -s`                        \n                                  CatamaranHX 0.01a by Brendon Smith http://bit.ly/CatamaranHX")

	}
	 /**
     catamaranHx this is the main game loop where most of the events will take place 
 	**/
	@:dox(show)
	private function _gL(event:Event):Void
	{
		for(i in 0..._glFunc.length){
			try{
				_glFunc[i];
			}catch(e:Dynamic){
				trace(e);
			}
		}
	}


	#if html5
	function extend(ns, ns_string):Dynamic {
        var parts = ns_string.split('.');
        var parent = ns;
        var pl;
        var i;
        if (parts[0] == "CATAMARAN") {
            parts = parts.slice(1);
        }
        pl = parts.length;
        for (i in 0...pl) {
            if (typeof parent[parts[i]] == 'undefined') {
                parent[parts[i]] = {};
            }
            parent = parent[parts[i]];
        }
        return parent;
    }

    function findCenter(selector:String) {
        return untyped document.querySelector(selector).offsetWidth / 2;
    }

    function getRandomArr(arr:Array<Dynamic>):Dynamic {
        return Math.floor(Math.random() * arr.length);
    }

    function isMobile():Void {
        switch (true) {
            case /Android/i.test(navigator.userAgent):
                this._mobileOS = 'android';
                return true;
            case /webOS/i.test(navigator.userAgent):
                this._mobileOS = 'webos';
                return true;
            case /iPhone/i.test(navigator.userAgent):
                this._mobileOS = 'iphone';
                return true;
            case /iPad/i.test(navigator.userAgent):
                this._mobileOS = 'ipad';
                return true;
            case /iPod/i.test(navigator.userAgent):
                this._mobileOS = 'ipod';
                return true;
            case /BlackBerry/i.test(navigator.userAgent):
                this._mobileOS = 'blackberry';
                return true;
            case /Windows Phone/i.test(navigator.userAgent):
                this._mobileOS = 'windows';
                return true;
            default:
                return false;
        }
    }

	#enif
	
	
}