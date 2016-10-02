unitStateTextsArray = new Array();

//Filler
for (var i:int = 0; i <= 2; i++)
{
	unitStateTextsArray.push(new BattleText("ally", i, "name"), new BattleText("enemy", i, "name"));
	unitStateTextsArray.push(new BattleText("ally", i, "hp"), new BattleText("enemy", i, "hp"));
	unitStateTextsArray.push(new BattleText("ally", i, "arcane"), new BattleText("enemy", i, "arcane"));
}

//Placer
var teamArray:Array = new Array();
for each (var textfield:BattleText in unitStateTextsArray)
{
	teamArray = (textfield.team == "ally")? allies : enemies;
	if (teamArray.length > textfield.unit)
		switch(textfield.property)
		{
			case "name":
				textfield.text = teamArray[textfield.unit].name;
				textfield.setTextFormat(NAME_FORMAT);
				break;
			case "hp":
				textfield.text = teamArray[textfield.unit].hp;
				textfield.setTextFormat(HP_FORMAT);
				break;
			case "arcane":
				textfield.text = teamArray[textfield.unit].arcane;
				textfield.setTextFormat(ARCANE_FORMAT);
				break;
		}
	place(textfield, unitStateTextX(textfield.team, textfield.property), unitStateTextY(textfield.unit));
}