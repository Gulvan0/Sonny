var proceedButton:MovieClip = new ProceedButton();
place(proceedButton, PROCEED_BUTTON_POS.x, PROCEED_BUTTON_POS.y, lootingContainer);
proceedButton.addEventListener(MouseEvent.CLICK, proceed);

function proceed(e:MouseEvent):void
{
	remove(lootingContainer);
	roaming();
}