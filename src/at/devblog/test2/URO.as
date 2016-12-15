package at.devblog.test2 
{
	/**
	 * ...
	 * @author Gulvan
	 */
	public class URO 
	{
		
		private var _targetDamage:int;
		private var _casterHeal:int;
		
		private var _targetDrain:int;
		private var _casterRestore:int;
		
		private var _targetBuffs:Array;
		private var _casterBuffs:Array;
		
		private var _selfMiss:Number;
		
		public function URO(targetDmg:int, casterHl:int = 0, newTargetBuffs:Array = [], newCasterBuffs:Array = [], targetDrn:int, casterRstr:int, miss:Number = 1) 
		{
			_targetDamage = targetDmg;
			_casterHeal = casterHl;
			_targetBuffs = newTargetBuffs;
			_casterBuffs = newCasterBuffs;
			_targetDrain = targetDrn;
			_casterRestore = casterRstr;
			_selfMiss = miss;
		}
		
		//--------------------------------------------------
		
		public function get targetDamage():int 
		{
			return _targetDamage;
		}
		
		public function get casterHeal():int 
		{
			return _casterHeal;
		}
		
		public function get targetBuffs():Array 
		{
			return _targetBuffs;
		}
		
		public function get casterBuffs():Array 
		{
			return _casterBuffs;
		}
		
		public function get selfMiss():Number 
		{
			return _selfMiss;
		}
		
		public function get targetDrain():int 
		{
			return _targetDrain;
		}
		
		public function get casterRestore():int 
		{
			return _casterRestore;
		}
		
	}

}