import flash.events.Event;import flash.net.URLLoader;import flash.net.URLRequest;import flash.net.URLVariables;import flash.net.URLRequestMethod;var urlLoader:URLLoader = new URLLoader ();var urlRequest:URLRequest = new URLRequest ('whatever.php');var urlVars:URLVariables = new URLVariables ();urlVars.folder = 'path/to/folder';urlRequest.data = urlVars;urlRequest.method = URLRequestMethod.POST;urlLoader.addEventListener (Event.COMPLETE, onComplete);urlLoader.load (urlRequest);		function onComplete (evt:Event) : void {	var xml:XML = XML (urlLoader.data);	trace (xml);} <?phpif ($handle = opendir($_POST['folder'])) {    $xmlReturn = "<data>";    while (false !== ($file = readdir($handle))) {        if ($file != "." && $file != "..") {           $xmlReturn .= '<file name="'.$file.'" />';        }    }    closedir($handle);    echo ($xmlReturn.'</data>');}?> orimport flash.net.URLLoader;import flash.net.URLRequest;import flash.events.Event;var myXML:XML;var myLoader:URLLoader = new URLLoader();myLoader.load(new URLRequest("readDir.php"));myLoader.addEventListener(Event.COMPLETE, processXML);function processXML(e:Event):void{	myXML = new XML(e.target.data);	trace(myXML);}<?phpecho "<images>\n";if($handle = opendir('img/')) {    while(false !== ($file = readdir($handle))) 	{        if($file != "." && $file != "..") 		{			echo "\t<image>" . "img/" . $file . "</image>\n";		}    }    closedir($handle);}echo "</images>\n";?>