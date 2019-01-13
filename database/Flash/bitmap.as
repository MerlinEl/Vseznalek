=============================================================================================
var mc:MovieClip = new MovieClip();
var sh:Shape = new Shape();
sh.graphics.beginFill(rgbToHEX(255,204,0));
sh.graphics.drawRect(-pg_rect.width/2, -pg_rect.height/2, pg_rect.width, pg_rect.height);
sh.graphics.endFill();

mc.addChild(sh);
//mc.transform.colorTransform = new ColorTransform(0.2, 0.8, 0.8);
all_pages.addChild( mc );

var myBitmap:BitmapData = new BitmapData(200, 200, true, 0xFF0000FF);
sh.graphics.beginBitmapFill(myBitmap);
sh.graphics.drawRect(0, 0, 200, 200);
=============================================================================================
var c:Sprite = new Sprite();
c.graphics.clear();
c.graphics.beginFill(0x00FF00, 0.5);
c.graphics.lineStyle(2.0);
c.graphics.drawRectangle(0, 0, 100, 100);
c.graphics.endFill();
var bd:BitmapData = new BitmapData(100, 100);
bd.draw(c);
var bitmap:Bitmap = new Bitmap(bd);


// create the BitmapData to work on
var pixels:Raster = new Raster(320, 240, true);
=============================================================================================
// draw stuff
pixels.drawRoundRect( new Rectangle ( 20, 20, 200, 100), 18, 0xFF00FFFF );
pixels.drawRect( new Rectangle ( 70, 70, 100, 100 ), 0xFF009900 );
pixels.filledTri( 40, 40, 80, 110, 50, 30, 0xFF998811 );
pixels.aaCircle(100, 100, 40, 0x77AA88 );
pixels.circle(40, 40, 30, 0xFF000000);
pixels.line(10, 10, 60, 80, 0xFF000000 );

// show it
addChild ( new Bitmap ( pixels ) );
=============================================================================================
var inputBitmapData:BitmapData = new BitmapData(200, 200, true, 0xFF0000FF);
inputBitmapData.fillRect(new Rectangle(10, 10, 180, 180), 0xFFFF0000);

			var mtx : Matrix = new Matrix; // No translation, no scale, no rotation
			mtx.translate(100, 0); // translated 100px on X axis
			var shape : Shape = new Shape;
			var myBitmap:BitmapData = new BitmapData(200, 200, true, 0xFF0000FF);
			shape.graphics.beginBitmapFill(myBitmap);
			shape.graphics.drawRect(0, 0, 200, 200);
			stage.addChild(shape)
			
			
function createBitmapClone(target:DisplayObject):Bitmap {
    var targetTransform:Matrix = target.transform.concatenatedMatrix;
    var targetGlobalBounds:Rectangle = target.getBounds(target.stage);
    var targetGlobalPos:Point = target.localToGlobal(new Point());

    // Calculate difference between target origin and top left.
    var targetOriginOffset:Point = new Point(targetGlobalPos.x - targetGlobalBounds.left, targetGlobalPos.y - targetGlobalBounds.top);

    // Move transform matrix so that top left of target will be at (0, 0).
    targetTransform.tx = targetOriginOffset.x;
    targetTransform.ty = targetOriginOffset.y;

    var cloneData:BitmapData = new BitmapData(targetGlobalBounds.width, targetGlobalBounds.height, true, 0x00000000);
    cloneData.draw(target, targetTransform);
    var clone:Bitmap = new Bitmap(cloneData);

    // Move clone to target's global position, minus the origin offset.
    clone.x = targetGlobalPos.x - targetOriginOffset.x;
    clone.y = targetGlobalPos.y - targetOriginOffset.y;

    return clone;
}


function createScaledBitmapClone(target:DisplayObject):Bitmap {
    var targetTransform:Matrix = target.transform.concatenatedMatrix;
    var targetGlobalBounds:Rectangle = target.getBounds(target.stage);
    var targetGlobalPos:Point = target.localToGlobal(new Point());

    // Calculate difference between target origin and top left.
    var targetOriginOffset:Point = new Point(targetGlobalPos.x - targetGlobalBounds.left, targetGlobalPos.y - targetGlobalBounds.top);

    // Create a test Sprite to check if the stage is scaled.
    var testSprite:Sprite = new Sprite();
    target.stage.addChild(testSprite);
    var testMatrix:Matrix = testSprite.transform.concatenatedMatrix;
    target.stage.removeChild(testSprite);

    // Move transform matrix so that top left of target will be at (0, 0).
    targetTransform.tx = targetOriginOffset.x * testMatrix.a;
    targetTransform.ty = targetOriginOffset.y * testMatrix.d;

    var cloneData:BitmapData = new BitmapData(targetGlobalBounds.width * testMatrix.a, targetGlobalBounds.height * testMatrix.d, true, 0x00000000);
    cloneData.draw(target, targetTransform);
    var clone:Bitmap = new Bitmap(cloneData);

    // Move clone to target's global position, minus the origin offset, and cancel out stage scaling.
    clone.x = targetGlobalPos.x - targetOriginOffset.x;
    clone.y = targetGlobalPos.y - targetOriginOffset.y;
    clone.scaleX = 1 / testMatrix.a;
    clone.scaleY = 1 / testMatrix.d;

    return clone;
}