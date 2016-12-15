package at.devblog.test2.BUFF 
{
	/**
	 * ...
	 * @author Gulvan
	 */
	public class Shield extends Buff 
	{
		
		public var damageBlocks:int;
		
		public function Shield(newName:String, newDuration:int, newDamage:int) 
		{
			super(newName, newDuration);
			damageBlocks = newDamage;
		}
		
	}

}