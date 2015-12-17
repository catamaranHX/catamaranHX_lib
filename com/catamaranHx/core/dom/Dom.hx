package com.catamaranHx.core.dom;

import js.html.Document;

 /**
     catamaranHx Dom class
     Dom array of dom elmenets for use in a jQuery like manner 
 **/


@:expose('CATAMARAN.Dom')  class DOM {
	  private var elements:Array<Dynamic>;
    private var length:Int;

	@:dox(show)
	public function new (selector:Dynamic) {
		elements = cast(untyped document.querySelectorAll(selector));
        length = elements.length;
        for(i in 0...elements.length){
            elements[i] = Reflect.copy(this);
        }
	}

    public function each(callback:Dynamic):Void{
        for(i in 0...elements.length){
             callback.call(elements[i]);
        }
    }
	
    public function  hide() {
        return this.each(function() {
            untyped this.style.display = 'none';
        });
    }

     public function show() {
        return this.each(function() {
            untyped this.style.display = 'block';
        });
    }

     public static function isVisible(element:Dynamic) {
        return element.offsetWidth > 0 && element.offsetHeight > 0;
    }
    
    public function onVisible(callback:Dynamic) {
        return this.each(function() {
            if (untyped __js__("CATAMARAN.core.DOM.isVisible(this)")) {
                callback.call(this);
            } else {
                var timer = untyped setInterval(function() {
                    if (untyped __js__("CATAMARAN.core.DOM.isVisible(this)")) {
                        callback.call(this);
                        untyped clearInterval(timer);
                    }
                }, 50);
            }
        });
        
    }

    public function addClass( className:String ) {
        return this.each(function() {
            untyped this.classList.add(className);
        });
    }
    
    public function removeClass( className:String ) {
        return this.each(function() {
            untyped this.classList.remove(className);
        });
    }

    public function hasClass( className:String ) {
        return untyped this[0].classList.contains(className);
    }

    public function toggle(className:String){
      return untyped this.each.apply(this, [function() {
            if(untyped this.classList.contains(className)){
              this.removeClass(className);
            }else{
              this.addClass(className);
            }
        }]);
    }
    
    public function on( event:Dynamic, callback:Dynamic ) {
        return this.each(function() {
            untyped this.addEventListener(event, callback, false);
        });
    }
    
    public function off( event:Dynamic, callback:Dynamic ) {
        return this.each(function() {
            untyped this.removeEventListener(event, callback, false);
        });
    }

    public function width(w:Dynamic = null){
      var _w = w;
      if(_w == null){
            return untyped this[0].offsetWidth;
      }
      return this.each(function() {
            untyped this.style.width = _w;
        });
    }

    public function height(h:Dynamic = null){
      var _h = h;
      if(_h == null){
           return untyped this[0].offsetHeight;
      }
      return this.each(function() {
          untyped this.style.height = _h;
        });
    }

    public function css( obj:Dynamic ) {
        var _obj = obj;
        return this.each(function() {
          for(item in 0..._obj){
            untyped this.style[item] = _obj[item];
          }
        });
    }


	
	
}