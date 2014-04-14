package com.cash4ads.llfe.util 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * Mostly taken from Bunnymark
	 * @author cpancake

	 */
	public class FPSIndicator extends Sprite
	{
		private var fpsText:TextField;
		private var time:Number;
		private var lastTime:Number = 0;
		private var fpsList:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		
		public function FPSIndicator() 
		{
			fpsText = new TextField();
			mouseEnabled = false;
			mouseChildren = false;
			addChild(fpsText);
			graphics.beginFill(0xffffff, 0.8);
			graphics.drawRect(0, 0, 100, 40);
			graphics.endFill();
			fpsText.defaultTextFormat = new TextFormat("Arial", 12, 0xff0000, true);
		}
		
		public function Update(e:Event):void
		{
			lastTime = time;
			time = getTime();
			var fps:Number = (1000 / (time - lastTime));
			fpsList.unshift(fps);
			fpsList.pop();
			var total:Number = 0;
			for (var i:Number = 0; i < fpsList.length; i++)
				total += fpsList[i];
			var realFps:Number = Math.round(total / 10);
			fpsText.text = String("FPS: " + realFps);
		}
		
		private function getTime():Number
		{
			var now:Date = new Date();
			return now.valueOf();
		}
	}

}