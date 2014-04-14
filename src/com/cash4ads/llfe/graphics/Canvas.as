package com.cash4ads.llfe.graphics 
{
	import com.cash4ads.llfe.GameEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	/**
	 * Contains our Context3D used for drawing.
	 * @author cpancake

	 */
	public class Canvas extends Sprite
	{
		private var data:BitmapData;
		private var bmp:Bitmap;
		private var background:uint;
		private var begun:Boolean = false;
		
		public function Canvas(width:Number, height:Number, background:uint) 
		{ 
			this.background = background;
			data = new BitmapData(800, 600, true, background);
			bmp = new Bitmap(data);
			addChild(bmp);
			bmp.x = 0;
			bmp.y = 0;
		}
		
		public function Begin():void
		{
			//bmp.bitmapData.lock();
			bmp.bitmapData.fillRect(new Rectangle(0, 0, width, height), background);
			begun = true;
		}
		
		public function End():void
		{
			//bmp.bitmapData.unlock();
			begun = false;
		}
		
		public function Pixel(x:uint, y:uint, color:uint):void
		{
			if (!begun) throw new Error("Attempted to draw before Begin() was called");
			bmp.bitmapData.setPixel(x, y, color);
		}
		
		public function Noise(seed:int):void
		{
			if (!begun) throw new Error("Attempted to draw before Begin() was called");
			bmp.bitmapData.noise(seed);
		}
		
		public function Rect(rect:Rectangle, fill:uint):void
		{
			if (!begun) throw new Error("Attempted to draw before Begin() was called");
			bmp.bitmapData.fillRect(rect, fill);
		}
	}

}