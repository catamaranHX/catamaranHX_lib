package;


import format.SVG;
import openfl.Lib;
import openfl.Assets;
import openfl.display.Stage;
import openfl.display.Sprite;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.net.URLRequest;
import openfl.display.Shape;
//*SPLASH*import for the top picture
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import motion.Actuate;
import motion.easing.Quad;


//in the preloader YOU HAVE TO use macro to load images or other assets
// instead of Assets.getXXX()

// please provide this files (or change them) in your assets folder
// and add this line to your project.xml
// <assets path="assets/preloader" include="*" if="web" />
//@:font("assets/preloader/square.ttf") class DefaultFont extends Font {}
@:file("assets/preloader/logo.svg") class Svg extends flash.utils.ByteArray {}

class Preloader extends NMEPreloader
{
    // **** CUSTOMISE HERE ****
    static var color = 0x0094f5; //the main color
    static var backgroundColor = 0xFFFFFF; //background color
    //static var color = 0xFFFFFF; //the main color
    //static var backgroundColor = 0x0094f5; //background color

    //static var backgroundColor = 0x000000; //background color
    static var stringLoading = ""; //the loading label text
    // **** END CUSTOMISE ****

    var originalBackgroundColor:Int;

    var w:Float; //height (5%) (bar height)
    var h:Float; //width (90%) (bar width)
    var r:Float; //radius (borders)
    var p:Float; //padding pixels
    var t:Float; //thickness (borders)

    var ww:Float; //current window width
    var hh:Float; 
    var sh:Float;

    var textPercent:TextField; // percentage label
    var textLoading:TextField; // loading label

    var oscillator:Float = 1.0; // alpha for glowing effect
    var oscillatorDirection:Int = -1; // increase or decrease

    var imgMsk:Sprite;
    var shape : Shape = new Shape();




    public function new () {

        super ();

        init ();
        //first resize and listener
        stage_onResize(null);
        Lib.current.stage.addEventListener(Event.RESIZE, stage_onResize);
        Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrame);
        Actuate.tween (imgMsk, 1, { scaleX: 0.5, scaleY: 0.5 }, false).ease(Quad.easeOut).onUpdate(centerLogoSprite).onComplete(
            function(){
                Actuate.tween (imgMsk, 2, { scaleX: 340, scaleY: 340 }, false).ease(Quad.easeOut).onUpdate(centerLogoSprite);
            }
        );
        
        // listener to finish event
        addEventListener(Event.COMPLETE, onComplete);

    }
    public function onComplete (event:Event):Void {
        // restore original background color
        Lib.current.stage.color = originalBackgroundColor;
        Lib.current.stage.removeEventListener(Event.RESIZE, stage_onResize);
        Lib.current.stage.removeEventListener(Event.ENTER_FRAME, onFrame);
        //Lib.current.stage.removeEventListener(MouseEvent.CLICK, gotoWebsite);
    }

    public function centerLogo(){
        imgMsk.x = Lib.current.stage.stageWidth / 2 - (shape.width / 2);
        imgMsk.y = Lib.current.stage.stageHeight / 2 - (shape.height / 2);
    }

    public function centerLogoSprite(){
        imgMsk.x = (Lib.current.stage.stageWidth / 2) - ( (imgMsk.width )  / 2);
        imgMsk.y = (Lib.current.stage.stageWidth / 2) - ( (imgMsk.height )  / 2);
    }

    private function init ():Void {

        //Font.registerFont (DefaultFont);

        originalBackgroundColor = Lib.current.stage.color;
        Lib.current.stage.color = backgroundColor;

        var xmlFile:flash.utils.ByteArray = new Svg();
        var xml:Xml = Xml.parse(xmlFile.toString());
        imgMsk = new Sprite();
        var svg : SVG = new SVG(xmlFile.toString());
        svg.render(shape.graphics);
        shape.scaleX = 1;
        shape.scaleY = 1;
        centerLogo();

        imgMsk.graphics.beginFill(0x0094f5);
        imgMsk.graphics.drawRect(0, 0,  shape.width, shape.height + 40);
        imgMsk.graphics.endFill();
        imgMsk.mask = shape;
        imgMsk.addChild(shape);
        addChild(imgMsk);

        outline.alpha = 0.0;
    }


    private function stage_onResize (event:Event):Void {

        resize (Lib.current.stage.stageWidth, Lib.current.stage.stageHeight);

    }

    private function resize (newWidth:Int, newHeight:Int):Void {

        ww = newWidth;
        hh = newHeight;

        h = 0.05 * hh;      //height (5%) (bar height)
        w = 1.2 * ww;       //width (90%) (bar width)
        p = hh/100;         //padding pixels
        r = hh/50;          //radius (borders)
        t = hh/250;         //thickness (borders)
        var x = (ww-w)/2;   //centered (center bar position x,y)
        var y = hh*0.97;


        progress.x = x;
        progress.y = y;
        progress.scaleX = 1;
        progress.graphics.clear();
        progress.graphics.beginFill(color, 0.5);
        progress.graphics.drawRect(0,0,w,h);
        progress.graphics.endFill();

    }

	public override function onUpdate(bytesLoaded:Int, bytesTotal:Int)
	{
        // calculate the percent loaded
		var percentLoaded = bytesLoaded / bytesTotal;
		if (percentLoaded > 1) percentLoaded = 1;

        // update the progress bar
        progress.graphics.clear();
		progress.graphics.beginFill(color, 0.8);
        progress.graphics.drawRoundRect(0,0,percentLoaded*w,h,r,r);
        progress.graphics.endFill();

	}

    private static inline var SKIP_FRAMES:Int=5;
    private var _skipped_frames:Int=1;

    public function onFrame(event:Event):Void {

        if (_skipped_frames==SKIP_FRAMES) {
            
            // oscillate from 0.3 to 1 and back for the glowing effect
            oscillator += oscillatorDirection * 0.06;
            if (oscillator > 1) {
                oscillatorDirection = -1;
                oscillator = 1.0;
            }
            if (oscillator < 0.3) {
                oscillatorDirection = 1;
                oscillator = 0.3;
            }

            _skipped_frames = 0;

        }
        _skipped_frames++;
    }

}
