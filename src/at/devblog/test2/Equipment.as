package at.devblog.test2 
{
	/**
	 * @author Gulvan
	 */
	internal class Equipment 
	{
		public var headwear:Item;
		public var bodywear:Item;
		public var leggings:Item;
		public var boots:Item;
		public var primaryItem:Item;
		public var secondaryItem:Item;
		
		public function Equipment(head:Item, body:Item, legs:Item, feet:Item, leftHand:Item, rightHand:Item) 
		{
			headwear = head;
			bodywear = body;
			leggings = legs;
			boots = feet;
			primaryItem = leftHand;
			secondaryItem = rightHand;
		}
		
	}

}