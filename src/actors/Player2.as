package actors 
{
	import utils.Controller;	
	import flash.events.Event;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Sebastiaan de Jongh
	 */
	public class Player2 extends Paddle 
	{
		private var controller:Controller;
		private var speed:Number = 0;
		
		public function Player2() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);		
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemove);		
			
		}		
		
		private function onRemove(e:Event):void 
		{
			this.removeEventListener(Event.ENTER_FRAME, loop);		
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemove);
			
		}
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			controller = new Controller(stage,Keyboard.W,Keyboard.S,Keyboard.X);
			this.addEventListener(Event.ENTER_FRAME, loop);			
		}
		private function loop(e:Event):void 
		{
			  if (controller.up)
			{
				speed = -15;
			}
			else if(controller.down)
			{
				speed = 15;
			}else
			{
				if (speed > 0) speed--;
				if (speed < 0) speed++;
				
			}
			if (controller.fire)
			{
				
				
			}
			if (this.y < 45) this.y = 45;
			if (this.y > stage.stageHeight - 45) this.y = stage.stageHeight - 45;
		
			
			this.y += speed;
		}
		
	}

}
