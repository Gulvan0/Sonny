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
		
		private var _critical:Boolean;
		private var _deltaTargetHP:Sign;
		private var _deltaCasterHP:Sign;
		
		private var _uro:URO;
		
		private function countTypedMiss(abilityType:String):Number
		{
			
		}
		
		private function countFlowDependentMiss(target:Unit, caster:Unit)
		{
			
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
		
		private function randomizeDamage():void
		{
			
		}
		
		private function countCrit(caster:Unit):void
		{
			
		}
		
		private function prepareAdditionalProps():void
		{
			
		}
		
		public function loadURO(target:Unit, caster:Unit, abilityType:String):void
		{
			tryMiss(target, caster, abilityType);
			if (_miss)
				return;
			
			tryShield(target);
			if (_shielded)
				return;
			
			applyAttributes(target, caster);
			randomizeDamage();
			countCrit(caster);
			prepareAdditionalProps();
		}
		
		public function LRO(ro:URO) 
		{
			_uro = ro;
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
		
	}

}