for each (var textfield:BattleText in unitStateTextsArray)
{
	var teamArray:Array = (textfield.team == "ally")? allies : enemies;
	if (teamArray.length > textfield.unit)
		if (textfield.property == "name")
		{
			textfield.text = teamArray[textfield.unit].name;
			textfield.setTextFormat(NAME_FORMAT);
		}
		else if (textfield.property == "hp")
		{
			textfield.text = teamArray[textfield.unit].hp;
			textfield.setTextFormat(HP_FORMAT);
		}
		else if (textfield.property == "arcane")
		{
			textfield.text = teamArray[textfield.unit].arcane;
			textfield.setTextFormat(ARCANE_FORMAT);
		}
}