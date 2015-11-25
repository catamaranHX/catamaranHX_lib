package;

import com.catamaranHx.utils.Interface;


class Main extends Sprite {
	

	public function new () {
		super ();
		var _imgMsk = new ImageMaskSample(stage);
		addChild(_imgMsk);
	}
}