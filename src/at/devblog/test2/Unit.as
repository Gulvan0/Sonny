package at.devblog.test2 
{
	import at.devblog.test2.UNIT.AbilityPool;
	import at.devblog.test2.UNIT.AttributeList;
	import at.devblog.test2.UNIT.Expirience;
	import at.devblog.test2.utils.GainResult;
	import com.demonsters.debugger.*;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Gulvan
	 */
	public final class Unit 
	{
		/*
		 * Unit creation:
		 * 1. Make the model and include it to the project
		 * 2. Add case to setter
		 */
		
		//Facade properties
		private var _name:String;
		private var _model:MovieClip;
		private var _type:String;
		private var _line:String;
		
		//Items
		public var inventory:Array;
		public var equipment:Equipment;
		
		//Character develop properties
		public var expirience:Expirience;
		public var abilityPool:AbilityPool;
		public var attribs:AttributeList; 
		
		public function gainXP(xpCount:int):GainResult
		{
			return expirience.gainXP(xpCount, this);
		}
		
		public function respec():void
		{
			
		}
		
		//Subordinate properties
		private var _maxhp:int;
		private var _maxArcane:int;
		
		public var instinct:int;
		public var defense:int;
		
		//Dynamic properties
		private var _hp:int;
		private var _arcane:int;
		private var _buffs:Array;
		
		
		public function damage(damage:int):void
		{
			if (damage > _hp)
				_hp = 0;
			else if (-damage > _maxhp)
				_hp = _maxhp;
			else
			    _hp -= damage;
		}
		
		public function drain(arcaneCount:int):void
		{
			//arcaneCount += drainer.intellect;
			
			if (arcaneCount > _arcane)
				_arcane = 0;
			else
			    _arcane -= arcaneCount;
		}
		
		public function restore(arcaneCount:int):void
		{
			//arcaneCount += intellect * 0.5;
			
			if (arcaneCount > _maxArcane)
				_arcane = _maxArcane;
			else
			    _arcane += arcaneCount;
		}
		
		// ---------------------------------------------------------------------------------------
		public function makeTurn():void
		{
			switch (_name)
			{
				case "Metabii":
					if (_wheel[1].cooldown == 0 && _hp < 70 / 100 * maxhp) //If hp is lower than 70%, enrage
						_wheel[1].call(this, this);
					else                                                  //Otherwise, quickstrike
						_wheel[0].call(Utils.getWeakestUnit(Main.allies), this);
			}
		}
		
		private function setUnit(name:String):void
		{
			switch (name)
			{
				case "Khoru":
					_model = new Hero();
					equipment = new Equipment(null, null, null, null, null, null);
					inventory = [];
					break;
				case "Metabii":
					_model = new Metabii();
					_line = "Warrior";
					equipment = new Equipment(null, null, null, null, new Item("Stone club"), null);
					vitality += 0;
					strength += 0;
					flow += 0;
					intellect += 0;
					_wheel = [new Ability("Quick Strike", 0), new Ability("Enrage", 5, 1)];
					instinct = 40; //Independent
					break;
				default:
					return;
			}
		}
		
		public function Unit(newName:String, newType:String, newLevel:int, newWheel:Array = null, newLine:String = null):void
		{
			//Given properties
			_name = newName;
			_type = newType;
			(_level > 1)? _level = newLevel : 1;
			(newWheel != null)? _wheel = newWheel : null;
			(newLine != null)? _line = newLine : null;
			
			//Initial values of static properties
			vitality = _level - 1;
			strength = _level - 1;
			flow = _level - 1;
			intellect = _level - 1;
				
			//(Re)Calculating subordinate properties
			_maxhp = 100 + 30 * vitality + 5 * strength;
			_maxArcane = 100 + 2 * intellect;
			instinct = 100 + 2 * flow;
			defense = 100 + 2 * vitality;
			
			//Unit-based properties
			setUnit(_name);
			
			//Initial values of dynamic properties
			_hp = _maxhp;
			_arcane = _maxArcane;
			_buffs = [];
		}
		
		//---------------------------------------------------------------------------------------

		
		public function get name():String 
		{
			return _name;
		}
		
		public function get model():MovieClip 
		{
			return _model;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function get level():int 
		{
			return _level;
		}
		
		public function get xp():int 
		{
			return _xp;
		}
		
		public function get wheelMaxLength():int 
		{
			return _wheelMaxLength;
		}
		
		public function get wheel():Array 
		{
			return _wheel;
		}
		
		public function get maxhp():int 
		{
			return _maxhp;
		}
		
		public function get maxArcane():int 
		{
			return _maxArcane;
		}
		
		public function get hp():int 
		{
			return _hp;
		}
		
		public function get arcane():int 
		{
			return _arcane;
		}
		
		public function get buffs():Array 
		{
			return _buffs;
		}
		
		public function get line():String 
		{
			return _line;
		}
	}
	
} 