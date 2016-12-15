package at.devblog.test2.UNIT 
{
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
		public function gainXP(xpCount:int, caller:Unit):GainResult
		{
			var result:GainResult = new GainResult();
			
			var xpToGain:int = Utils.countXPLeft(this);
			result.toGain = xpToGain;
			
			if (xpCount >= xpToGain)
			{
				levelUp(caller);
				_xp = xpCount - xpToGain;
				result.newLevel = true;
			}
			else
			{
				_xp += xpCount;
				result.newLevel = false;
			}
			
			return result;
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