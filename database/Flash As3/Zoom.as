private var gcTM:Matrix = gridContainer.transform.matrix.clone();stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheel);		private function mouseWheel(e:MouseEvent):void {						grid.zoom(e.delta);		}public function zoom(delta:Number, min:Number = 0.8, max:Number = 1.8, step:Number = 0.4):void {						//gcTM Matrix: a=scaleX, b=skewY, c=skewX, d=scaleY, tx=pos_x, ty=pos_y			var internal_point:Point = new Point(gridContainer.mouseX, gridContainer.mouseY);			var external_point:Point = new Point(mouseX, mouseY);						if (delta > 0 && gcTM.a < max) {				//ftrace("IN")				gcTM.a += step; //scaleX				gcTM.d += step; //scaleY							} else if (delta < 0 && gcTM.a > min) {				//ftrace("OUT")				gcTM.a -= step;				gcTM.d -= step;			}						MatrixTransformer.matchInternalPointWithExternal(gcTM, internal_point, external_point);			TweenLite.to(gridContainer, 1, { x:gcTM.tx, y:gcTM.ty, scaleX:gcTM.a, scaleY:gcTM.d } );		}			var Map:Sprite = Main.CARDMAN;			var internalPoint:Point = new Point(Map.mouseX, Map.mouseY);			var externalPoint:Point = new Point(Main.SCENE.mouseX, Main.SCENE.mouseY);			Map.scaleX = Map.scaleX + e.delta * .01;			Map.scaleY=Map.scaleX;			var matrix:Matrix = Map.transform.matrix;			MatrixTransformer.matchInternalPointWithExternal(matrix, internalPoint, externalPoint);			Map.transform.matrix = matrix;									var mc:Sprite = Main.CARDMAN;			var mod:Number = 20;			mc.scaleX += e.delta / mod;			mc.scaleY += e.delta / mod;			mc.x = ((2 * Main.SCENE.mouseX) - (2 * (e.localX * mc.scaleX))) / 2;			mc.y = ((2 * Main.SCENE.mouseY) - (2 * (e.localY * mc.scaleY))) / 2;*/						var mc:Sprite = Main.CARDMAN;			var zoomCenter:Point = new Point(e.stageX, e.stageY);			var mcCenter:Point = new Point(mc.x, mc.y);			var _xCorrection:Number = mcCenter.x-zoomCenter.x;			var _yCorrection:Number = mcCenter.y-zoomCenter.y;			mc.scaleX +=zoomFactor-1;			mc.scaleY +=zoomFactor-1;			mc.x -=_xCorrection*zoomFactor*.5;			mc.y -=_yCorrection*zoomFactor*.5;						trace(e.delta); // this is the amount which each 'click' of the mouse wheel creates			Main.CARDMAN.scaleX = Main.CARDMAN.scaleX + e.delta * zoom;			Main.CARDMAN.scaleY = Main.CARDMAN.scaleY + e.delta * zoom;var m:Matrix = new Matrix();		   m.translate(-internal_point.x, -internal_point.y);//move the center into (0,0)		   m.scale(scale.x, scale.y);//scale relatively to (0,0) (which is where our center is now)		   m.translate(internal_point.x, internal_point.y);//move the center back to its original position		   m.transformPoint(new Point());//transform (0,0) using the whole transformation matrix to calculate the destination of the upper left corner				   var arr:Array = [		   [scale.x, 0],								//[ x-scale		(a )	,	y-skew		(b ) ]		   [0, scale.y],								//[ x-skew		(c )	,	y-scale		(d ) ]		   [m.tx, m.ty]			//[ x-position	(tx)	,	y-position	(ty) ]		   ]				   TweenLite.to(gridContainer, 1, { transformMatrix: {		   a:arr[0][0],  b:arr[0][1],		   c:arr[1][0],  d:arr[1][1],		   tx:arr[2][0], ty:arr[2][1]		   }}); */				/*Old way		 * var internalPoint:Point = new Point(gridContainer.mouseX, gridContainer.mouseY);		   var externalPoint:Point = new Point(mouseX, mouseY);				   if (delta > 0 && gridContainer.scaleX < max_scale) { //IN				   gridContainer.scaleX += zoom_step;		   gridContainer.scaleY += zoom_step;				   } else if (delta < 0 && gridContainer.scaleX > min_scale) { //OUT				   if (gridContainer.width - zoom_step >= stage.stageWidth) {		   gridContainer.scaleX -= zoom_step;		   }		   if (gridContainer.height - zoom_step >= stage.stageHeight) {		   gridContainer.scaleY -= zoom_step;		   }		   }				   //shift gridContainer to mouse cursor		   var matrix:Matrix = gridContainer.transform.matrix.clone();		   MatrixTransformer.matchInternalPointWithExternal(matrix, internalPoint, externalPoint);		   gridContainer.transform.matrix = matrix;/**         * Calculate position and dimensions of image to zoom.         * @param   img - image to animate, need to have transformation pivot in top left corner!         * @param   point - point to zoom in (or null if zoom out) that will be new center of image         * @param   scale - scale in zoom in         * @param   viewWidth - container width         * @param   viewHeight - container height         * @return  object for tween engine with parameters to animate         */        private function centerOn(img:DisplayObject, point:Point=null, scale:Number=2, viewWidth:Number=300, viewHeight:Number=200):Object        {            var r:Object;            var mm:Matrix = img.transform.matrix;            img.transform.matrix = new Matrix();            if (point == null) { // oryginal size                r = { x: 0, y: 0, width: img.width, height: img.height };            }else { // zoom                img.scaleX = img.scaleY = scale;                point.x *= scale;                point.y *= scale;                img.x = -point.x + viewWidth / 2;                img.y = -point.y + viewHeight / 2;                r = { x: img.x, y: img.y, width: img.width, height: img.height };            }            img.transform.matrix = mm;            return r;        }TweenLite.to(baseImage, 1, centerOn(baseIMG, new Point(100, 150))); //zoom inTweenLite.to(baseImage, 1, centerOn(baseIMG)); //zoom outcenterOn(img, new Point(200, 135), 4, stage.stageWidth, stage.stageHeight); // to fit stage size