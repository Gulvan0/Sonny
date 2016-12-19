package at.devblog.test2.UNIT 
{
	import at.devblog.test2.ABILITY.TreeAbility;
	import at.devblog.test2.engine.State;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class AbilityPool 
	{
		
		private var _abilityPoints:int;
		
		private var _wheel:Array;
		private var _wheelMaxLength:int;
		
		private var _tree:Array = [[]];
		
		public function earn(abilityPts:int = 1):void
		{
			_abilityPoints += abilityPts;
		}
		
		public function prolongWheel():void
		{
			if (_wheelMaxLength < 10)
				_wheelMaxLength++;
		}
		
		public function learn(xPos:int, yPos:int):State
		{
			var learningAbility = _tree[xPos][yPos];
			
			if (_abilityPoints <= 0)
				return new State(1, "Not enough ability points");
			
			for each (var ability:TreeAbility in learningAbility.requires)
				if (!ability.learned)
					return new State(2, "Required abilities are not learned");
			
			learningAbility.learned = true;
			_abilityPoints--;
			return new State(0);
		}
		
		public function place(xPos:int, yPos:int):State
		{
			var placingAbility:TreeAbility = _tree[xPos][yPos];
			
			if (_wheel.length == wheelMaxLength)
				return new State(1, "Wheel is full");
			
			if (!placingAbility.learned)
				return new State(2, "Ability isn't learned");
			
			_wheel.push(placingAbility.ability);
		}
		//--------------------------------------------------------
		
		public function get abilityPoints():int 
		{
			return _abilityPoints;
		}
		
		public function get wheel():Array 
		{
			return _wheel;
		}
		
		public function get wheelMaxLength():int 
		{
			return _wheelMaxLength;
		}
		
		public function get tree():Array 
		{
			return _tree;
		}
	}

}