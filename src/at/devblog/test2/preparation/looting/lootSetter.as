var slotsAvaible:TextField = new TextField();

function takeItem(i:int):void
{
	if (loot[i].name == "None" || hero.inventory.length >= 20)
		return;
	
	hero.inventory.push(loot[i]);
	loot[i] = new Item("None");
	gfx.place(loot[i].model, ITEM_X[i], ITEM_SLOTS_Y, lootingContainer);
	setSlotsText();
}

function take1():void
{
	takeItem(0);
}

function take2():void
{
	takeItem(1);
}

function take3():void
{
	takeItem(2);
}

function take4():void
{
	takeItem(3);
}

var handlerArray:Array = [take1, take2, take3, take4];

if (loot[0].name != "None") //"nones" are the rest; if all array is rest, there are no items
{
	var takeButtonsArray:Array = [];
	for (var i:int = 0; i < 4; i++)
	{
		gfx.place(loot[i].model, ITEM_X[i], ITEM_SLOTS_Y, lootingContainer);
		takeButtonsArray.push(new TakeItem());
		gfx.place(takeButtonsArray[i], ITEM_X[i], TAKE_BUTTONS_Y, lootingContainer);
		takeButtonsArray[i].addEventListener(MouseEvent.CLICK, handlerArray[i]);
	}
	
	setSlotsText();
	gfx.place(slotsAvaible, AVAIBLE_SLOTS_TEXT_POS.x, AVAIBLE_SLOTS_TEXT_POS.y, lootingContainer);
}
else
	gfx.place(new NoItemsLooted(), NO_ITEMS_TEXT_POS.x, NO_ITEMS_TEXT_POS.y, lootingContainer);
	
function setSlotsText():void
{
	slotsAvaible.text = String(20 - hero.inventory.length) + " free slots remaining";
	slotsAvaible.setTextFormat(AVAIBLE_SLOTS_TEXT_FORMAT);
	slotsAvaible.width = 250;
	slotsAvaible.height = 100;
	slotsAvaible.wordWrap = true;
}