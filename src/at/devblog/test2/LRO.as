package at.devblog.test2 
{
	import at.devblog.test2.engine.Sign;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class LRO 
	{
		
		private var _miss:Boolean;
		private var _shielded:Boolean;
		
		private var _attackType:String;
		private var _critical:Boolean;
		private var _deltaTargetHP:Sign;
		private var _deltaCasterHP:Sign;
		
		private var _uro:URO;
		
		private function countTypedMiss():Number
		{
			switch (_attackType)
			{
				case "kick":
					return 2;
				case "bolt":
					return 1;
				default:
					return 0;
			}
		}
		
		private function countFlowDependentMiss(target:Unit, caster:Unit)
		{
			var minimumMiss:Number = 0.008 * target.flow;
			var maximumMiss:Number = 1 - 0.015 * caster.flow;
			
			var miss:Number;
			if (minimumMiss < maximumMiss)
				miss = Utils.random(minimumMiss, maximumMiss);
			else
				miss = (maximumMiss > 0)? maximumMiss : 0;
				
			return miss;
		}
		
		private function tryMiss(target:Unit, caster:Unit, abilityType:String):void
		{
			var selfMiss:Number = uro.selfMiss;
			var typedMiss:Number = countTypedMiss(abilityType);
			var flowDependentMiss:Number = countFlowDependentMiss(target, caster);
			
			var finalMiss:Number = selfMiss * typedMiss * flowDependentMiss;
			var willMiss:Boolean = Utils.flip(finalMiss);
			
			if (willMiss)
				_miss = true;
			else
				_miss = false;
		}
		
		private function tryShield(target:Unit):void
		{
			for each (var buff:Buff in target.buffs)
				if (buff is Shield)
					if ((buff as Shield).damageBlocks >= uro.targetDamage)
					{
						(buff as Shield).damageBlocks -= uro.targetDamage;
						_shielded = true;
					}
					else
					{
						(buff as Shield).damageBlocks = 0;
						_shielded = false;
					}
		}
		
		private function applyAttributes(target:Unit, caster:Unit):void
		{
			
		}
		
		private function randomizeDamage(caster:Unit):void
		{
			_uro.targetDamage += int(Utils.radialRandom(0, 10 * caster.level));
		}
		
		private function countCrit(caster:Unit):void
		{
			
		}
		
		private function prepareAdditionalProps(target:Unit, caster:Unit):void
		{
			_deltaTargetHP = Sign.toSign(_uro.targetDamage);
			_deltaCasterHP = Sign.toSign(-_uro.casterHeal);
		}
		
		public function loadURO(target:Unit, caster:Unit):void
		{
			tryMiss(target, caster);
			if (_miss)
				return;
			
			tryShield(target);
			if (_shielded)
				return;
			
			applyAttributes(target, caster);
			randomizeDamage(caster);
			countCrit(caster);
			prepareAdditionalProps();
		}
		
		public function LRO(ro:URO, abilityType:String) 
		{
			_uro = ro;
			_attackType = abilityType;
		}
		
		//---------------------------------------------------------------
		
		public function get miss():Boolean 
		{
			return _miss;
		}
		
		public function get shielded():Boolean 
		{
			return _shielded;
		}
		
		public function get critical():Boolean 
		{
			return _critical;
		}
		
		public function get uro():URO 
		{
			return _uro;
		}
		
		public function get attackType():String 
		{
			return _attackType;
		}
		
	}

}