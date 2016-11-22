package at.devblog.test2 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Gulvan
	 */
	internal class Buff 
	{
		/*
		 * Buff creation:
		 * 
		 * 1. Create buff function
		 * 2. Add case to setter
		 */
		
		//Utility properties
		private var _buffArrayNum:int;
		
		//Constant properties
		private var _name:String;
		private var _section:String; //buff/debuff/complex
		private var _type:String; //damage/dot/hot/shield/stun/defense ??????
		private var _link:Function;
		private var _icon:MovieClip;
		
		private var _owner:Unit;
		private var _duration:int; //aka. maxTurnsLeft
		
		//Variable properties
		private var _turnsLeft:int;
		
		public function tick():void
		{
			if (_turnsLeft > 1)
			{
				_turnsLeft--;
				_link(_owner, "continue");
			}
			else if (_turnsLeft == 1)
			{
				_turnsLeft--;
				_link(_owner, "continue");
				_link(_owner, "finally");
				_owner.buffs.splice(_buffArrayNum, 1);
			}
		}
		
		public function cast(newOwner:Unit):void
		{
			_owner = newOwner;
			_turnsLeft = _duration;
			_buffArrayNum = _owner.buffs.length;
			_owner.buffs.push(this);
			_link(_owner, "cast");
			//Place buff icon
		}
		
		//Buffs dictionary
		private function setBuff(name:String):void
		{
			switch (name)
			{
				case "Enraged":
					_section = "Buff";
					_type = "Damage";
					_link = Dictionary.B_enraged;
					_icon = new MovieClip();
					_icon.addChild(new PhysicalBuff());
					_icon.addChild(new Buff1());
					break;
				case "Suppressed":
					_section = "Buff";
					_type = "Defense";
					_link = Dictionary.B_suppressed;
					_icon = new MovieClip();
					_icon.addChild(new PhysicalBuff());
					_icon.addChild(new Buff2());
					break;
				default:
					return;
			}
		}
		
		public function Buff(newName:String, newDuration:int) 
		{
			//Defining arbitrary properties
			_name = newName;
			_duration = newDuration;
			_turnsLeft = _duration;
			
			//Getting determined properties
			setBuff(_name);
		}
		
		//-----------------------------------------------------------------------------------------
		
		public function get name():String 
		{
			return _name;
		}
		
		public function get link():Function 
		{
			return _link;
		}
		
		public function get icon():MovieClip 
		{
			return _icon;
		}
		
		public function get turnsLeft():int 
		{
			return _turnsLeft;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function get section():String 
		{
			return _section;
		}
		
	}

}