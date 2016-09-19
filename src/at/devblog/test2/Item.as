package at.devblog.test2 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Gulvan
	 */
	internal class Item 
	{
		//Facade properties
		private var _name:String;
		///Identifies the item, but ready to use in textfields
		public function get name():String
		{
			return _name;
		}
		private var _model:MovieClip;
		public function get model():MovieClip
		{
			return _model;
		}
		
		//Requirement properties
		private var _type:String;
		///Headwear/Bodywear/Leggings/Footwear/Left-handed item/Right-handed item/Two-handed item/Aspect(?)/Item
		public function get type():String
		{
			return _type;
		}
		private var _minLevel:int;
		public function get minLevel():int
		{
			return _minLevel;
		}
		
		//Bonus properties
		private var _onItemEquiped:Function;
		public function get onItemEquiped():Function
		{
			return _onItemEquiped;
		}
		private var _ability:Function;
		public function get ability():Function
		{
			return _ability;
		}
		
		//Dropping
		private var _rarity:String;
		///Common/Rare/Legendary/Immortal
		public function get rarity():String 
		{
			return _rarity;
		}
		private var _dropChance:Number;
		public function get dropChance():Number
		{
			return _dropChance;
		}
		
		public function setItem(name:String):void
		{
			switch (name)
			{
				case "Stone club":
					_model = new StoneClub();
					_type = "Left-handed item";
					_minLevel = 1;
					_onItemEquiped = Dictionary.Ip_stoneClub;
					_ability = Dictionary.Ia_stoneClub;
					_rarity = "Common";
					_dropChance = 1;
				default:
					return;
			}
		}
		
		public function Item(itemName:String) 
		{
			_name = itemName;
			setItem(_name);
		}
		
	}

}