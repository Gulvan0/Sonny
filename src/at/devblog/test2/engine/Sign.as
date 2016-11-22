package at.devblog.test2.engine 
{
	import at.devblog.test2.engine.Enum;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class Sign 
	{
		
		public var Text:String;
		{Enum.InitEnumConstants(Sign); }
		
		public static const PLUS:Sign = new Sign();
		public static const MINUS:Sign = new Sign();
		public static const ZERO:Sign = new Sign();
		
	}

}