 package {
	 import flash.display.Sprite 
	 import flash.events.Event
	 import flash.geom.Pointimport 
	 
	 flash.geom.Rectangle[SWF(width="400", height="400", frameRate="60", backgroundColor="#ffffff")]
	 
	 public class MagLens extends Sprite {
	 public var points:Array = []
	 public function MagLens() {
		 var ii:int
		 var ij:int
		 var pt:Node
		 for (ii = 0; ii < 40; ++ii) {
			for (ij = 0; ij < 40; ++ij) {
				pt = new Node()
				pt.graphics.beginFill(0xffcc99)
				pt.graphics.drawRect(-3, -3, 6, 6)
				pt.x = ii*10
				pt.y = ij*10
				pt.nx = ii*10
				pt.ny = ij*10
				this.addChild(pt)
				this.points.push(pt)
			}
		}
		 addEventListener(Event.ENTER_FRAME, enterFrameHandler, false, 0, true)
	 }
	 public function enterFrameHandler(evt:Event):void {
			 var ipt:intvar vec:Point = new Point()
			 var sqlen:Number
			 var radius:Number = 80.0
			 var rad2:Number = radius * radius
			 var strength:Number = 1800.0
			 for (ipt = 0; ipt < this.points.length; ++ipt) {
				vec.x = this.points[ipt].nx - mouseX
				vec.y = this.points[ipt].ny - mouseY
				sqlen = vec.x * vec.x + vec.y * vec.y
				 // Ignore if it's too far
				 // Check the distance by squared values as vector normalization
				 // is an expensive operation (it utilizes the square root op)
				 if (sqlen > rad2) {
					this.points[ipt].x = this.points[ipt].nx
					this.points[ipt].y = this.points[ipt].ny
					continue
				}
				vec.normalize(strength)
				this.points[ipt].x = this.points[ipt].nx + vec.x / radius
				this.points[ipt].y = this.points[ipt].ny + vec.y / radius
			 }
		 }
	 }
 }
 import flash.display.Sprite