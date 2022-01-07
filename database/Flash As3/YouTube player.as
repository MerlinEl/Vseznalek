//Playing back  videos using the embedded player.//We will have to use the following URL to load the chromeless player in our Flash:http://www.youtube.com/apiplayer?version=31http://www.youtube.com/apiplayer?version=3To load the embedded player, we will have to use the following URL and to replace the string VIDEO_ID with the YouTube Video id:http://www.youtube.com/v/VIDEO_ID?version=31http://www.youtube.com/v/VIDEO_ID?version=3To use the JavaScript API with Flash players, we will have to add enablejsapi=1 to the URL of the player:http://www.youtube.com/apiplayer?version=3&amp;enablejsapi=11http://www.youtube.com/apiplayer?version=3&amp;enablejsapi=1//The code of the example is the following:package {	import flash.display.*;	import flash.net.*;	import flash.system.*;	import flash.events.*;	import flash.external.ExternalInterface;	import flash.text.*;	public class ChromelessYouTubePlayer extends Sprite {		Security.allowDomain(&quot;www.youtube.com&quot;);		private var player:Object;		private var loader:Loader = new Loader();		private var _state:String;		private var tf1:TextField;		private var textPlayed:String = &quot;&lt;a href=&#039;event:null&#039;&gt;&lt;u&gt;Pause&lt;/u&gt;&lt;/a&gt;&quot;;		private var textPaused:String = &quot;&lt;a href=&#039;event:null&#039;&gt;&lt;u&gt;Play&lt;/u&gt;&lt;/a&gt;&quot;;		// CONSTRUCTOR		public function ChromelessYouTubePlayer() {			loader.contentLoaderInfo.addEventListener(Event.INIT, onLoaderInit);			loader.load(new URLRequest(&quot;http://www.youtube.com/apiplayer?version=3&quot;));			//Button;			tf1 = createCustomTextField(5,330,50,22);			tf1.htmlText = textPaused;			tf1.addEventListener(MouseEvent.CLICK, playOrPauseVideo);		}		private function onLoaderInit(event:Event):void {			addChild(loader);			loader.content.addEventListener(&quot;onReady&quot;, onPlayerReady);			loader.content.addEventListener(&quot;onError&quot;, onPlayerError);			loader.content.addEventListener(&quot;onStateChange&quot;, onPlayerStateChange);		}		private function onPlayerReady(event:Event):void {			// Event.data contains the event parameter, which is the Player API ID 			trace(&quot;player ready:&quot;, Object(event).data);			player = loader.content;			// Set appropriate player dimensions for your application			player.setSize(580, 326);			player.cueVideoByUrl(&quot;http://www.youtube.com/v/9BaFnsvKAiA?version=3&quot;);		}		private function onPlayerError(event:Event):void {			// Event.data contains the event parameter, which is the error code			trace(&quot;player error:&quot;, Object(event).data);		}		private function onPlayerStateChange(event:Event):void {			// Event.data contains the event parameter, which is the new player state			var state:Number = Object(event).data;			// update our status			switch ( state ) {				case -1 :					_state = &quot;unstarted&quot;;					break;				case 0 :					_state = &quot;ended&quot;;					break;				case 1 :					_state = &quot;playing&quot;;					tf1.htmlText = textPlayed;					break;				case 2 :					_state = &quot;paused&quot;;					tf1.htmlText = textPaused;					break;				case 3 :					_state = &quot;buffering&quot;;					break;				case 5 :					_state = &quot;video cued&quot;;					break;			}		}		private function playOrPauseVideo(event:Event):void {			if (_state == &quot;playing&quot;) {				player.pauseVideo();			} else {				player.playVideo();			}		}		private function createCustomTextField(x:Number, y:Number, width:Number, height:Number):TextField {			var result:TextField = new TextField();			result.x = x;			result.y = y;			result.width = width;			result.height = height;			result.selectable = false;			var format:TextFormat = new TextFormat();			format.font = &quot;Arial&quot;;			format.size = 12;			format.color = 0xFF0000;			result.defaultTextFormat = format;			addChild(result);			return result;		}	}}//The code of this example is the following:package {	import flash.display.*;	import flash.net.*;	import flash.system.*;	import flash.events.*;	public class embeddedYouTubePlayer extends Sprite {		Security.allowDomain(&quot;www.youtube.com&quot;);		private var player:Object;		private var loader:Loader = new Loader();		// CONSTRUCTOR		public function embeddedYouTubePlayer() {			loader.contentLoaderInfo.addEventListener(Event.INIT, onLoaderInit);			loader.load(new URLRequest(&quot;http://www.youtube.com/v/9BaFnsvKAiA?version=3&quot;));		}		private function onLoaderInit(event:Event):void {			addChild(loader);			loader.content.addEventListener(&quot;onReady&quot;, onPlayerReady);		}		private function onPlayerReady(event:Event):void {			player = loader.content;			player.setSize(580, 360);		}	}}//The function to set it in Fullscreen mode would be the following. We may also use the YouTube AS3 API to change the video resolution to put it in Fullscreen mode.		private function toggleFullScreen(event:MouseEvent):void {            switch(stage.displayState) {                case &quot;normal&quot;:                    stage.displayState = &quot;fullScreen&quot;;					tf1.htmlText = textNormalScreen;                    break;                case &quot;fullScreen&quot;:                default:                    stage.displayState = &quot;normal&quot;;  					tf1.htmlText = textFullScreen;                      break;            }        }