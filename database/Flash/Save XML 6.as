	http://as3gametuts.com/2012/02/28/actionscript-saving-and-loading-tutorial/import flash.display.MovieClip;	import flash.text.*;	import fl.controls.UIScrollBar;	import flash.events.Event;	import flash.events.TextEvent;	import fl.events.ColorPickerEvent;	import flash.geom.ColorTransform;	import flash.display.Loader;	import flash.net.URLLoader;	import flash.net.URLRequest;		import flash.net.URLRequestMethod;	import flash.net.URLVariables;	import flash.events.HTTPStatusEvent;	import flash.events.IOErrorEvent;	import flash.events.SecurityErrorEvent;			var req:URLRequest = new URLRequest("classes/Save.php");			req.method = URLRequestMethod.POST;			req.contentType = "text/xml";			req.data = "<?xml version='1.0' encoding='utf-8' ?>\n" + textBox.htmlText;			flash.net.sendToURL(req);						import flash.net.FileReference;				import flash.utils.ByteArray;				import flash.filesystem.File;				import flash.filesystem.FileStream;				import flash.filesystem.FileMode;*/												   			// new loader  			var varLoader:URLLoader = new URLLoader();  			// listen for load success  			varLoader.addEventListener(Event.COMPLETE, _onCompleteHandler);  			// listen for general errors  			varLoader.addEventListener(IOErrorEvent.IO_ERROR, _onErrorHandler);  			// listen for security / cross-domain errors  			varLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onErrorHandler);    			// perform load  			varLoader.load(new URLRequest("classes/testsave.php"));			  			// complete handler  			function _onCompleteHandler(e:Event):void  {  				textBox.appendText("Load complete: " + e);  			}    			// error handler  			function _onErrorHandler(e:Event) {  				if (e.type == SecurityErrorEvent.SECURITY_ERROR)  				{  					textBox.appendText("Load failed, Security error: " + e + " type[" + e.type + "]");  				}  					else if (e.type == IOErrorEvent.IO_ERROR)  				{  					textBox.appendText("Load failed, IO error: " + e + " type[" + e.type + "]");  				}  			}																/*				var xmlString:String = "<?xml version='1.0' encoding='UTF-8'?><root><value>63</value></root>";//var xmlString:String = '<?xml version="1.0"?><cross-domain-policy><allow-access-from domain="www.jasonfinley.com" /><allow-access-from domain="jasonfinley.com" /></cross-domain-policy>'var book:XML = new XML(xmlString);var xmlResponse:XML;var xmlURLReq:URLRequest = new URLRequest("classes/savexml2.php");xmlURLReq.data = book;xmlURLReq.contentType = "text/xml";xmlURLReq.method = URLRequestMethod.POST;var xmlSendLoad:URLLoader = new URLLoader();xmlSendLoad.addEventListener(Event.COMPLETE, onComplete, false, 0, true);xmlSendLoad.addEventListener(IOErrorEvent.IO_ERROR, onIOError, false, 0, true);xmlSendLoad.load(xmlURLReq);function onComplete(evt:Event):void {    try {        xmlResponse = new XML(evt.target.data);        textBox.text = xmlResponse;        removeEventListener(Event.COMPLETE, onComplete);        removeEventListener(IOErrorEvent.IO_ERROR, onIOError);		trace("response:"+xmlResponse);		textBox.text = "save complete";    } catch (err:TypeError) {        textBox.text = "An error occured when communicating with server:\n" + err.message;    }}function onIOError(evt:IOErrorEvent):void {    textBox.text = "An error occurred when attempting to load the XML.\n" + evt.text;}				*/					trace("saving XML:"+textBox.htmlText)							/*var data:ByteArray = new ByteArray();				data.writeUTFBytes(textBox.htmlText); // xmlData is original XML string				data.compress();				new FileReference().save(data, "uvod.xml"); // default name "bindata.xml"*/												/*var UrlLoader:URLLoader = new URLLoader();				var PostVariables:URLVariables = new URLVariables();				PostVariables.FlashString = "<store>\n<item>example</item>\n</store>";  // Convert Xml to String;				var UrlRequest:URLRequest = new URLRequest("classes/Save.php");				UrlRequest.method = URLRequestMethod.POST;				UrlRequest.data = PostVariables;				UrlLoader.addEventListener(Event.COMPLETE, ResponseHandler);				try {					UrlLoader.load(UrlRequest);				}				catch (event:Error) {					trace("Error???");					}						function ResponseHandler(event:Event):void {						UrlLoader.removeEventListener(Event.COMPLETE, ResponseHandler);						UrlLoader = URLLoader(event.target);						var PostVariables:URLVariables = new URLVariables(UrlLoader.data);						if(PostVariables.Answer == "Ok") {						trace(PostVariables.Message);					}					else {						trace("Error: " + PostVariables.Answer);					}				}*/												/*//var serverUrl:String = "http://your-domain.com/pathToPHPScript/";				var xmlSaveScriptUrl:String = "classes/saveXML.php";  				var fileUrl:String = "documents/uvod.xml";				var request:URLRequest = new URLRequest();				request.url = xmlSaveScriptUrl;				request.method = URLRequestMethod.POST;				var requestVariables:URLVariables = new URLVariables();				//1st POST variable: filename				requestVariables.filename = fileUrl;				//2nd POST variable: xmlcontents, your text file!				requestVariables.xmlcontents = textBox.htmlText;				request.data = requestVariables;				//sendToURL is built-in function that just sends a request				flash.net.sendToURL(request);*/																				/*var xmlcontents:String = "this is the xml contents to be saved in your xml."				var phpURL:URLRequest = new URLRequest("classes/saveXML.php");				phpURL.method = URLRequestMethod.POST;				phpURL.data = xmlcontents;				var sendLoader:URLLoader = new URLLoader();				sendLoader.load(phpURL);*/																			/*// declaring var xmlcontents String. You should set this first.				var xmlcontents:String = "this is the xml contents to be saved in your xml."				 				// declaring var SERVER_PATH String. This is the path for the saving-xml.php.				var SERVER_PATH:String = "classes/";				 				// declaring var foldername String. This is the folder container of the saved XML file				var foldername:String = "documents";				 				// declaring var filename String. This is the filename of the XML file				var filename:String = "uvod.xml";				 				// declaring var dataPass URLVariables				var dataPass:URLVariables = new URLVariables();				 				// declaring var urlLoader URLLoader				var urlLoader:URLLoader = new URLLoader();				 				// declaring var previewRequest URLRequest				var previewRequest:URLRequest = new URLRequest(SERVER_PATH + "GLF_PHP.php");				 				// i used method "post" in this sample. you can edit this				previewRequest.method = URLRequestMethod.POST;				 				// setting dataPass variables to be passed to PHP				dataPass.filename = filename;				dataPass.xmlcontents = xmlcontents;				dataPass.foldername = foldername;				 				// passing dataPass data PHP				previewRequest.data = dataPass;				 				// calling the PHP or loading the PHP				urlLoader.load(previewRequest);	*/																				/*var req : URLRequest = new URLRequest();				var loader : URLLoader = new URLLoader();				//req.data = textBox.htmlText;								req.data ='<"head">test<"head">'								req.contentType = "text/xml";				req.method = URLRequestMethod.POST;				req.url = "./classes/Save_XML.php";				loader.load(req);*/								/*var ba:ByteArray = new ByteArray();				ba.writeUTFBytes(textBox.htmlText);				var fr:FileReference = new FileReference();				fr.save(ba, "/documents/filename.xml")												var app_root_dir= File.applicationDirectory.nativePath;				var reg_file = File.desktopDirectory.resolvePath(app_root_dir+"\\documents\\test.xml");				var writeStream:FileStream = new FileStream();				writeStream.open(reg_file, FileMode.WRITE);				writeStream.writeBytes(textBox.htmlText); // Any other write method can be used				writeStream.close();*/																				/*var app_root_dir= File.applicationDirectory.nativePath;				var reg_file:File = File.desktopDirectory.resolvePath(app_root_dir+"\\documents\\test.xml");				var fileStream = new FileStream();				fileStream.open(reg_file, FileMode.WRITE);				//write xml_data to the file				fileStream.writeUTFBytes(textBox.htmlText);				fileStream.close(); //finally, close the filestream*/												//var ref:FileReference = new FileReference();				//var fileStream = new FileStream();				//fileStream.writeUTFBytes(textBox.htmlText);				//fileStream.close();								/*				var targetParent:File = reg_file.parent;								targetParent.createDirectory();				fileStream = new FileStream();				fileStream.open(reg_file, FileMode.WRITE);				//write xml_data to the file				fileStream.writeUTFBytes(xmlData);				fileStream.close(); //finally, close the filestream				createHiddenInstalFile();*/package {	import flash.display.Sprite;	import flash.events.*;	import flash.net.*;	public class URLLoaderExample extends Sprite {		public function URLLoaderExample() {			var loader:URLLoader = new URLLoader();			configureListeners(loader);			var request:URLRequest = new URLRequest("urlLoaderExample.txt");			try {				loader.load(request);			} catch (error:Error) {				trace("Unable to load requested document.");			}		}		private function configureListeners(dispatcher:IEventDispatcher):void {			dispatcher.addEventListener(Event.COMPLETE, completeHandler);			dispatcher.addEventListener(Event.OPEN, openHandler);			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);		}		private function completeHandler(event:Event):void {			var loader:URLLoader = URLLoader(event.target);			trace("completeHandler: " + loader.data);			var vars:URLVariables = new URLVariables(loader.data);			trace("The answer is " + vars.answer);		}		private function openHandler(event:Event):void {			trace("openHandler: " + event);		}		private function progressHandler(event:ProgressEvent):void {			trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);		}		private function securityErrorHandler(event:SecurityErrorEvent):void {			trace("securityErrorHandler: " + event);		}		private function httpStatusHandler(event:HTTPStatusEvent):void {			trace("httpStatusHandler: " + event);		}		private function ioErrorHandler(event:IOErrorEvent):void {			trace("ioErrorHandler: " + event);		}	}}