package com.cash4ads.llfe 
{
	import flash.events.Event;
	/**
	 * An event dispatched by LLFE
	 * @author cpancake

	 */
	public class GameEvent extends Event
	{
		// Game is ready, pass control to Main
		public static const READY:String = "ready";
		
		public var result:Object;
		
		public function GameEvent(type:String, result:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			this.result = result;
		}
		
		public override function clone():Event
		{
			return new GameEvent(type, result, bubbles, cancelable);
		}
	}

}