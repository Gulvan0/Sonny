for (var i:int = 0; i < allyArray.length; i++)
{
	if (isLvledUp[i])
		gfx.place(new LeveledUp(), LVLUP_STAR_X, PLAYER_RESULTS_Y[i], lootingContainer);
	
	var allyName:TextField = new TextField();
	allyName.text = allyArray[i].name;
	allyName.setTextFormat(PLAYER_RESULT_FORMAT);
	allyName.width = 1500;
	gfx.place(allyName, PLAYER_NAME_X, PLAYER_RESULTS_Y[i], lootingContainer);
	
	var allyXP:TextField = new TextField();
	allyXP.text = xpGained + "/" + xpToGain[i];
	allyXP.setTextFormat(PLAYER_RESULT_FORMAT);
	allyXP.width = 500;
	gfx.place(allyXP, XP_QUANTITY_X, PLAYER_RESULTS_Y[i], lootingContainer);
}