package;

import com.catamaranHx.utils.Interface;



class Main extends Sprite {
	public var _imgString:Array<Dynamic> = [{key:'sc9bg1A', asset:'assets/imgs/sc9bg1A.jpg'}, {key:'sc9bg1B', asset:'assets/imgs/sc9bg1B.jpg'}];

	public function new () {
		super ();
		create();
	}

	public function create() {
		if(stage == null){
			 stage = untyped window.game;
		}
		var _imgMsk = new ImageMaskSample({stage:stage, _imgString:_imgString });
		addChild(_imgMsk);
	   
	}

}