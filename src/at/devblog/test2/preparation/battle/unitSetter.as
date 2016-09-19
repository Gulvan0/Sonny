//Create enemies based on name. Their levels scale with hero level
enemies = [new Unit(enemy0, "enemy", hero.level + Math.floor(Math.random() * 3) - 1)];
if (enemy1 != null)
{
	enemies.push(new Unit(enemy1, "enemy", hero.level + Math.floor(Math.random() * 3) - 1));
	if (enemy2 != null)
	{
		enemies.push(new Unit(enemy2, "enemy", hero.level + Math.floor(Math.random() * 3) - 1));
	}
}

//Place units' models
for (var i:int = 0; i < enemies.length; i++)
	gfx.place(enemies[i].model, unitX("enemy", i), unitY(i));
	
for (var j:int = 0; j < allies.length; j++)
	gfx.place(allies[j].model, unitX("ally", j), unitY(j));