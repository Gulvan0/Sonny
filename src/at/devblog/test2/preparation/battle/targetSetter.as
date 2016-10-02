//Create and place default target
target = new UnitTarget(enemies[0]);
placeTarget(target.unit);

//Retargeting listener
for each (var enemy:Unit in enemies)
	enemy.model.addEventListener(MouseEvent.CLICK, retarget);
for each (var ally:Unit in allies)
	ally.model.addEventListener(MouseEvent.CLICK, retarget);

function retarget(e:MouseEvent):void
{
	target.unit = recognizeClickedUnit(e);
	placeTarget(target.unit);
}
	
function recognizeClickedUnit(e:MouseEvent):Unit
{
	//Defining which team was pointed by checking which side of the screen contained clicked unit
	var unitTeam:Array;
	if (e.stageX < SCREEN_W / 2)
		unitTeam = allies;
	else
		unitTeam = enemies;
	
	//Defining the number of the unit using the "higher than" condition. Model boxes do not intersect
	var unitNum:int;
	if (e.stageY < unitY(0))
		unitNum = 2;
	else if (e.stageY < unitY(1))
		unitNum = 0;
	else
		unitNum = 1;
	
	//Combining calculated unit properties into a single unit
	return unitTeam[unitNum];
}

function placeTarget(unit:Unit):void
{
	place(target, unit.model.x, unit.model.y);
}