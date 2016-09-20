package at.devblog.test2 
{
	/**
	 * @author Gulvan
	 */
	internal class Equipment 
	{
		private var _headwear:Item;
		private var _bodywear:Item;
		private var _leggings:Item;
		private var _boots:Item;
		private var _primaryItem:Item;
		private var _secondaryItem:Item;
		
		private var _arrayForm:Array;
		
		public function Equipment(head:Item, body:Item, legs:Item, feet:Item, leftHand:Item, rightHand:Item) 
		{
			_headwear = head;
			_bodywear = body;
			_leggings = legs;
			_boots = feet;
			_primaryItem = leftHand;
			_secondaryItem = rightHand;
			_arrayForm = [_headwear, _bodywear, _leggings, _boots, _primaryItem, _secondaryItem];
		}
		
		public function get arrayForm():Array 
		{
			return _arrayForm;
		}
		
		public function get headwear():Item 
		{
			return _headwear;
		}
		
		public function set headwear(value:Item):void 
		{
			_headwear = value;
			_arrayForm[1] = value;
		}
		
		public function get bodywear():Item 
		{
			return _bodywear;
		}
		
		public function set bodywear(value:Item):void 
		{
			_bodywear = value;
			_arrayForm[2] = value;
		}
		
		public function get leggings():Item 
		{
			return _leggings;
		}
		
		public function set leggings(value:Item):void 
		{
			_leggings = value;
			_arrayForm[3] = value;
		}
		
		public function get boots():Item 
		{
			return _boots;
		}
		
		public function set boots(value:Item):void 
		{
			_boots = value;
			_arrayForm[4] = value;
		}
		
		public function get primaryItem():Item 
		{
			return _primaryItem;
		}
		
		public function set primaryItem(value:Item):void 
		{
			_primaryItem = value;
			_arrayForm[5] = value;
		}
		
		public function get secondaryItem():Item 
		{
			return _secondaryItem;
		}
		
		public function set secondaryItem(value:Item):void 
		{
			_secondaryItem = value;
			_arrayForm[6] = value;
		}
		
	}

}