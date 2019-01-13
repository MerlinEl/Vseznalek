package classes{		import flash.display.Bitmap;	import flash.display.BitmapData;	import flash.geom.Matrix;	public class Icons {				[Embed(source = "../images/organize_library.png")] public static var organize_library:Class;		[Embed(source = "../images/scale_local.png")] public static var scale_local:Class;		[Embed(source = "../images/copy_position.png")] public static var copy_position:Class;		[Embed(source = "../images/paste_position.png")] public static var paste_position:Class;		[Embed(source = "../images/swap_position.png")] public static var swap_position:Class;				public static function init() {			trace("loading Icons...")		};		public static function loadIcon(btn:Buttons, file_name:String):void{						init();			var bmp:Bitmap			switch (file_name){							case "organize_library": bmp = new organize_library(); break;				case "scale_local": bmp = new scale_local(); break;				case "copy_position": bmp = new copy_position(); break;				case "paste_position": bmp = new paste_position(); break;				case "swap_position": bmp = new swap_position(); break;			}			var new_bmp:Bitmap = bitmapScale(bmp,0, 0, 24, 24);			btn.addChild(new_bmp);			//offset icon            new_bmp.x=2;            new_bmp.y=2;			//btn.setStyle("icon",  new_bmp); //cant set offset		};		private static function bitmapScale(bmp:Bitmap, pos_x:Number, pos_y:Number, w:Number, h:Number):Bitmap{					bmp.smoothing = true; //get better performance 			var mat:Matrix = new Matrix();			mat.scale(w/bmp.width, h/bmp.height); //rescale bmp			mat.translate(pos_x , pos_y); //offset bmp						var draw_bd:BitmapData = new BitmapData(w, h, true, 0x00000000);			draw_bd.draw(bmp, mat, null, null, null, true);			var new_bmp = new Bitmap (draw_bd);			return new_bmp;		}	}//class}//package