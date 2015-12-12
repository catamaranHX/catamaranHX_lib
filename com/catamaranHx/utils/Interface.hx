package com.catamaranHx.utils;

// THIS UI LIBRARY WILL BE BUILT FOR OPENFL AND PHASERJS / PIXI

#if pixiJS


    typedef Sprite              = pixi.core.sprites.Sprite;
    typedef BitmapData          = pixi.core.graphics.GraphicsData;
    typedef Graphics       		= pixi.core.graphics.Graphics;
    typedef Bitmap           	= pixi.core.textures.Texture;
    //typedef Text      		= phaser.gameobjects.Text;
    typedef Stage            	= pixi.core.display.Container;
    typedef DisplayObject       = pixi.core.display.DisplayObject;
    typedef MovieClip   		= pixi.extras.MovieClip;
    typedef Assets 				= pixi.loaders.ResourceLoader;
    typedef Circle 			    = pixi.core.math.shapes.Circle;
    //typedef Ellipse 			= pixi.core.math.shapes.Ellipse;
    //typedef Line		 		= phaser.geom.Line;
    typedef Matrix		 		= pixi.core.math.Matrix;
    typedef Point		 		= pixi.core.math.Point;
    typedef Polygon		 	    = pixi.core.math.shapes.Polygon;
    typedef Rectangle 	 		= pixi.core.math.shapes.Rectangle;
   	typedef RoundedRectangle 	= pixi.core.math.shapes.RoundedRectangle;
   	/*typedef Event				= pixi.interaction.EventTarget;

   	typedef Mouse				= phaser.input.Mouse;
   	typedef Keyboard			= phaser.input.Keyboard;
   	typedef Touch				= phaser.input.Touch;
   	typedef Gamepad				= phaser.input.Gamepad;*/
    
    typedef Tween               = motion.Actuate;
    typedef EaseLinear          = motion.easing.Linear;
    typedef EaseQuartic         = motion.easing.Quart;
    typedef EaseCubic           = motion.easing.Cubic;
    typedef EaseQuad            = motion.easing.Quad;
    typedef EaseSin             = motion.easing.Sine;
    typedef EaseExponential     = motion.easing.Expo;
    //typedef EaseCircular      = motion.easing.Circular;
    typedef EaseElastic         = motion.easing.Elastic;
    typedef EaseBack            = motion.easing.Back;
    typedef EaseBounce          = motion.easing.Bounce;

#else
    typedef Sprite              = openfl.display.Sprite;
    typedef BitmapData          = openfl.display.BitmapData;
    typedef Graphics       		= openfl.display.Graphics;
    typedef Bitmap           	= openfl.display.Bitmap;
    //typedef Text      		= phaser.gameobjects.Text;
    typedef Stage            	= openfl.display.Stage;
    typedef DisplayObject       = openfl.display.DisplayObject;
    typedef MovieClip   		= openfl.display.MovieClip;
    typedef Assets 				= openfl.Assets;
    //typedef Circle 			= openfl.geom.Circle;
    //typedef Ellipse 			= openfl.geom.Ellipse;
    //typedef Line		 		= openfl.geom.Line;
    typedef Matrix		 		= openfl.geom.Matrix;
    typedef Point		 		= openfl.geom.Point;
    //typedef Polygon		 	    = openfl.geom.Polygon;
    typedef Rectangle 	 		= openfl.geom.Rectangle;
	//typedef RoundedRectangle 	= openfl.geom.RoundedRectangle;
	typedef Event 				= openfl.events.Event;
	typedef Mouse 				= openfl.events.MouseEvent;
	typedef Keyboard 			= openfl.events.KeyboardEvent;
	typedef Touch 				= openfl.events.TouchEvent;
	typedef Gamepad 			= openfl.events.GameInputEvent;

    typedef Tween               = motion.Actuate;
    typedef EaseLinear          = motion.easing.Linear;
    typedef EaseQuartic         = motion.easing.Quart;
    typedef EaseCubic           = motion.easing.Cubic;
    typedef EaseQuad            = motion.easing.Quad;
    typedef EaseSin             = motion.easing.Sine;
    typedef EaseExponential     = motion.easing.Expo;
    //typedef EaseCircular      = motion.easing.Circular;
    typedef EaseElastic         = motion.easing.Elastic;
    typedef EaseBack            = motion.easing.Back;
    typedef EaseBounce          = motion.easing.Bounce;

#end

