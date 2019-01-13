For a project I’ve been looking around for a decent solution to the problem of saving a text file (to be more precise XML file) from Actionscript 3 to my local harddisc but i couldn’t find a solution for this (what not necessarily means that there is none).Saving and loading can be smoothly achieved with Adobe Air but not with Flash because Flash has been designed to run on the web. However, it is possible to download and upload files via AS3 on and from your HD to and from a webserver. Think of an Flash MP3 shop: You can click on an MP3 in Flash and you will be asked where to save the file and afterwards the file is being downloaded to the chosen location on your HD. So it must be somehow possible.Additionally, it is possible to create XML or other text in Flash and store it on a webserver and vice versa.Thus I came upon following solution:var serverUrl:String = "http://your-domain.com/pathToPHPScript/";var xmlSaveScriptUrl:String = serverUrl + "scriptName.php";  var fileUrl:String = serverUrl+"remoteFileName.xml";var request:URLRequest = new URLRequest();request.url = xmlSaveScriptUrl;request.method = URLRequestMethod.POST;var requestVariables:URLVariables = new URLVariables();//1st POST variable: filenamerequestVariables.filename = "remoteFileName.xml";//2nd POST variable: xmlcontents, your text file!requestVariables.xmlcontents = saveXML;request.data = requestVariables;//sendToURL is built-in function that just sends a requestsendToURL(request);<?php #1st POST variable$fileName = $_POST["filename"];#2nd POST variable$xmlContents = $_POST["xmlcontents"];#remove backslashes from xml string (skip this for plain text)$lastBackslashPos = strpos ($xmlContents, "\\");while($lastBackslashPos >0){   $xmlContents = substr($xmlContents,0,$lastBackslashPos)      .substr($xmlContents,$lastBackslashPos+1,strlen($xmlContents));   $lastBackslashPos = strpos ($xmlContents, "\\");}#write xml data to file on server$fh = fopen($fileName, "w");fwrite($fh, $xmlContents);fclose($fh);?>var request:URLRequest = new URLRequest();request.url = fileUrl;request.method = URLRequestMethod.GET;var fileToDownload:FileReference = new FileReference();try{   fileToDownload.download(request, "defaultFileName.xml");}catch (error:Error){   trace("Unable to download file.");}