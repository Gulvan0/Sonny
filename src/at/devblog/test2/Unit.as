package at.devblog.test2 
{
	import at.devblog.test2.utils.GainResult;
	import com.demonsters.debugger.*;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Gulvan
	 */
	internal final class Unit 
	{
		/*
		 * Unit creation:
		 * 1. Make the model and include it to the project
		 * 2. Add case to setter
		 */
		
		//Facade properties
		private var _name:String;
		public function get name():String
		{
			return _name;
		}
		private var _model:MovieClip;
		public function get model():MovieClip
		{
			return _model;
		}
		private var _type:String;
		public function get type():String
		{
			return _type;
		}
		
		//Items
		public var inventory:Array;
		public var equipment:Equipment;
		
		//Character develop properties
		private var _level:int;
		public function get level():int
		{
			return _level;
		}
		private var _xp:int; 
		public function get xp():int
		{
			return _xp;
		}
		
		public var vitality:int;
		public var strength:int;
		public var flow:int;
		public var intellect:int;
		
		public var abilityPoints:int;
		public var attributePoints:int;
		
		private var _wheelMaxLength:int;
		public function get wheelMaxLength():int
		{
			return _wheelMaxLength;
		}
		private var _wheel:Array;
		public function get wheel():Array
		{
			return _wheel;
		}
		
		//Subordinate properties
		private var _maxhp:int;
		public function get maxhp():int
		{
			return _maxhp;
		}
		private var _maxArcane:int;
		public function get maxArcane():int
		{	
			return _maxArcane;
		}
		public var instinct:int;
		public var defense:int;
		
		//Dynamic properties
		private var _hp:int;
		public function get hp():int
		{
			return _hp;
		}
		private var _arcane:int;
		public function get arcane():int
		{
			return _arcane;
		}
		private var _buffs:Array;
		public function get buffs():Array
		{
			return _buffs;
		}
		
		// -----------------------------------------------------------------------------------
		
		public function damage(damageCount:int, dealer:Unit, pure:Boolean = false):void
		{
			var totalDamage:Number = damageCount;
			
			if (!pure)
			{
				//Instinct increases damage done, defense decreases damage taken
				totalDamage *= (dealer.instinct / 100) / (defense / 100);
				//Strength increases damage done - 1 strength point for 10 damage point
				totalDamage += dealer.strength * 10;
				//Critical hit - +10% damage for every flow point with a chance equal to 1% for every flow point (<= 97%)
				var critChance:Number = dealer.flow * 0.01;
				if (critChance > 0.97)
					critChance = 0.97;
				
				if (Utils.flip(critChance))
					totalDamage *= dealer.flow * 0.10;
			}
			
			//To avoid negative hp values
			if (totalDamage > _hp)
				_hp = 0;
			else
			    _hp -= totalDamage;
		}
		
		public function heal(healCount:int, healer:Unit, pure:Boolean = false):void
		{
			var totalHeal:Number = healCount;
			
			if (!pure)
			{
				totalHeal += healer.strength;
				totalHeal *= 1 + 0.08 * healer.vitality; // +8% for every healer's vitality point
				totalHeal *= 1 + 0.04 * vitality; // +4% for every target's vitality point
			}
			
			//To avoid over-max hp values
			if (totalHeal > _maxhp)
				_hp = _maxhp;
			else
			    _hp += totalHeal;
		}
		
		public function drain(arcaneCount:int, drainer:Unit = null):void
		{
			var totalArcane:Number = arcaneCount;
			
			if (drainer != null)
				totalArcane += drainer.intellect;
			
			//To avoid negative arcane values
			if (totalArcane > _arcane)
				_arcane = 0;
			else
			    _arcane -= totalArcane;
		}
		
		public function restore(arcaneCount:int, restorer:Unit = null):void
		{
			var totalArcane:Number = arcaneCount;
			
			if (restorer != null)
				totalArcane += intellect * 0.5; //Bonus counts only if arcane was restored by player
			
			//To avoid over-max arcane values
			if (arcaneCount > _maxArcane)
				_arcane = _maxArcane;
			else
			    _arcane += arcaneCount;
		}
		/**
		 * Gain given xp. Unit will be leveled up if there's enough xp
		 * @return Structure. Field "toGain" defines goal xp for the new level. "newLevel" shows was the new level reached or not
		 */
		public function gainXP(xpCount:int):GainResult
		{
			var result:GainResult = new GainResult();
			
			var xpToGain:int = Utils.countXPLeft(this);
			result.toGain = xpToGain;
			
			if (xpCount >= xpToGain)
			{
				_xp = xpCount - xpToGain;
				_level++;
				levelUp();
				result.newLevel = true;
			}
			else
			{
				_xp += xpCount;
				result.newLevel = false;
			}
			
			return result;
		}
		
		private function levelUp():void
		{
			abilityPoints++;
			attributePoints++;
			
			if (_level % 5 == 0)
			{
				vitality++;
				strength++;
				flow++;
				intellect++;
				abilityPoints += 4;
			}
			
			if (_level == 30 || _level == 75)
				_wheelMaxLength++;
		}
		
		// -----------------------------------------------------------------------------------
		
		private function setUnit(name:String):void
		{
			switch (name)
			{
				case "Sonny":
					_model = new Hero();
					equipment = new Equipment(null, null, null, null, null, null);
					inventory = [];
					break;
				case "Metabii":
					_model = new Metabii();
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
		
		public function makeTurn():void
		{
			switch (_name)
			{
				case "Metabii":
					if (_wheel[1].cooldown == 0 && _hp < 70 / 100 * maxhp) //If hp is lower than 70%, enrage
						_wheel[1].call(this, this);
					else                                                  //Otherwise, simply attack the enemy
						_wheel[0].call(Utils.getWeakestUnit(Main.allies), this);
			}
		}
		
		public function Unit(newName:String, newType:String, newLevel:int, newWheel:Array = null):void
		{
			//Given properties
			_name = newName;
			_type = newType;
			if (_level > 1)
				_level = newLevel;
			else
				_level = 1;
			if (newWheel != null)
				_wheel = newWheel;
			
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
	}
	
} 