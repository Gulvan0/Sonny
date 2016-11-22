package at.devblog.test2.utils 
{
	import at.devblog.test2.engine.Enum;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class Element 
	{
		public var Text:String;
		{Enum.InitEnumConstants(Element); }
	
		public static const PHYSICAL:Element = new Element();
		public static const SHADOW:Element = new Element();
		public static const LIGHTNING:Element = new Element();
		public static const FIRE:Element = new Element();
		public static const ICE:Element = new Element();
		public static const BIOTIC:Element = new Element();
		public static const TERRA:Element = new Element();
		public static const COSMIC:Element = new Element();
		public static const DARK:Element = new Element();
		public static const VITAL:Element = new Element();
	}

}