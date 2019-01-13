import flash.display.Sprite;import flash.geom.Point;import flash.events.MouseEvent;import mcs.tran;var draw_curve:Boolean = false;var mc_a:Sprite = new Sprite();var mc_b:Sprite = new Sprite();var mc_c:Sprite = new Sprite();var canvas:Sprite = new Sprite()mc_a.name = "dot";mc_b.name = "dot";mc_c.name = "dot";addChild(mc_a);addChild(mc_b);addChild(mc_c);addChild(canvas);drawPointsABC(200, 100);stage.addEventListener(MouseEvent.MOUSE_DOWN, onDown);stage.addEventListener(MouseEvent.MOUSE_UP, onUp);stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);function onDown(e:MouseEvent):void{		if (e.target.name != "dot") return;	draw_curve = true;	e.target.startDrag(true);}function onUp(e:MouseEvent):void{		draw_curve = false;	e.target.stopDrag();}function onMove(e:MouseEvent):void{		if (!draw_curve) return;	drawTheCurve(canvas, tran.pos(mc_a), tran.pos(mc_b), tran.pos(mc_c));	}function drawTheCurve(canvas:Sprite, A:Point, B:Point, C:Point):void{		with (canvas.graphics){					clear();		// draw the curve		lineStyle(3, 0x663300, 0.5);		moveTo(A.x, A.y);		curveTo(B.x, B.y, C.x, C.y);				// draw D and DB		/*lineStyle(1, 0x00FF00);		drawCircle(D.x, D.y, 5);		moveTo(D.x, D.y);		lineTo(D.x + DB.x, D.y + DB.y);*/	}}function drawPointsABC(x:Number, y:Number):void{	trace("draw at x:"+x, " y:"+y)	 drawPoint(mc_a, x, y, 10, 0xFF3333);	 drawPoint(mc_b, x+80, y+80, 10, 0xFF33FF);	 drawPoint(mc_c, x+120, y, 10, 0x00FF33);}function drawPoint(sp:Sprite, x:Number, y:Number, size:Number, color:uint):void{	trace("draw:"+sp)	sp.graphics.lineStyle(3, 0x663300, 0.5);	sp.graphics.beginFill(color);	sp.graphics.drawCircle(0, 0, size);	sp.graphics.endFill()	sp.x = x;	sp.y = y;}