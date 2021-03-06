package actors 
{
	import utils.Controller;	
	import flash.events.Event;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Sebastiaan de Jongh
	 */
	public class Player extends Paddle 
	{
		private var controller:Controller;
		private var speed:Number = 0;
		private var maxSpeed: Number = 15;
		
		public function Player() 
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
			controller = new Controller(stage);
			this.addEventListener(Event.ENTER_FRAME, loop);			
		}
		


public function get paddle_xMove(): Number {
   return maxSpeed;
  }
  public function set paddle_xMove(move: Number) {
   maxSpeed = move;
  }



		private function loop(e:Event):void 
		{
			  if (controller.up)
			  
			{
				speed = -maxSpeed;
				this.y += speed;
			}
			else if(controller.down)
			{
				speed = maxSpeed;
				this.y += speed;
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

