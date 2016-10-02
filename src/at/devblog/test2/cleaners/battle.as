//Remove units from the stage and remove their targeting listeners
for each (var enemy:Unit in enemies)
{
	enemy.model.removeEventListener(MouseEvent.CLICK, retarget);
	remove(enemy.model);
}
for each (var ally:Unit in allies)
{
	ally.model.removeEventListener(MouseEvent.CLICK, retarget);
	remove(ally.model);
}

//Remove ability icons from the bottom of the stage
for each (var icon:MovieClip in abilityIconsArray)
	remove(icon);

//Remove target sprite from the stage
remove(target);

//Remove unit info textfields from the top of the stage
for each (var textfield:BattleText in unitStateTextsArray)
	remove(textfield);

//Remove bars and stuff
removeChild(staticsContainer);