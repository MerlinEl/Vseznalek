///Flip object
function setRegPoint(obj:DisplayObjectContainer, newX:Number, newY:Number):void {
	//get the bounds of the object and the location 
	//of the current registration point in relation
	//to the upper left corner of the graphical content
	//note: this is a PSEUDO currentRegX and currentRegY, as the 
	//registration point of a display object is ALWAYS (0, 0):
	var bounds:Rectangle = obj.getBounds(obj.parent);
	var currentRegX:Number = obj.x - bounds.left;
	var currentRegY:Number = obj.y - bounds.top;
	
	var xOffset:Number = newX - currentRegX;
	var yOffset:Number = newY - currentRegY;
	//shift the object to its new location--
	//this will put it back in the same position
	//where it started (that is, VISUALLY anyway):
	obj.x += xOffset;
	obj.y += yOffset;
	
	//shift all the children the same amount,
	//but in the opposite direction
	for(var i:int = 0; i < obj.numChildren; i++) {
		obj.getChildAt(i).x -= xOffset;
		obj.getChildAt(i).y -= yOffset;
	}
}


book.addEventListener(MouseEvent.CLICK, bookClicked);
function bookClicked(event:MouseEvent):void {
	book.scaleX *= -1;
}

//set the registration point for the book object in the middle instead:
setRegPoint(book, book.width / 2, book.height / 2);
///Flip object