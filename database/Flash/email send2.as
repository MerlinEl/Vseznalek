//as3variables.username = "this_is_a_variable_that_is_being_sent";<?phpextract($_REQUEST);echo $username?>$returnVars = array("send" => $success);$returnString = http_build_query($returnVars);//send variables back to Flashecho $returnString;//classes/email_work_test.php<?php$headers = "From: ucdis@ucdis.cz\r\n";$ok      = mail("baca.rene@gmail.com", "this is my subject", "this is my message", $headers);if($ok){ 	echo "retval=1"; }else{ 	echo "retval=0"; }?>//OR<?php$to = $_POST['to'];$subject = $_POST['subject'];$message = $_POST['body'];$from = $_POST['from'];$headers  = "From:".$from."\r\n"; $headers .= "Content-type: text/html\r\n"; mail($to,$subject,$message,$headers);?>	//classes/main.as      import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.display.Loader;	import flash.events.HTTPStatusEvent;	import flash.events.IOErrorEvent;	import flash.net.URLVariables; 	import flash.net.URLRequestMethod; 	import flash.net.URLLoaderDataFormat;				var loader= new URLLoader(); 				loader.dataFormat = URLLoaderDataFormat.VARIABLES;								var emailRequest = new URLRequest("classes/email_work_test.php");  				// Set the method to POST (we will get these var with the $_POST  array in php				emailRequest.method = URLRequestMethod.POST;				var variables = new URLVariables();  				variables.from = "baca.rene@gmail.com";                             variables.to = "baca.rene@gmail.com";  				variables.message = "test message";  				variables.subject = "test7";				emailRequest.data = variables;				loader.addEventListener(Event.COMPLETE, onResponse);				loader.load(emailRequest); 				// On server response				// Displays an alert depending on the server response				function onResponse(e:Event):void{									trace("data..."+e.target.data)					if (e.target.data == "1") SCENE["input_text"].text = "Your mail has been sent";					else SCENE["input_text"].text = "An error occured while sending your mail";				}		//Regexp for checking email		private static function isValidEmail(email:String):Boolean {			var emailExpression:RegExp = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;			return emailExpression.test(email);		}