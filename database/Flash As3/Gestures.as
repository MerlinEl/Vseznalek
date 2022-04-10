Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;this.stage.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);this.stage.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove);this.stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd);private function onTouchBegin(e:TouchEvent):void{    var dot:Sprite = this.getCircle();    dot.x = e.stageX;    dot.y = e.stageY;    this.stage.addChild(dot);    dot.startTouchDrag(e.touchPointID, true);    this.dots[e.touchPointID] = dot;}private function onTouchEnd(e:TouchEvent):void{    var dot:Sprite = this.dots[e.touchPointID];    this.stage.removeChild(dot);}Multitouch.inputMode = MultitouchInputMode.GESTURE;elephant.addEventListener(TransformGestureEvent.GESTURE_ZOOM, onZoom);elephant.addEventListener(TransformGestureEvent.GESTURE_ROTATE, onRotate);private function onZoom(e:TransformGestureEvent):void{    var elephant:Sprite = e.target as Sprite;    elephant.scaleX *= e.scaleX;    elephant.scaleY *= e.scaleY;}private function onRotate(e:TransformGestureEvent):void{    var elephant:Sprite = e.target as Sprite;    elephant.rotation += e.rotation;}