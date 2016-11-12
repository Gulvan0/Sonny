package at.devblog.test2.engine 
{
	import flash.utils.describeType;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class Enum 
	{
		
		public static function InitEnumConstants(inType :*) :void
		{
			var type :XML = describeType(inType);
			for each (var constant :XML in type.constant)
				inType[constant.@name].Text = constant.@name;
		}
		
	}

}