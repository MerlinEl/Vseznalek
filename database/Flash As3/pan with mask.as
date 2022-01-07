import com.greensock.*; 
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.events.Event;
import flash.geom.Point;
	var bg_mc = all_pages.page_01
	var mask_mc = all_pages.zoom_target_01
    bg_mc.doubleClickEnabled = true;

    //Variables
    var percX:Number;
    var percY:Number;
    var destX:Number;
    var destY:Number;

    //Image panned and masked
    bg_mc.mask = mask_mc;
	

    //this function generates a bounds rectangle that would keep bg_mc edges from going outside of mask_mc area
    function getBoundsRect():Rectangle {
        return new Rectangle((mask_mc.x + mask_mc.width) - bg_mc.width, (mask_mc.y + mask_mc.height) - bg_mc.height, bg_mc.width - mask_mc.width, bg_mc.height - mask_mc.height);
    }

    var isZoomed:Boolean = false;  //a var to keep track of whether your zoomed in or out

    var isDragging:Boolean = false; //a var to keep track of whether the bg is being dragged
    var tmpMousePoint:Point = new Point(); //this stores the mouse coordinates on the mouse down, to compare later on the mouse up to see if the mouse moved
    var decay:Number = .27; //make this lower for slower drag, make it 1 to turn off a smooth drag all together
    var tmpMouseMoved:Boolean = false; //to keep track on mouse up whether the action was a drag or a click
    var mouseMoveSensitivity:Number = 15; //how far does mouse need to move before you cancel the click event
    var offset:Point = new Point(); //the offset of the initial mouse click relative to bg_mc's  0,0

    bg_mc.addEventListener(MouseEvent.MOUSE_DOWN,mouseDown);
    bg_mc.addEventListener(MouseEvent.CLICK,mouseClick, false, 99999); //listen with a higher priority than any other click listeners on bg_mc - this way if it's a drag, you can cancel the click event

    function mouseDown(e:Event):void {
            //reset these to default
        isDragging = true;
        tmpMouseMoved = false;

        tmpMousePoint.x = mouseX; //capture the current mouse to check later if it moved (so you know the user intended to drag not click)
        tmpMousePoint.y = mouseY;
        offset.x = bg_mc.mouseX;
        offset.y = bg_mc.mouseY;

        bg_mc.addEventListener(Event.ENTER_FRAME,bgEnterFrame); //listen every frame until the mouse is released
        stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
    }

    function bgEnterFrame(e:Event):void {
        bg_mc.x += decay * (mouseX - offset.x - bg_mc.x);
        bg_mc.y += decay * (mouseY - offset.y - bg_mc.y);

        var bounds:Rectangle = getBoundsRect();

        switch(true){
            case (bg_mc.x < bounds.x):
                bg_mc.x = bounds.x;
                break;

            case (bg_mc.x > bounds.x + bounds.width):
                bg_mc.x = bounds.x + bounds.width;
        }

        switch(true){
            case (bg_mc.y < bounds.y):
                bg_mc.y = bounds.y;
                break;

            case (bg_mc.y > bounds.y + bounds.height):
                bg_mc.y = bounds.y + bounds.height;
        }

        if(Math.abs(tmpMousePoint.x - mouseX) > mouseMoveSensitivity || Math.abs(tmpMousePoint.y - mouseY) > mouseMoveSensitivity){
            tmpMouseMoved = true;
        }
    }

    function mouseUp(e:Event):void {
        isDragging = false;
        //remove listeners
        bg_mc.removeEventListener(Event.ENTER_FRAME,bgEnterFrame);
        stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
    }

    function mouseClick(e:MouseEvent):void {
        trace("CLICK cap");
        if(tmpMouseMoved){
            trace("Kill");
            e.stopImmediatePropagation(); //cancel the mouse event
        }
    }


    //Add listeners for the imgLoader movie clip.

    bg_mc.doubleClickEnabled = true;  
    bg_mc.addEventListener(MouseEvent.DOUBLE_CLICK, increaseSize);
    bg_mc.addEventListener(MouseEvent.CLICK, decreaseSize,false,0,true);

    function scaleAroundMouse(objectToScale:DisplayObject, scaleAmount:Number,          
    bounds:Rectangle = null, onComplete:Function = null):TweenLite {
        // scaling will be done relatively
        var relScaleX:Number = scaleAmount / objectToScale.scaleX;
        var relScaleY:Number = scaleAmount / objectToScale.scaleY;
        // map vector to centre point within parent scope

        var scalePoint:Point = objectToScale.localToGlobal( new         
        Point(objectToScale.mouseX, objectToScale.mouseY));
        scalePoint = objectToScale.parent.globalToLocal( scalePoint );
        // current registered postion AB
        var AB:Point = new Point( objectToScale.x, objectToScale.y );
        // CB = AB - scalePoint, objectToScale vector that will scale as it runs from the centre
        var CB:Point = AB.subtract( scalePoint );
        CB.x *= relScaleX;
        CB.y *= relScaleY;
        // recaulate AB, objectToScale will be the adjusted position for the clip
        AB = scalePoint.add( CB );
        // set actual properties

        if(bounds){
         var limits:Rectangle = new Rectangle(
            bounds.x + (bounds.width - (objectToScale.width * relScaleX)),
            bounds.y + (bounds.height - (objectToScale.height * relScaleY)),
            (objectToScale.width * relScaleX) - bounds.width,
            (objectToScale.height * relScaleY) - bounds.height
         );

         if(AB.x < limits.x) AB.x = limits.x;
         if(AB.x > limits.x + limits.width) AB.x = limits.x + limits.width;
         if(AB.y < limits.y) AB.y = limits.y;
         if(AB.y > limits.y + limits.height) AB.y = limits.y + limits.height;       
        }

        TweenLite.killTweensOf(objectToScale); //need to add this so the click/double click don't compete with each other
        return TweenLite.to(objectToScale,1,{onComplete: onComplete, scaleX: scaleAmount, scaleY: scaleAmount, x: AB.x, y: AB.y});
    }


    function increaseSize(event:MouseEvent):void{
        if(isZoomed){
            scaleAroundMouse(bg_mc, 4, getBoundsRect());
            isZoomed = false;
        }
    }

    function decreaseSize(event:MouseEvent):void{
       if(!isZoomed){
            scaleAroundMouse(bg_mc, 1, getBoundsRect());  
            isZoomed = true;
       } 
    }