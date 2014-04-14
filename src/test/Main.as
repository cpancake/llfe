package test 
{
	import com.cash4ads.llfe.*;
	import com.cash4ads.llfe.util.FPSIndicator;
	import flash.events.Event;
	import flash.geom.Rectangle
	
	/**
	 * Main class for testing LLFE. Should not be included in the compiled library.
	 * @author cpancake
	 */
	[SWF(width="800",height="600",backgroundColor="#ffffff", frameRate=30)]
	public class Main extends Game
	{
		private var fps:FPSIndicator;
		public function Main() 
		{
			addEventListener(GameEvent.READY, ready);
			super(800, 600, 0xffffee00);
		}
		
		private function ready(e:GameEvent):void
		{
			fps = new FPSIndicator();
			stage.addChild(fps);
			trace(fps.width);
			addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				fps.Update(e);
				Draw.Begin();
				Draw.Noise(Math.random() * 1000);
				Draw.Rect(new Rectangle(0, 0, 400, 100), 0xffffee00);
				Draw.End();
			});
		}
	}

}