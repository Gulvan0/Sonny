package at.devblog.test2 
{
	import com.demonsters.debugger.MonsterDebugger;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Gulvan
	 */
	public final class Utils 
	{
		//Battle utils
		public static function countTotalHP(teamArray:Array):Number 
		{
			var sum:int = 0;
			for each (var unit:Unit in teamArray)
				sum += unit.hp;
				
			return sum;
		}
		
		public static function isAllyTurn(mainAlly:Unit, mainEnemy:Unit):Boolean 
		{
			var chance:int = 0.5 + (mainAlly.flow - mainEnemy.flow) / 100;
			
			if (chance > 0.9)
				chance = 0.9;
			else if (chance < 0.1)
				chance = 0.1;
				
			return flip(chance);
		}
		
		public static function getWeakestUnit(units:Array):Unit
		{
			var result:Unit = units[0];
			
			for each (var unit:Unit in units)
				if (unit.hp < result.hp && unit.hp > 0)
					result = unit;
			
			return result;
		}
		
		//--------------------------------------------------------------------------------------------------------
		
		//Looting utils
		public static function countXPLeft(unit:Unit):int
		{
			var result:Number = 100 * Math.pow(unit.level, 1.1);
			result -= unit.xp;
			
			return Math.round(result);
		}
		
		public static function getAverageLevel(unitArray:Array):Number
		{
			var levelSum:int = 0;
			for each (var unit:Unit in unitArray)
				levelSum += unit.level;
			
			return levelSum / unitArray.length;
		}
		
		public static function countGainedXP(allyArray:Array, enemyArray:Array, winnerTeam:String):int
		{
			if (winnerTeam != "enemy" && winnerTeam != "ally")
				return 0;
			
			if (winnerTeam == "enemy")
				return 5;
			
			//If winnerTeam == "ally"
			var difficultyPoints:int = invertedRound(getAverageLevel(enemyArray) - getAverageLevel(allyArray));
			
			if (difficultyPoints >= 0)
				return 7.5 * Math.pow(difficultyPoints, 2) - 2.5 * difficultyPoints + 50;
			else if (difficultyPoints >= -3)
				return -2.5 * Math.pow(difficultyPoints, 2) + 2.5 * difficultyPoints + 50;
			else
				return 5;
		}
		
		//--------------------------------------------------------------------------------------------------------
		
		//General utils
		///Random number in the [begin; end) diapasone
		public static function random(begin:Number, end:Number):Number
		{
			return begin + Math.random() * (end - begin);
		}
		
		///Random number in the [begin; begin + length) diapasone
		public static function rayRandom(begin:Number, length:Number):Number 
		{
			return begin + Math.random() * length;
		}
		
		///Random number in the (center - radius; center + radius) diapasone
		public static function radialRandom(center:Number, radius:Number):Number
		{
			return center + Math.random() * radius * (flip(0.5)? 1 : -1);
		}
		
		///Checks if the number is in the [begin; end] diapasone
		public static function isInDiapasone(number:Number, begin:Number, end:Number):Boolean
		{
			if (number >= begin && number <= end)
				return true;
			else
				return false;
		}
		
		///Returns true with the chance given
		public static function flip(chance:Number):Boolean 
		{
			if (Math.random() < chance)
				return true;
			else
				return false;
		}
		
		///Rounds the number. If number ends with .5, it will be rounded to the lower integer
		public static function invertedRound(num:Number):Number
		{
			return -Math.round(-num);
		}
	}

}