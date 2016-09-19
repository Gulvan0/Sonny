package at.devblog.test2 
{
	import com.demonsters.debugger.*;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Gulvan
	 */
	internal final class Ability 
	{
		/*
		 * Ability creation:
		 * 1. Create ability function
		 * 2. Add case to setter
		 */
		
		//Constant properties
		private var _name:String;
		public function get name():String
		{
			return _name;
		}
		private var _icon:MovieClip;
		public function get icon():MovieClip
		{
			return _icon;
		}
		private var _link:Function;
		public function get link():Function
		{
			return _link;
		}
		private var _possibleTargets:Array;
		public function get possibleTargets():Array
		{
			return _possibleTargets;
		}
		private var _arcaneCost:int = 0;
		public function get arcaneCost():int
		{
			return _arcaneCost;
		}
		
		private var startCooldown:int;
		
		//Variable properties
		public var cooldown:int;
		public var delay:int;
		
		public function canBeAppliedOn(unitType:String):Boolean
		{
			for each (var type:String in _possibleTargets)
				if (type == unitType)
					return true;
			return false;
		}
		
		public function isAvaible(caster:Unit):Boolean
		{
			if (cooldown == 0 && delay == 0 && caster.arcane >= _arcaneCost)
				return true;
			else
				return false;
		}
		
		public function tick():void
		{
			if (cooldown != 0)
			{
				cooldown--;
				//Recount number of remaining turns
			}
			else if (cooldown == 0)
			{
				//Remove shader + number of remaining turns
			}
			
			if (delay != 0)
				delay--;
		}
		
		public function call(target:Unit, caster:Unit):void
		{
			cooldown = startCooldown;
			_link(target, caster);
			caster.drain(_arcaneCost);
			//Add shader + number of remaining turns
		}
		
		//Abilities dictionary
		private function setAbility(name:String):void
		{
			switch (name)
			{
				case "Quick Strike":
					_icon = new Quickstrike();
					_link = Dictionary.A_quickstrike;
					_possibleTargets = ["enemy"];
					_arcaneCost = 0;
					break;
				case "Suppression":
					_icon = new Suppression();
					_link = Dictionary.A_suppression;
					_possibleTargets = ["self"];
					_arcaneCost = 35;
					break;
				case "Enrage":
					_icon = new Enrage();
					_link = Dictionary.A_enrage;
					_possibleTargets = ["self"];
					_arcaneCost = 30;
					break;
				default:
					return;
			}
		}
		
		public function Ability(newName:String, newCooldown:int, newDelay:int = 0) 
		{
			//Defining arbitrary properties
			_name = newName;
			startCooldown = newCooldown;
			cooldown = 0;
			delay = newDelay;
			
			//Getting determined properties
			setAbility(_name);
		}
	}

}