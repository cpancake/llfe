package com.cash4ads.llfe
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import com.cash4ads.llfe.graphics.*;
	
	/**
	 * The base Game class. Main should extend from this.
	 * @author cpancake
	 */
	public class Game extends Sprite 
	{
		private var canvas:Canvas;
		private var background:uint;
		
		public function get Width():Number { return width; }
		public function get Height():Number { return height; }
		public function get Draw():Canvas { return canvas; }
		
		public function Game(width:Number, height:Number, bg:uint = 0xffffffff):void 
		{
			this.width = width;
			this.height = height;
			this.background = background;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			canvas = new Canvas(width, height, background);
			canvas.x = 0;
			canvas.y = 0;
			canvas.graphics.beginFill(0xffffff, 0);
			canvas.graphics.drawRect(0, 0, width, height);
			canvas.graphics.endFill();
			stage.addChild(canvas);
			dispatchEvent(new GameEvent(GameEvent.READY));
		}
	}
	
}