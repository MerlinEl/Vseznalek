var fileRef:FileReference = new FileReference();fileRef.addEventListener( Event.SELECT, uploadFile );fileRef.addEventListener( ProgressEvent.PROGRESS, fileUploadProgress );fileRef.addEventListener( Event.COMPLETE, fileUploadComplete );button.addEventListener( MouseEvent.CLICK, browseForFile );function browseForFile( e:Event ):void{fileRef.browse();}function uploadFile( e:Event ):void{fileRef.upload( new URLRequest( "http://localhost/php5dev/test/upload_script.php"  ), "as3File", false );}function fileUploadProgress( e:ProgressEvent ):void{trace( ( e.bytesLoaded / e.bytesTotal ) * 100 );}function fileUploadComplete( e:Event ):void{trace( "upload complete" );}//OR  http://www.beautifycode.com/webcam-flash-php-upload-to-server    import com.adobe.images.JPGEncoder;         var video:Video;    var camera:Camera;         var imgBA:ByteArray;    var imgBD:BitmapData;    var imgBitmap:Bitmap;         var phpPath:String;    var jpgEncoder:JPGEncoder;    var sendHeader:URLRequestHeader;    var sendReq:URLRequest;    var sendLoader:URLLoader;         var imagePath:String;         setupCamera(480,320);    setupApplication();         function setupCamera(w:int,h:int):void {        try {            camera = Camera.getCamera();        } catch(e:Error) {            trace("No Camera detected!");        }               camera.addEventListener(StatusEvent.STATUS, camStatusHandler);        camera.setMode(w,h,stage.frameRate);               video = new Video(w,h);        video.attachCamera(camera);        addChild(video);    }         function camStatusHandler(event:StatusEvent):void {        // Camera.Muted or Camera.Unmuted -> User's security        trace(event.code);    }         function setupApplication():void {        shotBtn.addEventListener(MouseEvent.CLICK, createSnapshot);        removeBtn.addEventListener(MouseEvent.CLICK, removeSnapshot);        sendBtn.addEventListener(MouseEvent.CLICK, sendImage);               phpPath = "http://labs.beautifycode.com/webcamimages/saveimg.php"             jpgEncoder = new JPGEncoder(90);             sendHeader = new URLRequestHeader("Content-type","application/octet-stream");        sendReq = new URLRequest(phpPath);        sendReq.requestHeaders.push(sendHeader);        sendReq.method = URLRequestMethod.POST;               sendLoader = new URLLoader();        sendLoader.addEventListener(Event.COMPLETE,imageSentHandler);    }         function createSnapshot(event:MouseEvent):void {        imgBD = new BitmapData(video.width,video.height);        imgBD.draw(video);               imgBitmap = new Bitmap(imgBD);        addChild(imgBitmap);             shotBtn.removeEventListener(MouseEvent.CLICK, createSnapshot);    }         function removeSnapshot(event:MouseEvent):void {        removeChild(imgBitmap);        shotBtn.addEventListener(MouseEvent.CLICK, createSnapshot);    }         function sendImage(event:MouseEvent):void {        imgBA = jpgEncoder.encode(imgBD);             sendReq.data = imgBA;        sendLoader.load(sendReq);    }         function imageSentHandler(event:Event):void {        var dataStr:String = event.currentTarget.data.toString();        var resultVars:URLVariables = new URLVariables();        resultVars.decode(dataStr);               imagePath = "http://" + resultVars.base + "/" + resultVars.filename;        trace("Uploaded to: " + imagePath);    }    <?php    if ( isset ( $GLOBALS["HTTP_RAW_POST_DATA"] )) {        $uniqueStamp = date(U);        $filename = $uniqueStamp.".jpg";        $fp = fopen( $filename,"wb");        fwrite( $fp, $GLOBALS[ 'HTTP_RAW_POST_DATA' ] );        fclose( $fp );             echo "filename=".$filename."&base=".$_SERVER["HTTP_HOST"].dirname($_SERVER["PHP_SELF"]);    }    ?>	Here is the AS3 code, it's just some quick and dirty timeline code:var fileRef:FileReference = new FileReference();fileRef.addEventListener( Event.SELECT, uploadFile );fileRef.addEventListener( ProgressEvent.PROGRESS, fileUploadProgress );fileRef.addEventListener( Event.COMPLETE, fileUploadComplete );button.addEventListener( MouseEvent.CLICK, browseForFile );function browseForFile( e:Event ):void{fileRef.browse();}function uploadFile( e:Event ):void{fileRef.upload( new URLRequest( "http://localhost/php5dev/test/upload_script.php"  ), "as3File", false );}function fileUploadProgress( e:ProgressEvent ):void{trace( ( e.bytesLoaded / e.bytesTotal ) * 100 );}function fileUploadComplete( e:Event ):void{trace( "upload complete" );}here is the PHP code:<?php$target = "uploads/" . basename( $_FILES[ "as3File" ][ "name" ] );if ( move_uploaded_file( $_FILES[ "as3File" ][ "tmp_name" ], $target ) )    echo( "file upload success<bt />" );else    echo( "error uploading file<br />" );?>