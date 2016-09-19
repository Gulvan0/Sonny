for each (var textfield:BattleText in unitStateTextsArray)
{
	var teamArray:Array = (textfield.team == "ally")? allies : enemies;
	if (teamArray.length > textfield.unit)
		if (textfield.property == "name")
			textfield.text = teamArray[textfield.unit].name;
		else if (textfield.property == "hp")
			textfield.text = teamArray[textfield.unit].hp;
		else if (textfield.property == "arcane")
			textfield.text = teamArray[textfield.unit].arcane;
}