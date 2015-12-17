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
import openfl.utils.ByteArray;
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


//@:file("assets/preloader/logo.svg") class SvgImg extends ByteArray {}


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

    var _logoString = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
   xmlns:sketch="http://www.bohemiancoding.com/sketch/ns"
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   width="143"
   height="150"
   viewBox="0 0 143 150"
   version="1.1"
   id="svg3037"
   inkscape:version="0.48.2 r9819"
   sodipodi:docname="logo.svg">
  <metadata
     id="metadata3049">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title>Logo</dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <sodipodi:namedview
     pagecolor="#000000"
     bordercolor="#666666"
     borderopacity="1"
     objecttolerance="10"
     gridtolerance="10"
     guidetolerance="10"
     inkscape:pageopacity="1"
     inkscape:pageshadow="2"
     inkscape:window-width="1332"
     inkscape:window-height="1006"
     id="namedview3047"
     showgrid="false"
     inkscape:zoom="4.4500587"
     inkscape:cx="110.55374"
     inkscape:cy="124.60291"
     inkscape:window-x="139"
     inkscape:window-y="0"
     inkscape:window-maximized="0"
     inkscape:current-layer="Page-1"
     fit-margin-right="2.2" />
  <title
     id="title3039">Logo</title>
  <description
     id="description3041">Created with Sketch (http://www.bohemiancoding.com/sketch)</description>
  <defs
     id="defs3043">
    <clipPath
       clipPathUnits="userSpaceOnUse"
       id="clipPath18">
      <path
         d="M 0,13660.8 0,0 l 9638.98,0 0,13660.8 -9638.98,0 z"
         id="path20"
         inkscape:connector-curvature="0" />
    </clipPath>
    <clipPath
       clipPathUnits="userSpaceOnUse"
       id="clipPath18-6">
      <path
         d="M 0,13660.8 0,0 l 9638.98,0 0,13660.8 -9638.98,0 z"
         id="path20-8"
         inkscape:connector-curvature="0" />
    </clipPath>
  </defs>
  <g
     id="Page-1"
     sketch:type="MSPage"
     style="fill:none;stroke:none">
    <path
       style="fill:#ffffff"
       d="m 46.11136,9 c -6.645026,0 -14.68955,4.63714 -18,10.375 L 2.6113596,63.625 c -3.31212304,5.74076 -3.31044904,15.01214 0,20.75 l 25.5000004,44.25 c 3.312123,5.74076 11.367624,10.375 18,10.375 l 51,0 c 6.64503,0 14.68955,-4.63714 18,-10.375 l 25.5,-44.25 c 3.31212,-5.74076 3.31045,-15.01214 0,-20.75 l -25.5,-44.25 C 111.79924,13.63424 103.74374,9 97.11136,9 l -51,0 z m 29.0625,13.71875 c 8.111638,0 14.89695,5.35416 16.71875,12.53125 0.662113,-0.113114 1.360775,-0.1875 2.0625,-0.1875 5.70425,0 10.3125,3.954898 10.3125,8.84375 0,1.898494 -0.68843,3.65415 -1.875,5.09375 l -71.9375,0 c -0.01857,-0.175981 -0.03125,-0.348961 -0.03125,-0.53125 0,-3.258605 3.072238,-5.90625 6.875,-5.90625 1.88145,0 3.600937,0.670991 4.84375,1.71875 0.9098,-5.333085 6.4561,-9.283261 12.84375,-8.9375 1.157475,0.06287 2.270675,0.277285 3.3125,0.59375 1.432788,-6.973915 7.515662,-12.372711 15.0625,-13.125 0.5983,-0.06077 1.197825,-0.09375 1.8125,-0.09375 z m -54.875,28.09375 101.3125,0 0,1.6875 -101.3125,0 0,-1.6875 z m 0.03125,3.46875 31.25,0 0,10 -18.75,0 0,5 18.75,0 0,25 -31.25,0 0,-10 18.75,0 0,-5 -18.75,0 0,-25 z m 35,0 32.5,0 0,10 -20,0 0,20 20,0 0,10 -32.5,0 0,-40 z m 36.25,0 30,0 0,40 -30,0 0,-10 17.5,0 0,-5 -17.5,0 0,-25 z m 12.5,10 0,5 5,0 0,-5 -5,0 z m -83.78125,31.75 101.3125,0 0,1.6875 -101.3125,0 0,-1.6875 z"
       id="Shape"
       inkscape:connector-curvature="0" />
    <g
       id="g10"
       transform="matrix(1.25,0,0,-1.25,-1389.7741,955.66921)">
      <g
         id="g12"
         transform="matrix(0.02144847,0,0,0.01888429,1066.7511,723.44791)">
        <g
           id="g14" />
      </g>
    </g>
    <g
       id="g10-8"
       transform="matrix(1.25,0,0,-1.25,-478.40038,120.13609)">
      <g
         id="g12-9"
         transform="scale(0.1,0.1)">
        <g
           id="g14-9">
          <g
             id="g16"
             clip-path="url(#clipPath18-6)" />
        </g>
      </g>
    </g>
  </g>
</svg>
';




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
        imgMsk = new Sprite();
        var svg : SVG = new SVG(_logoString);
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
