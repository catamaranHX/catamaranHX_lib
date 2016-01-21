package com.catamaranHx.utils;

import openfl.Lib;


@:expose('CATAMARAN.utils.Clock') class Clock {
	private var previousTime:Float;
	private var startTime:Float = 0;
	private var elapsedTime:Float = 0;
	private var isRunning:Bool = false;

	function new (autoStart:Bool = true){
		this.previousTime = 0;
		previousTime = Lib.getTimer ();
	}

	public function start(){
		this.startTime = Lib.getTimer ();
		this.previousTime = this.startTime;
		this.isRunning = true;
	}

	public function stop(){
		this.getElapsedTime();
		this.isRunning = false;
	}

	public function getElapsedTime():Float{
		this.getDelta();
		return this.elapsedTime;
	}

	public function getDelta():Float{
		var deltaTime  = 0;
		if ( this.autoStart && ! this.running ) {
			this.start();
		}

		if ( this.isRunning ) {
			var currentTime = Lib.getTimer ();
	        deltaTime =  0.001 * ( currentTime - previousTime );
	        previousTime = currentTime;
	        this.elapsedTime += deltaTime;
	        
		}
		return += deltaTime;

	}


}