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
		elements = cast(Document.querySelectorAll(selector));
        length = elements.length;
        for(i in 0...elements.length){
            elements[i] = reflect.copy(this);
        }
	}

    public function each(callback:Dynamic):Void{
        for(i in 0...elements.length){
             callback.call(elements[i]);
        }
    }
	
    public function  hide() {
        return this.each(function() {
            this.style.display = 'none';
        });
    }

     public function show() {
        return this.each(function() {
            this.style.display = 'block';
        });
    }

     public static function isVisible(element:Dynamic) {
        return element.offsetWidth > 0 && element.offsetHeight > 0;
    }
    
    public function onVisible(callback:Dynamic) {
        return this.each(function() {
            if (CATAMARAN.core.DOM.isVisible(this)) {
                callback.call(this);
            } else {
                var timer = setInterval(function() {
                    if (CATAMARAN.core.DOM.isVisible(this)) {
                        callback.call(this);
                        clearInterval(timer);
                    }
                }, 50);
            }
        });
        
    }

    public function addClass( className:String ) {
        return this.each(function() {
            this.classList.add(className);
        });
    }
    
    public function removeClass( className:String ) {
        return this.each(function() {
            this.classList.remove(className);
        });
    }

    public function hasClass( className:String ) {
        return this[0].classList.contains(className);
    }

    public function toggle(className:String){
      var self = this;
      return this.each(function() {
            if(this.classList.contains(className)){
              self.removeClass(className);
            }else{
              self.addClass(className);
            }
        });
    }
    
    public function on( event:Dynamic, callback:Dynamic ) {
        return this.each(function() {
            this.addEventListener(event, callback, false);
        });
    }
    
    public function off( event:Dynamic, callback:Dynamic ) {
        return this.each(function() {
            this.removeEventListener(event, callback, false);
        });
    }

    public function width(w:Dynamic = null){
      var _w = w;
      if(_w == null){
            return this[0].offsetWidth;
      }
      return this.each(function() {
            this.style.width = _w;
        });
    }

    public function height(h:Dynamic = null){
      var _h = h;
      if(_h == null){
           return this[0].offsetHeight;
      }
      return this.each(function() {
          this.style.height = _h;
        });
    }

    public function css( obj:Dynamic ) {
        var _obj = obj;
        return this.each(function() {
          for(var item in _obj){
            this.style[item] = _obj[item];
          }
        });
    }


	
	
}