//http://www.jeffguthrie.com/dynamically-add-uiscrollbar-to-textfieldpackage {import flash.display.MovieClip;import flash.events.Event;import flash.text.TextField;import flash.text.TextFormat;import fl.controls.UIScrollBar;//FLEX classesimport mx.rpc.http.HTTPService;import mx.rpc.events.ResultEvent;import mx.collections.ArrayCollection;public class TwitterSearch extends MovieClip {private var _twitterService:HTTPService = new HTTPService();private var _arr:ArrayCollection;private var _twitterMsgs_txt:TextField = new TextField();public function TwitterSearch ():void{addEventListener (Event.ADDED_TO_STAGE, init, false, 0, true);}private function init (e:Event):void {//Load Twitter Feed_twitterService.url = 'http://search.twitter.com/search.atom?q=as3';_twitterService.send();_twitterService.addEventListener(ResultEvent.RESULT, onTwitterResult, false, 0, true);}private function onTwitterResult(e:ResultEvent): void {_arr = e.result.feed.entry as ArrayCollection;//trace(_arr.length);var tweets:String;for (var i:int = 0;i < _arr.length;i++) {//trace(_arr[i].title);tweets += _arr[i].title + 'n';}//trace(tweets);var textFormat:TextFormat = new TextFormat();textFormat.size = 16;textFormat.color = 0xFFFFFF;_twitterMsgs_txt.defaultTextFormat = textFormat;_twitterMsgs_txt.border = true;_twitterMsgs_txt.borderColor = 0xFFFFFF;_twitterMsgs_txt.background = true;_twitterMsgs_txt.backgroundColor = 0x333333;_twitterMsgs_txt.width = 860; _twitterMsgs_txt.height = 100; _twitterMsgs_txt.mouseEnabled = true;_twitterMsgs_txt.multiline = true;_twitterMsgs_txt.wordWrap = true;_twitterMsgs_txt.selectable = true;_twitterMsgs_txt.x = 50;_twitterMsgs_txt.y = 50;_twitterMsgs_txt.text = tweets;//_twitterMsgs_txt.blendMode = BlendMode.LAYER;addChild (_twitterMsgs_txt);//Create the scrollBar instance if necessaryif (_twitterMsgs_txt.textHeight > _twitterMsgs_txt.height) {var scrollBar:UIScrollBar = new UIScrollBar(); scrollBar.scrollTarget = _twitterMsgs_txt;  //assign the target of the scrollBar to your textfieldscrollBar.height = _twitterMsgs_txt.height;  //make the height the same as the textfieldscrollBar.move(_twitterMsgs_txt.x + _twitterMsgs_txt.width, _twitterMsgs_txt.y);  //Move the scrollbar to the righthand sideaddChild(scrollBar);scrollBar.update();}}}}