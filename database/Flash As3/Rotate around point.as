import flash.events.*;import flash.display.*;import flash.geom.Point;var ball:MovieClip = new MovieClip();ball.graphics.beginFill(0xff0000,1);ball.graphics.drawCircle(0,0,15);ball.graphics.endFill();addChild(ball);ball.x =100;ball.y = 200;var centralObject:MovieClip = new MovieClip();centralObject.graphics.beginFill(0x000000, 1);centralObject.graphics.drawCircle(0,0, 5);centralObject.graphics.endFill();addChild(centralObject);centralObject.x = 200;centralObject.y = 200;function degToRad(deg:Number):Number{    var rad:Number = deg* (Math.PI/180);    return rad;}var centralPoint:Point = new Point(200,200);var distanceFromCentralPoint:Number = 100;var degPerCycle:Number = 5;var currentDeg:Number = 0;addEventListener(Event.ENTER_FRAME, moveRedBall, false,0,true);function moveRedBall(e:Event):void{    ball.x = centralPoint.x + (distanceFromCentralPoint * Math.cos(degToRad(currentDeg)));    ball.y = centralPoint.y + (distanceFromCentralPoint * Math.sin(degToRad(currentDeg)));    currentDeg += degPerCycle;}private function rotateObject(obj:Object3D,changePosition:Boolean = false,Pivot:Vector3D = null):void		{			//update posX posY posZ from object matrix			obj.updateTransform();			var pX:Number = obj.posX;			var pY:Number = obj.posY;			var pZ:Number = obj.posZ;			obj.modelToWorld.prependRotation( _X, Vector3D.X_AXIS);			obj.modelToWorld.prependRotation( _Y, Vector3D.Y_AXIS);			obj.modelToWorld.prependRotation( _Z, Vector3D.Z_AXIS);			//loacation manipulation			if (changePosition)			{				var RadiusX:Number = DistanceBetween2Points(new Point(pY,pZ),new Point(Pivot.y,Pivot.z) );				var radiansX:Number = radiansBetween2Points(new Point(pY,pZ),new Point(Pivot.y,Pivot.z) );				pY = RadiusX * Math.cos(radiansX + _XR);				pZ = RadiusX * Math.sin(radiansX + _XR);				var RadiusY:Number = DistanceBetween2Points(new Point(pX,pZ),new Point(Pivot.x,Pivot.z));				var radiansY:Number = radiansBetween2Points(new Point(pX,pZ),new Point(Pivot.x,Pivot.z));				pX = RadiusY * Math.cos(radiansY + _YR);				pZ = RadiusY * Math.sin(radiansY + _YR);			}			//restore position			var m:Vector.<Number> = obj.modelToWorld.rawData;			obj.modelToWorld = new Matrix3D(				new <Number>[					m[0],m[1],m[2],pX,					m[4],m[5], m[6],pY,					m[8],m[9],m[10],pZ,					m[12],m[13],m[14],m[15]				]			);		}