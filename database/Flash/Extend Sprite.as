package {    import flash.display.Sprite;    public class ObjectExample extends Sprite {        public function ObjectExample() {            var firstInitObj:Object = new Object();            firstInitObj.bgColor = 0xFF0000;            firstInitObj.radius = 25;            firstInitObj.xCenter = 25;            firstInitObj.yCenter = 25;                                    var firstCircle:Circle = new Circle(firstInitObj);            addChild(firstCircle);            firstCircle.x = 50;            firstCircle.y = 50;            var secondInitObj:Object = {bgColor:0xCCCCCC, radius:50, xCenter:50, yCenter:50};            var secondCircle:Circle = new Circle(secondInitObj);                        addChild(secondCircle);            secondCircle.x = 100;            secondCircle.y = 100;        }            }}import flash.display.Shape;    class Circle extends Shape {    public var bgColor:Number = 0xFFFFFF;    public var radius:Number = 0;    public var xCenter:Number = 0;    public var yCenter:Number = 0;            public function Circle(initObj:Object) {        for(var i:String in initObj) {            this[i] = initObj[i];        }        draw();    }            public function draw():void {        graphics.beginFill(bgColor);        graphics.drawCircle(xCenter, yCenter, radius);        graphics.endFill();    }}