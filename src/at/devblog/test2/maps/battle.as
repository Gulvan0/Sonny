const SCREEN_W:Number = 900;
const SCREEN_H:Number = 600;

const BAR_H:Number = 105;
const TEXTFIELD_H:Number = 15;
const ABILITY_W:Number = 65;
const ABILITY_H:Number = 65;
const ABILITY_NUM_W:Number = 30;

function unitX(team:String, num:int):Number 
{
	if (team == "ally")
	{
		if (num == 0) return 274;
		else if (num == 2 || num == 1) return 144;
	}
	else if (team == "enemy")
	{
		if (num == 0) return 601;
		else if (num == 2 || num == 1) return 722;
	}
	return 0;
}
		
function unitY(num:int):Number 
{
	if (num == 0) return 244;
	else if (num == 1) return 348;
	else if (num == 2) return 140;
	return 0;
}
		
function abilityIconX(n:int):Number 
{
	return abilityIconsOffset() + (ABILITY_W + abilityIconsOffset()) * n;
}
		
function abilityIconY():Number
{
	return SCREEN_H - (new Bar()).height + ((new Bar()).height - ABILITY_H) / 4;
}
		
function abilityIconsOffset():Number
{
	return (SCREEN_W - ABILITY_W * 10) / 11;
}
		
function abilityNumX(n:int):Number 
{
	return abilityIconX(n) + ABILITY_W / 2 - ABILITY_NUM_W / 2;
}

function abilityNumY():Number 
{
	return 362;
}
		
function unitStateTextX(team:String, type:String):Number
{
	if (team == "ally")
	{
		if (type == "name") return 8;
		else if (type == "hp") return 8 + 94 + 5;
		else if (type == "arcane") return 8 + 94 + 5 + 35 + 5;
	}
	else if (team == "enemy")
	{
		if (type == "name") return (new Bar()).width - 8 - 94;
		else if (type == "hp") return (new Bar()).width - 8 - 94 - 5 - 35;
		else if (type == "arcane") return (new Bar()).width - 8 - 94 - 5 - 35 - 5 - 35;
	}
	return 0;
}
		
function unitStateTextY(unit:int):Number
{
	var row:int = unit;
	(unit < 2)? row++ : row = 0;
	
	var offset:int = (BAR_H - TEXTFIELD_H * 3) / 4; //1 bar - all (3) textfields = all offsets. Between 3 texts there ar 4 offsets
	return offset * (row + 1) + row * TEXTFIELD_H; //Start from offset, but text counts after first appears
}