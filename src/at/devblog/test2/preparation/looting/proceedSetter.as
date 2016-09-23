var proceedButton:MovieClip = new ProceedButton();
gfx.place(proceedButton, PROCEED_BUTTON_POS.x, PROCEED_BUTTON_POS.y, lootingContainer);
proceedButton.addEventListener(MouseEvent.CLICK, proceed);

function proceed(e:MouseEvent):void
{
	gfx.remove(lootingContainer);
	roaming(gfx);
}