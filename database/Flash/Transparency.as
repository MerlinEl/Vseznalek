//two transparent colored boxes 	     var bmpData:BitmapData = new BitmapData(200, 200, true, 0x5500FF00);            var bmp:Bitmap = new Bitmap(bmpData);            addChild(bmp);            var bmp2:Bitmap = new Bitmap();            bmp2.bitmapData = new BitmapData(200, 200, true, 0x55FF0000);            bmp2.x = bmp2.y = 200;            addChild(bmp2);//mask one bitmap with anothervar texture:Bitmap = new Bitmap(new BitmapData(200, 200, false, 0xFFFFFF)); //white texture   var imageMask:Bitmap = new Bitmap(new BitmapData(200, 200, true, 0)); //empty mask//draw in mask desired shapevar rect:Rectangle = new Rectangle(0, 0, 20, 20);rect.x = 50;rect.y = 50;imageMask.bitmapData.fillRect(rect, 0xFF000000);//apply mask to texturetexture.cacheAsBitmap = true;imageMask.cacheAsBitmap = true;texture.mask = imageMask;addChild(imageMask);addChild(texture);//gradient mask			//generate canvas image			var bmp:Bitmap = new Bitmap(new BitmapData(363, 363, false, 0xFFFFFF)); //white texture  			var _canvas:Sprite = new Sprite();			_canvas.alpha = 0.2			_canvas.addChild(bmp);			addChild(_canvas);			//center canvas to stage			_canvas.x = (stage.stageWidth - _canvas.width) * 0.5;			_canvas.y = (stage.stageHeight - _canvas.height) * 0.5;						//generate empty mask shape			var maskingShape:Shape = new Shape();			addChild(maskingShape);			//center to canvas			maskingShape.x = _canvas.x;			maskingShape.y = _canvas.y;			//draw gradient mask			drawGradientInMask(maskingShape, bmp.width, bmp.height, true);			//apply mask			_canvas.cacheAsBitmap = true;			maskingShape.cacheAsBitmap = true;			_canvas.mask = maskingShape;		/**		 * www.flashandmath.com		 * Last modified 01.24.2017 Orien		 * @param	mask_shape		 */		private function drawGradientInMask(mask_shape:Shape, w:Number, h:Number, inner:Boolean = false):void {						var mat:Matrix = new Matrix();			var colors:Array = [0xFFFFFF, 0xFFFFFF]; //white colors			var alphas:Array = inner ? [0, 1] : [1, 0]; //mask begins from center [0,1] or border [1,0]			var ratios:Array = [10, 255]; //gradient range: [from, to]			mat.createGradientBox(w, h);			mask_shape.graphics.lineStyle();			mask_shape.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, mat);			mask_shape.graphics.drawEllipse(0, 0, w, h);			mask_shape.graphics.endFill();		}		/*Flash and Math HowTos and Tips.www.flashandmath.comLast modified August 14, 2009.*//*In this How-To, we show how to create a gradient (or a 'soft' mask).For creating simple masks with sharp edges, check out:http://www.flashandmath.com/howtos/mask/To see how to manipulate masks dynamically and how to animate them,visit our tutorial:http://www.flashandmath.com/intermediate/masking/*//*We imported a jpeg image, nandi.jpg, to the Stage, converted it to a MovieClip called 'PrepPic', and then we linked the MovieClip to AS3 via Linkage item in the Library menu(Flash CS3), or Properties - Linkage item (Flash CS4). A Library object that is linkedto AS3, can be instantiated at runtime and this is what we are doing below.*/var maskedClip:MovieClip=new PrepPic();this.addChild(maskedClip);maskedClip.x=50;maskedClip.y=45;var clipWidth:Number=maskedClip.width;var clipHeight:Number=maskedClip.height;var maskingShape:Shape=new Shape();//Even though the mask itself will not be visible, it MUST be//added to the Display List.this.addChild(maskingShape);maskingShape.x=maskedClip.x;maskingShape.y=maskedClip.y;//We call a function, defined later in the script, that draws a gradient//in 'maskingClip'.drawInMask();/*The next two lines are crucial for a gradient mask to bahaveproperly: both a masked Display Object and a masking Display Objectmust be cached as Bitmaps. Otherwise, the whole area of the gradient(except for the completely transparent areas) will fully reveal the underlying image, and the gradient effect will not happen.*/maskedClip.cacheAsBitmap=true;maskingShape.cacheAsBitmap=true;/*The next line assigns 'maskingShape' as a mask of 'maskedClip'.Comment out this line and test the movie. You see a gradient-filledrectangle drawn in 'maskingShape'. It is a radial gradient,centered in the middle of the rectangle. What is changing in the gradientis not the color (it remains white) but the opacity. Near the center,the color is opaque. It becomes more and more transparent as youget farther from the center. When assigned as a mask, the opaqueportions of the gradient will show the underlying image, the transparent parts less so. The more transparent the mask, the lessvisible is the underlying image. It may seem counterintuitive but it is not.Remember, it is the FILLED areas of a mask that act as windows to see through.The less 'filled' - in other words, the more transparent - areas, the less shows through.*/maskedClip.mask=maskingShape;/*The function drawInMask draws the gradient in 'maskingClip' that you just sawif you commented out the line above. Drawing gradients deserves a separatetutorial or a How-To. We use the matrix parameter that you can passto 'beginGradientFill' method. We use the 'createGradientBox' methodof the Matrix class. The dimensions of our 'GradientBox'coincide with those of our 'maskedClip'. The other parametersthat the 'beginGradientFill' method takes are colors (immaterial in our case),alphas, and ratios. Our alphas Array determines that the colors (both white)will change their opacity from 1 to 0, starting from the centerof the gradient. The ratios determine how the alphas will be distributedthroughout the gradient box. ratios=[0,255] would give a half-and-half distribution. ratios=[200,255] cause alpha=1 (completely opaque) to occupy most of the gradient, and alpha less than 1 only the edges.*/function drawInMask():void {		var mat:Matrix= new Matrix();	var colors:Array=[0xFFFFFF,0xFFFFFF];	var alphas:Array=[1,0];	var ratios:Array=[50,255]; //gradient range: [from, to]	mat.createGradientBox(clipWidth,clipHeight);	maskingShape.graphics.lineStyle();	maskingShape.graphics.beginGradientFill(GradientType.RADIAL,colors,alphas,ratios,mat);	maskingShape.graphics.drawEllipse(0,0,clipWidth,clipHeight);	maskingShape.graphics.endFill();}/*The masked object can be any Display Object, not necessarilya MovieClip. The masking object can also be any Display Object,not necessarily a Shape. *///To remove a mask set the mask property of the masked object to null//and remove the masking object://maskedClip.mask=null;//this.removeChild(maskingShape);