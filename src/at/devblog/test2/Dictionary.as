package at.devblog.test2 
{
	import com.demonsters.debugger.*;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Gulvan
	 */
	public final class Dictionary 
	{
		
		/*Abilities section (if maxCooldown != 0 recount number of remaining turns)
		 * 
		 * Signature: target, caster
		 */
		public static function A_quickstrike(target:Unit, caster:Unit, modifiers:Ama):void
		{
			var damageCount:int = Utils.random(40, caster.flow);
			target.damage(damageCount, caster);
		}
		
		public static function A_suppression(target:Unit, caster:Unit, modifiers:Ama):void
		{
			var suppressedBuff:Buff = new Buff("Suppressed", 3);
			suppressedBuff.cast(target);
		}
		
		public static function A_enrage(target:Unit, caster:Unit, modifiers:Ama):void
		{
			var enragedBuff:Buff = new Buff("Enraged", 2);
			enragedBuff.cast(target);
		}
		
		/*Buff section
		 * 
		 * modes: "cast", "continue", "finally"
		 * "cast" - preparing properties ex. setting defense
		 * "continue" - actions over time ex. dealing damage
		 * "finally" - cleaning properties ex. setting defense back to normal
		 * 
		 * Signature: owner - to apply the effect, mode
		 * 
		 * Don't forget to call in "finally" mode when dispelling
		 */
		public static function B_enraged(owner:Unit, mode:String = "continue"):void
		{
			switch (mode)
			{
				case "cast":
					owner.defense /= 2;
					owner.instinct *= 2;
					break;
				case "continue":
					//do nothing
					break;
				case "finally":
					owner.defense *= 2;
					owner.instinct /= 2;
					break;
			}
		}
		
		public static function B_suppressed(owner:Unit, mode:String = "continue"):void
		{
			switch (mode)
			{
				case "cast":
					owner.defense *= 1.7;
					break;
				case "continue":
					//do nothing
					break;
				case "finally":
					owner.defense /= 1.7;
					break;
			}
		}
		
		/* Item section
		 * 
		 * functions: Ia, Ip
		 * Ia: Item's active ability
		 * Ip: Item's passive ability(-ies) and attribute bonuses
		 * 
		 * Ip's modes: "equip", "unequip"
		 * "equip": Apply bonuses to the attributes
		 * "unequip": Set attributes back to normal
		 * 
		 * Ia's signature: target & caster - as for the normal abilities
		 * Ip's signature: owner - to apply bonuses, mode, allies & enemies - for some passive abilities
		 */
		public static function Ia_stoneClub(target:Unit, caster:Unit):void
		{
			target.damage(1, caster, true);
		}
		
		public static function Ip_stoneClub(owner:Unit, mode:String, allies:Array = null, enemies:Array = null):void
		{
			switch (mode)
			{
				case "equip":
					owner.strength += 1;
					break;
				case "unequip":
					owner.strength -= 1;
					break;
			}
		}
	}

}