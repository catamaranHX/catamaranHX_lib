package com.catamaranHx.utils;

// THIS UI LIBRARY WILL BE BUILT FOR OPENFL AND PHASERJS / PIXI

#if phaserJS


    typedef Sprite              = phaser.gameobjects.Sprite;
    typedef BitmapData          = phaser.gameobjects.BitmapData;
    typedef Graphics       		= phaser.gameobjects.Graphics;
    typedef Bitmap           	= phaser.gameobjects.Image;
    //typedef Text      		= phaser.gameobjects.Text;
    typedef Stage            	= phaser.pixi.display.Stage;
    typedef DisplayObject       = phaser.pixi.display.DisplayObject;
    typedef MovieClip   		= phaser.pixi.display.MovieClip;
    typedef Assets 				= phaser.pixi.loaders.AssetLoader;
    //typedef Circle 			= phaser.geom.Circle;
    //typedef Ellipse 			= phaser.geom.Ellipse;
    //typedef Line		 		= phaser.geom.Line;
    typedef Matrix		 		= phaser.geom.Matrix;
    typedef Point		 		= phaser.geom.Point;
    //typedef Polygon		 	= phaser.geom.Polygon;
    typedef Rectangle 	 		= phaser.geom.Rectangle;
   	//typedef RoundedRectangle 	= phaser.geom.RoundedRectangle;
   	typedef Event				= phaser.gameobjects.components.Events;
   	typedef Mouse				= phaser.input.Mouse;
   	typedef Keyboard			= phaser.input.Keyboard;
   	typedef Touch				= phaser.input.Touch;
   	typedef Gamepad				= phaser.input.Gamepad;
    
    typedef Tween               = phaser.tween.Tween;
    typedef EaseLinear          = phaser.tween.Easing.Linear;
    typedef EaseQuartic         = phaser.tween.Easing.Quartic;
    typedef EaseCubic           = phaser.tween.Easing.Cubic;
    typedef EaseQuad            = phaser.tween.Easing.Quadratic;
    typedef EaseSin             = phaser.tween.Easing.Sinusoidal;
    typedef EaseExponential     = phaser.tween.Easing.Exponential;
    //typedef EaseCircular        = Phaser.Easing.Circular;
    typedef EaseElastic         = phaser.tween.Easing.Elastic;
    typedef EaseBack            = phaser.tween.Easing.Back;
    typedef EaseBounce          = phaser.tween.Easing.Bounce;

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
    //typedef Polygon		 	= openfl.geom.Polygon;
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
    //typedef EaseCircular        = motion.easing.Circular;
    typedef EaseElastic         = motion.easing.Elastic;
    typedef EaseBack            = motion.easing.Back;
    typedef EaseBounce          = motion.easing.Bounce;

#end

