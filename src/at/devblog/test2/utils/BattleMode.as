package at.devblog.test2.utils 
{
	import at.devblog.test2.engine.Enum;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class BattleMode 
		{
		public var Text:String;
		{Enum.InitEnumConstants(BattleMode); }
	
		public static const RUNNING:BattleMode = new BattleMode();
		public static const WAITING:BattleMode = new BattleMode();
		public static const PROCESSING_INPUT:BattleMode = new BattleMode();
	}

}