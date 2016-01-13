package com.catamaranHx.core.events;

 /**
     catamaranHx Events class
     Events for Catamaran
 **/


@:expose('CATAMARAN.Events')  class Events {
	var topics:Dynamic = {};
	var hOP:Dynamic;

	@:dox(show)
	public function new () {
		hOP = this.topics.hasOwnProperty;
	}
	
    public static inline function on(?elementArr:Dynamic = null, event:String, fn:Dynamic) {
        if (elementArr != null){
            elementArr = untyped document.querySelectorAll(elementArr);
            for(i in 0...elementArr.length){
                untyped elementArr[i].addEventListener(event.toLowerCase(), fn);
            }
        }else{
           untyped addEventListener(event.toLowerCase(), fn);
        }
        
    }

    public static inline function  off(?elementArr:Dynamic = null, event:String, fn:Dynamic) {
        if (elementArr != null){
            elementArr = untyped document.querySelectorAll(elementArr);
            for(i in 0...elementArr.length){
                untyped elementArr[i].removeEventListener(event.toLowerCase(), fn);
            }
          }else{
            untyped removeEventListener(event.toLowerCase(), fn);
        }
    }

    public function subscribe(topic, listener):Dynamic {
      if(!this.hOP.call(this.topics, topic)) this.topics[topic] = [];
      var index = this.topics[topic].push(listener) -1;
      return {
        remove: function() {
          untyped __js__('delete this.topics[topic][index]');
        }
      }
    }

    public function publish(topic, info) {
      untyped if(!this.hOP.call(this.topics, topic)) return;
      untyped this.topics[topic].forEach(function(item) {
            untyped item(info != undefined ? info : {});
      });
    }
}