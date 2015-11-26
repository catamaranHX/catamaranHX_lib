(function (console, $hx_exports) { "use strict";
$hx_exports.CATAMARAN = $hx_exports.CATAMARAN || {};
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var ImageMaskSample = function(options) {
	this._game = null;
	this._rotation = -20.0;
	this._sp = [];
	this._stage = options.stage;
	this._imgString = options._imgString;
	PIXI.DisplayObjectContainer.call(this);
	this.setTileLoop();
	this.setTileLoop();
	this.setTileLoop();
	this.setTileLoop();
	window._stage = this._stage;
};
ImageMaskSample.__super__ = PIXI.DisplayObjectContainer;
ImageMaskSample.prototype = $extend(PIXI.DisplayObjectContainer.prototype,{
	setTileLoop: function() {
		var _g1 = 0;
		var _g = this._imgString.length;
		while(_g1 < _g) {
			var i = _g1++;
			this.setUpTiles(this._imgString[i]);
		}
	}
	,setUpTiles: function(img) {
		var sp = new com_catamaranHx_ui_ImageMask(this._stage,{ x : 0, y : 0, image : img, text : "test", textX : (this._rotation * 5 - 20) * -1, rotation : this._rotation});
		sp.rotation = this._rotation;
		sp.x = sp.rotation * 5;
		sp._initY = sp.y = this.getTileHeight();
		this.addChild(sp);
		this._sp.push(sp);
	}
	,getTileHeight: function() {
		var heightOfTile = 0;
		var _g1 = 0;
		var _g = this._sp.length;
		while(_g1 < _g) {
			var i = _g1++;
			heightOfTile += this._sp[i]._height;
		}
		return heightOfTile;
	}
	,gameLoop: function(event) {
		window._sp = this._sp;
	}
});
var Main = function() {
	this._imgString = [{ key : "sc9bg1A", asset : "assets/imgs/sc9bg1A.jpg"},{ key : "sc9bg1B", asset : "assets/imgs/sc9bg1B.jpg"}];
	window.game = new Phaser.Game(800,600,Phaser.CANVAS,"phaser",{ preload : $bind(this,this.preload), create : $bind(this,this.create)});
	PIXI.DisplayObjectContainer.call(this);
};
Main.main = function() {
	new Main();
};
Main.__super__ = PIXI.DisplayObjectContainer;
Main.prototype = $extend(PIXI.DisplayObjectContainer.prototype,{
	preload: function() {
		window.game.load.image(this._imgString[0].key,this._imgString[0].asset);
		window.game.load.image(this._imgString[1].key,this._imgString[1].asset);
	}
	,create: function() {
		if(this.stage == null) this.stage = window.game;
		var _imgMsk = new ImageMaskSample({ stage : this.stage, _imgString : this._imgString});
		this.addChild(_imgMsk);
	}
});
var com_catamaranHx_ui_ImageMask = $hx_exports.CATAMARAN.ImageMask = function(_stage,_options) {
	this.imgAni = true;
	this._isOpen = false;
	this._options = { x : 0, y : 0, rotation : -20};
	this._stage = _stage;
	if(_options != null) this._options = _options;
	PIXI.DisplayObjectContainer.call(this);
	this.construct();
	this.setUPTxt(this._options.text);
};
com_catamaranHx_ui_ImageMask.__super__ = PIXI.DisplayObjectContainer;
com_catamaranHx_ui_ImageMask.prototype = $extend(PIXI.DisplayObjectContainer.prototype,{
	setUPTxt: function(_txt) {
	}
	,construct: function() {
		this._image = com_catamaranHx_utils_ImageLoader.getImage(this._options.image.asset,this._options.image.key);
		var imgMsk = window.game.add.graphics(0,0);
		imgMsk.beginFill(16777215);
		imgMsk.drawRect(this._options.x,this._options.y,this._image.height / 10,this._stage.width * 1.5);
		imgMsk.mask = this._sprite_mask;
		var imgSpr = new PIXI.DisplayObjectContainer();
	}
});
var com_catamaranHx_utils_ImageLoader = function() { };
com_catamaranHx_utils_ImageLoader.getImage = function(key,options) {
	return new Phaser.Sprite(window.game,0,0,options.name,0);
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}}, typeof window != "undefined" ? window : exports);
