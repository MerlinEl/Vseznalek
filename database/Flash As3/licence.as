			var fileStream:FileStream;

			var date = getDDMMYYYY(); //get date and time in format DDMMYYYY
			var encoded_date = encodeStringNumber(date)
			trace("date:", date, "encoded:", encoded_date, "decoded:", decodeStringLetters(encoded_date));
			
			var xmlData:XML = new XML('<?xml version="1.0" encoding="UTF-8"?><data></data>');
			xmlData.user = user_name; //Current User
			
			if(reg_file.exists) { //if exist update new data

				trace("EDITING FILE");
				//read dupplicated file to allow write on original
				
				reg_file.copyTo(reg_file_tmp, true); 

				var loader:URLLoader = new URLLoader();
				loader.load( new URLRequest(reg_file_tmp.nativePath) );
				loader.addEventListener(Event.COMPLETE, handleComplete);
				
				function handleComplete(e:Event):void{
	
					var rawXML:XML = new XML (loader.data);
					var data:Object = {"user":rawXML.user, "frd":rawXML.frd, "key":rawXML.key};
					
					GLF.debugObject(data)
					loader.removeEventListener(Event.COMPLETE, handleComplete);
					loader.close();

					//write
					fileStream = new FileStream();
					fileStream.open(reg_file, FileMode.WRITE);
					fileStream.writeUTFBytes(xmlData);
					fileStream.close();
				}
				
			}else{ //if not exist create specific reg_file
			
				trace("CREATING NEW FILE");
				//var xmlData:XML = <XML />;
			trace("Serial Number:",demo.serial.text);
			
			
				xmlData.frd = encoded_date; //First Run Encrypted Date
				xmlData.key = "Csef456f45564"; //Generated Serial Number from User Name
				
				var targetParent:File = reg_file.parent;
				targetParent.createDirectory();
				fileStream = new FileStream();
				fileStream.open(reg_file, FileMode.WRITE);
				//write some string to the file
				fileStream.writeUTFBytes(xmlData);
				fileStream.close(); //finally, close the filestream
			}
			demo.console.text = xmlData;