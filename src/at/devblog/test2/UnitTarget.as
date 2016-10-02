package at.devblog.test2
{
	/**
	 * ...
	 * @author Gulvan
	 */
	internal class UnitTarget extends Target 
	{
		public var unit:Unit;
		
		public function UnitTarget(targetedUnit:Unit) 
		{
			super();
			unit = targetedUnit;
		}
		
	}

}