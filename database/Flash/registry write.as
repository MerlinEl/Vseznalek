<?xml version="1.0" encoding="utf-8"?>
<s:WindowedApplication xmlns:fx="http://ns.adobe.com/mxml/2009"
                  xmlns:s="library://ns.adobe.com/flex/spark"
                  xmlns:mx="library://ns.adobe.com/flex/mx" creationComplete="appInit(event)">
   <fx:Script>
      <![CDATA[
         import adobe.utils.ProductManager;
          
         import flash.desktop.NativeApplication;
          
         import mx.controls.Alert;
         import mx.core.FlexGlobals;
         import mx.events.FlexEvent;
          
         import spark.components.WindowedApplication;
          
         private var appDir:File = File.applicationDirectory.resolvePath(File.applicationDirectory.name);
         private var appType:String = ".exe";
          
         private static var _isAdmin:Boolean;
          
         protected function skipAdmin():void
         {
            show_text.text = "Yeah, Air Application run as admin.";
                
            var file:File = new File(appDir+"\\testfile.txt");
             
            var stream:FileStream = new FileStream();
            stream.open(file, FileMode.WRITE);
            stream.writeUTFBytes("my string to save");
            stream.close();
             
            Alert.show(file.nativePath);
         }
          
         protected function restart():void
         {
            var npStartInfo_restart:NativeProcessStartupInfo = new NativeProcessStartupInfo();
            npStartInfo_restart.executable = appDir;
            npStartInfo_restart.workingDirectory = File.applicationDirectory;
             
            var process_restart:NativeProcess = new NativeProcess();
            process_restart.start(npStartInfo_restart);
             
            var app:WindowedApplication = WindowedApplication(FlexGlobals.topLevelApplication)
            app.close();
            /*
            var app:WindowedApplication = WindowedApplication(FlexGlobals.topLevelApplication);
            var mgr:ProductManager = new ProductManager("airappinstaller");
            mgr.launch("-launch "+app.nativeApplication.applicationID+" "+app.nativeApplication.publisherID);
            app.close();*/
         }
          
          
         protected function appInit(event:FlexEvent):void
         {
            //
            appType = appDir.extension;
         }
          
         protected function AccessClick(event:MouseEvent):void
         {
            if(NativeProcess.isSupported){
               show_text.text = "Yeah Native Process started...";
            }
            var npStartInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();
            var regCommand:File = File.applicationDirectory.resolvePath("C:\\Windows\\System32\\reg.exe");
            npStartInfo.executable = regCommand;
            npStartInfo.workingDirectory = File.applicationDirectory;
             
            var regKeyDir:String = "\""+"HKCU\\Software\\Microsoft\\Windows NT\\CurrentVersion\\AppCompatFlags\\Layers"+"\"";
            var args:Vector.<String> = new Vector.<String>();
            args[0] = " ADD"+ regKeyDir + " /v "+"\"" + appDir + "\"" + " /t REG_SZ /d RUNASADMIN";
            npStartInfo.arguments = args;
             
            var np:NativeProcess = new NativeProcess();
            np.start(npStartInfo);
             
            restart();
         }
          
      ]]>
   </fx:Script>
   <s:Label id="show_text" left="10" top="10" text="Beschriftung"/>
   <s:Button id="accessBtn" left="10" top="30" label="Run as Admin" click="AccessClick(event)"/>
</s:WindowedApplication>





/*
” ADD”+ regKeyDir + ” /v “+”\”" + appDir + “\”" + ” /t REG_SZ /d RUNASADMIN”;
*/