package at.devblog.test2 
{
	import at.devblog.test2.utils.GainResult;
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.IBitmapDrawable;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Timer;
	import flash.system.fscommand;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Gulvan
	 */
	public final class Main extends Sprite 
	{
		
		//Progress data
		public static var zone:String;
		public static var stageNum:int;
		
		//Team control
		public static var hero:Unit;
		public static var allies:Array;
		
		include "utils/graphics.as";
		private function battle(enemy0:String, enemy1:String = null, enemy2:String = null):void
		{
			include "utils/battle/battleModes.as";
			include "maps/battle.as";
			
			var staticsContainer:Sprite;
			include "preparation/battle/staticSpritesSetter.as";
			var enemies:Array;
			include "preparation/battle/unitSetter.as";
			var abilityIconsArray:Array;
			include "preparation/battle/abilitiesSetter.as";
			var unitStateTextsArray:Array;
			include "preparation/battle/textSetter.as";
			var target:UnitTarget;
			include "preparation/battle/targetSetter.as";
			
			var allyTurn:Boolean = Utils.isAllyTurn(hero, enemies[0]); //Defining which turn will be first
			var battleState:int = allyTurn? WAITING : RUNNING;  //Wait for input OR force enemies to attack
			var processingAbility:Ability; //Inter-phase variable
			
			//Theese variables are created for checking "team alive?" condition
			var enemiesSumHP:int = Utils.countTotalHP(enemies);
			var alliesSumHP:int = Utils.countTotalHP(allies);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, action); //Attack attempt listener
			addEventListener(Event.ENTER_FRAME, mainCycle);   //Game cycle launcher
			
			function action(e:KeyboardEvent):void
			{
				//Chosen ability detection
				var ability:Ability;
				
				if (e.keyCode < 48 || e.keyCode > 57)
					return;
				
				if (e.keyCode != 48)
					ability = hero.wheel[e.keyCode - 49];
				else
					ability = hero.wheel[10];
				
				//If it's your turn and there is such ability on the wheel, check manacost, cooldown and possible targets
				if (battleState == WAITING && ability != null)
					if (ability.isAvaible(hero) && ability.canBeAppliedOn(target.unit.type))
					{
						processingAbility = ability;
						battleState = PROCESSING_INPUT;
					}
				//If input isn't valid, continue to wait
			}
			
			function mainCycle(e:Event):void
			{
				//If game must end
				if (enemiesSumHP <= 0 || alliesSumHP <= 0)
				{
					removeEventListener(Event.ENTER_FRAME, mainCycle); //Stop the game cycle
					removeEventListener(KeyboardEvent.KEY_DOWN, action); //Forbid further attacks
					var winner:String = (alliesSumHP <= 0)? "enemy" : "ally"; //Detect winner team
					include "cleaners/battle.as";
					looting(winner, allies, enemies); //Next phase
					return;
				}
				
				switch (battleState)
				{
					case RUNNING:
						for (var i:int = 1; i < allies.length; i++)
						{
							allies[i].makeTurn();
							include "support/battle/updateUnitState.as";
							enemiesSumHP = Utils.countTotalHP(enemies);
							alliesSumHP = Utils.countTotalHP(allies);
							if (enemiesSumHP <= 0 || alliesSumHP <= 0)
								break;
						}
						for each (var enemy:Unit in enemies)
						{
							enemy.makeTurn();
							include "support/battle/updateUnitState.as";
							enemiesSumHP = Utils.countTotalHP(enemies);
							alliesSumHP = Utils.countTotalHP(allies);
							if (enemiesSumHP <= 0 || alliesSumHP <= 0)
								break;
						}
						battleState = WAITING;
						break;
					case PROCESSING_INPUT:
						processingAbility.call(target.unit, hero);
						include "support/battle/updateUnitState.as";
						enemiesSumHP = Utils.countTotalHP(enemies);
						alliesSumHP = Utils.countTotalHP(allies);
						battleState = RUNNING;
						break;
				}
			}
		}
		
		private function looting(winnerTeam:String, allyArray:Array, enemyArray:Array):void
		{
			//Math & logic part
			var xpGained:int = Utils.countGainedXP(allyArray, enemyArray, winnerTeam);
			var xpToGain:Array = [];
			var isLvledUp:Array = [];
			
			var loot:Array = [];
			
			for each (var ally:Unit in allyArray)
			{
				var gainingResult:GainResult = ally.gainXP(xpGained);
				xpToGain.push(gainingResult.toGain);
				isLvledUp.push(gainingResult.newLevel);
			}
			
			for each (var item:Item in enemyArray[0].equipment.arrayForm)
				if (item != null)
					if (Utils.flip(item.dropChance))
						if (loot.length < 4)
							loot.push(item);
			
			for (var i:int = loot.length; i < 4; i++)
				loot.push(new Item("None"));
			
			//Visual part
			include "maps/looting.as";
			var lootingContainer:Sprite = new Sprite();
			place(lootingContainer);
			
			include "preparation/looting/bgSetter.as";
			include "preparation/looting/resultsSetter.as";
			include "preparation/looting/lootSetter.as";
			include "preparation/looting/proceedSetter.as";
		}
		
		private static function roaming():void
		{
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			MonsterDebugger.initialize(this);
			
			//Initial values of global data
			hero = new Unit("Khoru", "self", 1, [new Ability("Quick Strike", 0), new Ability("Suppression", 4)], "Shadow");
			allies = [hero];
			
			zone = "Silent barren";
			stageNum = 1;
            			
			//Start point
			battle("Metabii");
		}
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
	}
	
}