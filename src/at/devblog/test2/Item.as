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
		private var _model:MovieClip;
		
		//Requirement properties
		private var _type:String;
		private var _minLevel:int;
		private var _line:String;
		
		//Bonus properties
		private var _onItemEquiped:Function;
		private var _ability:Function;
		
		//Dropping
		private var _rarity:String;
		private var _dropChance:Number;
		
		public function setItem(name:String):void
		{
			switch (name)
			{
				case "None":
					_model = new ItemSlot();
					break;
				case "Stone club":
					_model = new StoneClub();
					_type = "Left-handed item";
					_minLevel = 1;
					_line = null;
					_onItemEquiped = Dictionary.Ip_stoneClub;
					_ability = Dictionary.Ia_stoneClub;
					_rarity = "Common";
					_dropChance = 1;
					break;
				default:
					return;
			}
		}
		
		public function Item(itemName:String) 
		{
			_name = itemName;
			setItem(_name);
		}
		
		//----------------------------------------------------------------------------------------
		
		///Works as id, but formatted for textfield
		public function get name():String 
		{
			return _name;
		}
		
		public function get model():MovieClip 
		{
			return _model;
		}
		
		///Headwear/Bodywear/Leggings/Footwear/Left-handed item/Right-handed item/Two-handed item/Aspect(?)/Item
		public function get type():String 
		{
			return _type;
		}
		
		public function get minLevel():int 
		{
			return _minLevel;
		}
		
		public function get onItemEquiped():Function 
		{
			return _onItemEquiped;
		}
		
		public function get ability():Function 
		{
			return _ability;
		}
		
		///Common/Rare/Legendary/Immortal
		public function get rarity():String 
		{
			return _rarity;
		}
		
		public function get dropChance():Number 
		{
			return _dropChance;
		}
		
	}

}