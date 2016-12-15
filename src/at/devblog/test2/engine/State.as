package at.devblog.test2.engine 
{
	/**
	 * ...
	 * @author Gulvan
	 */
	public class State 
	{
		
		private var _code:int;
		private var _error:Boolean;
		private var _message:String;
		
		public function State(stateCode:int, stateMessage:String = "Success") 
		{
			_code = stateCode;
			_error = stateCode as Boolean;
			_message = stateMessage;
		}
		
		//------------------------------------------------
		
		public function get code():int 
		{
			return _code;
		}
		
		public function get error():Boolean 
		{
			return _error;
		}
		
		public function get message():String 
		{
			return _message;
		}
		
	}

}