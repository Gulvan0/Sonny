package at.devblog.test2 
{
	import flash.text.TextField;
	/**
	 * ...
	 * @author Gulvan
	 */
	internal class BattleText extends TextField
	{
		/**
		 * "ally" - allied unit
		 * "enemy" - enemy unit
		 */
		public var team:String; 
		/**
		 * 0 - central unit
		 * 1 - bottom unit
		 * 2 - upper unit
		 */
		public var unit:int;
		/**
		 * "name" - defines name of an unit
		 * "hp" - defines health of an unit
		 * "arcane" - defines arcane of an unit
		 */
		public var property:String;
		
		/**
		 * Creates a new textfield with some properties
		 * @param	newTeam "ally" or "enemy"
		 * @param	newUnit 0, 1 or 2
		 * @param	newProperty "name", "hp" or "arcane"
		 */
		public function BattleText(newTeam:String, newUnit:int, newProperty:String) 
		{
			if (newTeam == "ally" || newTeam == "enemy")
				team = newTeam;
			if (newUnit >= 0 && newUnit <= 2)
				unit = newUnit;
			if (newProperty == "name" || newProperty == "hp" || newProperty == "arcane")
				property = newProperty;
		}
		
	}

}