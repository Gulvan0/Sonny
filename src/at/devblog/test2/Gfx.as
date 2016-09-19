package at.devblog.test2 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Gulvan
	 */
	internal class Gfx extends Sprite 
	{
		public function place(object:DisplayObject, x:int = 0, y:int = 0, container:DisplayObjectContainer = null):void
		{
			object.x = x;
			object.y = y;
			if (container == null)
				addChild(object);
			else
				container.addChild(object);
		}
		
		public function remove(object:DisplayObject, container:DisplayObjectContainer = null):void
		{
			if (container == null)
				removeChild(object);
			else
				container.removeChild(object);
		}
		
		public function Gfx():void
		{
			
		}
	}

}