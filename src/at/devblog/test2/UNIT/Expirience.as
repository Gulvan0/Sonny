package at.devblog.test2.UNIT 
{
	import at.devblog.test2.*;
	import at.devblog.test2.engine.*;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class Expirience 
	{
		private var _level:int;
		private var _xp:int;
		
		/**
		 * Gain given xp. Unit will be leveled up if there's enough xp
		 * @return Structure. Field "toGain" defines goal xp for the new level. "newLevel" shows was the new level reached or not
		 */
		public function gainXP(xpCount:int, caller:Unit):State
		{
			if (xpCount >= xpLeft())
			{
				levelUp(caller);
				_xp = xpCount - xpLeft();
				return new State(-1, "New level");
			}
			else
			{
				_xp += xpCount;
				return new State(-2, "Old level");
			}
		}
		
		private function levelUp(caller:Unit):void
		{
			var pool:AbilityPool = caller.abilityPool;
			var attribs:AttributeList = caller.attribs;
			
			_level++;
			
			pool.earn();
			attribs.earn();
			
			if (_level % 5 == 0)
			{
				attribs.attribUp();
				pool.earn(4);
			}
			
			if (_level == 50 || _level == 100)
				pool.prolongWheel();
		}
		
		
		public function xpLeft():int
		{
			var result:Number = 100 * Math.pow(_level, 1.1);
			result -= _xp;
			return Math.round(result);
		}
		
		//-----------------------------------------------------------
		
		public function get level():int 
		{
			return _level;
		}
		
		public function get xp():int 
		{
			return _xp;
		}
		
	}

}