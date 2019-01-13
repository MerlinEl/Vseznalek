BitmapData Average Colours 28Code : Finding the Average Colours in an ImageBitmapData Average ColoursIf you want a very simple way of extracting a colour palette from an image, one technique would be to average the colour values within specific areas. Averaging colour values is almost identical to averaging numbers, except with the added initial step of finding the red, green and blue components of the colour. To do this we can use bitwise operators, in this case bitwise shift, to perform fast operations on each bit inside the unsigned integer returned by getPixel or getPixel32. If you want to know more about bitwise operators, Moock has written a detailed and, as ever, very clear article on where, when and why to use bitewise operations. You can read it here.So once you’re familiar with how to shift the bits of an integer, you can easily get the RGB values from a 24 bit hexadecimal by moving the bits to the right by a certain amount using the bitwise right shift operator (>>).For example, getting the red, green and blue values from a 24 bit integer would look like:var colour:uint = 0x33CC99;var R:Number = colour >> 16 & 0xFF;var G:Number = colour >> 8  & 0xFF;var B:Number = colour & 0xFF;And finding the alpha, red, green and blue values of a 32 bit integer:var colour:uint = 0xFF33CC99;var A:Number = colour >> 24 & 0xFF;var R:Number = colour >> 16 & 0xFF;var G:Number = colour >> 8 & 0xFF;var B:Number = colour & 0xFF;So we know that by shifting the bits to the right, we can effectively break an unsigned integer representing a colour into its specific components, but what about changing these components back into an RGB or ARGB value? Well, it’s simply a matter of shifting the bits in the other direction, using the bitwise left shift operator, which looks like this << (two less than operators next to each other).So using this bitwise shift left operator, you can take your RGB or ARGB values and cram the little buggers back into a usable format, with a little help from bitwise OR:// RGBvar colourRBG:uint = (R << 16 | G << 8 | B);// ARGBvar colourARBG:uint = (A << 24 | R << 16 | G << 8 | B);Right, so we know how to take an unsigned integer, for example one that’s been returned from getPixel or getPixel32 and break it down into its RGB or ARGB components – and then for the sake of universal harmony, put it back together again and release it back into its 24 or 32bit world with all its binary friends.So now, finding the average colour within a set of colours is simply a question of averaging the red, green and blue values of all the colours, and then turning these averages into a new colour.The method bellow does just this, by looping through the pixels in a BitmapData object, adding up all of the red, green and blue values, dividing them by the total number of pixels and then creating a new colour from the results.public static function averageColour( source:BitmapData ):uint{	var red:Number = 0;	var green:Number = 0;	var blue:Number = 0;	var count:Number = 0;	var pixel:Number;	for (var x:int = 0; x < source.width; x++)	{		for (var y:int = 0; y < source.height; y++)		{			pixel = source.getPixel(x, y);			red += pixel >> 16 & 0xFF;			green += pixel >> 8 & 0xFF;			blue += pixel & 0xFF;			count++		}	}	red /= count;	green /= count;	blue /= count;	return red << 16 | green << 8 | blue;}So taking this a step further; say we want an array of 64 colours from an image, we can break the input image down into 64 chunks and find the averages of each. The easiest way of doing this is to build a grid, copy the pixels in each cell and use the averageColour function to return the average colour value of that cell.public static function averageColours( source:BitmapData, colours:int ):Array{	var averages:Array = new Array();	var columns:int = Math.round( Math.sqrt( colours ) );	var row:int = 0;	var col:int = 0;	var x:int = 0;	var y:int = 0;	var w:int = Math.round( source.width / columns );	var h:int = Math.round( source.height / columns );	for (var i:int = 0; i < colours; i++)	{		var rect:Rectangle = new Rectangle( x, y, w, h );		var box:BitmapData = new BitmapData( w, h, false );		box.copyPixels( source, rect, new Point() );		averages.push( averageColour( box ) );		box.dispose();		col = i % columns;		x = w * col;		y = h * row;		if ( col == columns - 1 ) row++;	}	return averages;}//ORThere’s a much easier way to find the average color of an area of pixels. It can streamline you code immensely, be more accurate, and be easy on your processor. First take your bitmapData for the bitmap you are sampling. Scale it down using a matrix… then blow it back up using a different matrix! The following essentially pixelates the image and blows it back up to fill the bitmap. Simply supply the function with a bitmap, the desired pixel width, and the desired pixel height. You can then sample each of those sections much easier.function pixelate(bitmap:Bitmap,pixelWidth:Number,pixelHeight:Number):BitmapData {	var pixelScaleX:Number=1/pixelWidth;//find scale	var pixelScaleY:Number=1/pixelHeight;	// shrink bitmap	var smallBitmapData:BitmapData=new BitmapData(pixelScaleX*bitmap.width,pixelScaleY*bitmap.height,true,0x00000000);//create small bitmap	var smallMatrix:Matrix=new Matrix();	smallMatrix.scale(pixelScaleX,pixelScaleY);//physically scales the bitmap	smallBitmapData.draw(bitmap,smallMatrix,new ColorTransform(),"normal",new Rectangle(0,0,bitmap.width,bitmap.height),false);// get original bitmap at smaller size using the smallMatrix	// enlarge bitmap	var newBitmapData:BitmapData=new BitmapData(bitmap.width,bitmap.height,true,0x00000000);//create normal sized bitmap	var newMatrix:Matrix=new Matrix();	newMatrix.scale(bitmap.width/smallBitmapData.width,bitmap.height/smallBitmapData.height);	newBitmapData.draw(smallBitmapData,newMatrix,new ColorTransform(),"normal",new Rectangle(0,0,bitmap.width,bitmap.height),false);	// return the new bitmap	return newBitmapData;}//OR//  Assumes that source.width / blockSize has no remainder//  Same with source.height / blockSizepublic function getMosaic( source:BitmapData, blockSize:int ):BitmapData{    var bitmap:Bitmap = new Bitmap( source );    bitmap.smoothing = true;  // blends pixels values    var smaller:BitmapData = new BitmapData( source.width  / blockSize,                                             source.height / blockSize );    var matrix:Matrix = new Matrix();    matrix.scale( 1 / blockSize, 1 / blockSize );    smaller.draw( bitmap, matrix );    bitmap = new Bitmap( smaller );    //  Avoid "bitmap.smoothing = true" here to keep it blocky    var blocky:BitmapData = new BitmapData( source.width, source.height );    matrix.invert();  //  gives the opposite effect from before    blocky.draw( bitmap, matrix );    smaller.dispose();  //  always dispose BitmapData no longer needed    return blocky;}