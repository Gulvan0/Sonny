abilityIconsArray = new Array();

for (var i:int = 0; i < 10; i++)
{
	//Equiped abilities, then free ability slots, then locked ability slots (ex. not enough level to have 9 abilities)
	if (i < hero.wheel.length)
		abilityIconsArray.push(hero.wheel[i].icon);
	else if (i < hero.wheelMaxLength)
		abilityIconsArray.push(new QuestionAb());
	else
		abilityIconsArray.push(new LockedAb());
	
	gfx.place(abilityIconsArray[i], abilityIconX(i), abilityIconY());
}