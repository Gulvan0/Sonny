package at.devblog.test2.UNIT 
{
	import at.devblog.test2.engine.State;
	/**
	 * ...
	 * @author Gulvan
	 */
	public class AttributeList 
	{
		
		private var _vitality:int;
		private var _strength:int;
		private var _flow:int;
		private var _intellect:int;
		private var _attributePoints:int;
		
		public function earn(attribPoints:int = 1):void
		{
			_attributePoints += attribPoints;
		}
		
		/**
		 * 
		 * @param	attribute	"vitality"/"strength"/"flow"/"intellect"
		 * @return
		 */
		public function spend(attribute:String):State
		{
			if (_attributePoints <= 0)
			{
				return new State(1, "Not enough attribute points");
			}
			
			switch (attribute)
			{
				case "vitality":
					_vitality++;
					break;
				case "strength":
					_strength++;
					break;
				case "flow":
					_flow++;
					break;
				case "intellect":
					_intellect++;
					break;
				default:
					return new State(2, "Incorrect parameter");
			}
			
			_attributePoints--;
			return new State(0);
		}
		
		public function attribUp():void
		{
			_vitality++;
			_strength++;
			_flow++;
			_intellect++;
		}
		
		//-------------------------------------------------------------
		
		public function get vitality():int 
		{
			return _vitality;
		}
		
		public function get strength():int 
		{
			return _strength;
		}
		
		public function get flow():int 
		{
			return _flow;
		}
		
		public function get intellect():int 
		{
			return _intellect;
		}
		
		public function get attributePoints():int 
		{
			return _attributePoints;
		}
		
	}

}