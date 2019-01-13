package classes {		import flash.display.Sprite;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.events.HTTPStatusEvent;	import flash.events.IOErrorEvent;	import flash.display.Loader;	import flash.display.Bitmap;	import flash.events.Event;		public class Image_Border extends Sprite{		private var w:Number= 30;		private var h:Number=30;		private var brd:Sprite = new Sprite();		private var url:URLLoader;		private var picloader:Loader;		private var urlreq:URLRequest;		public var img_path:String = "images/bg.jpg";				public function Image_Border() {			// constructor code			this.addChild(brd);			brd.graphics.lineStyle(1,0);			brd.graphics.beginFill(0xCCCCCC);			brd.graphics.drawRect(0,0,w,h);			brd.graphics.endFill();						brd.x = 20;			brd.y =50;						urlreq = new URLRequest(img_path);			url = new URLLoader(urlreq);			picloader = new Loader();						url.addEventListener(Event.COMPLETE, getlist);		};		function getlist(evt:Event):void{						picloader.contentLoaderInfo.addEventListener(Event.COMPLETE, gotpic)			picloader.removeEventListener(IOErrorEvent.IO_ERROR, onError);			picloader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, onStatus);			picloader.load(urlreq);			url.removeEventListener(Event.COMPLETE, getlist);		};		function gotpic(evt:Event):void{						var mm:Bitmap = new Bitmap();			mm = Bitmap(evt.target.content);			brd.addChild(mm);			mm.x = brd.x;			mm.y = brd.y;			//mm.mask(brd);			picloader.contentLoaderInfo.removeEventListener(Event.COMPLETE, gotpic)		};		private static function onStatus(e:HTTPStatusEvent):void{			trace(e.status);		};		private static function onError(e:IOErrorEvent):void{			trace( e.text);		};	}; //class}; //package