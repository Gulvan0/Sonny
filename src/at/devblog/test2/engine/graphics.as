private function place(object:DisplayObject, x:int = 0, y:int = 0, container:DisplayObjectContainer = null):void
{
	object.x = x;
	object.y = y;
	if (container == null)
		addChild(object);
	else
		container.addChild(object);
}
		
private function remove(object:DisplayObject, container:DisplayObjectContainer = null):void
{
	if (container == null)
		removeChild(object);
	else
		container.removeChild(object);
}