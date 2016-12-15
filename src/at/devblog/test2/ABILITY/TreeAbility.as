package at.devblog.test2.ABILITY 
{
	import at.devblog.test2.Ability;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class TreeAbility 
	{
		
		private var _ability:Ability;
		
		private var _posX:int;
		private var _posY:int;
		private var _learned:Boolean;
		private var _requires:Array;
		private var _unlocks:Array;
		
		//--------------------------------------------------------
		
		public function get ability():Ability 
		{
			return _ability;
		}
		
		public function get posX():int 
		{
			return _posX;
		}
		
		public function get posY():int 
		{
			return _posY;
		}
		
		public function get learned():Boolean 
		{
			return _learned;
		}
		
		public function get requires():Array 
		{
			return _requires;
		}
		
		public function get unlocks():Array 
		{
			return _unlocks;
		}
		
	}

}