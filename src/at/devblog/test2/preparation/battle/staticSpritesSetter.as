staticsContainer = new Sprite();
addChildAt(staticsContainer, 0);

/* Battle bars
 * 
 * upper - unit state texts
 * bottom - ability wheel
 */
gfx.place(new Bar(), 0, 0, staticsContainer);
gfx.place(new Bar(), 0, SCREEN_H - (new Bar()).height, staticsContainer);

//"Truly empty" ability slots
for (var i:int = 0; i < 10; i++)
	gfx.place(new AbilitySlot(), abilityIconX(i), abilityIconY(), staticsContainer);
