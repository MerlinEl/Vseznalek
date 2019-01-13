
import flash.desktop.NativeProcess;

import mx.events.FlexEvent;

private var process:NativeProcess;

protected function windowedapplication1_applicationCompleteHandler(event:FlexEvent):void
{
	var cmd:File = new File("C:\\WINDOWS\\system32\\cmd.exe);
	var svn:File = new File(File.applicationDirectory.nativePath + File.separator + svn.bat);
	
	var args:Vector.<String> = new Vector.<String>();                    
	args.push("/c", svn.nativePath, "my_login", "my_pass", "svn_url", "E:workspace" + "\\" + "test_svn");

	/*args[0] = toto;
	args[0] = svn.nativePath;
	args[1] = my_login;
	args[2] = my_pass;
	args[3] = svn_url;
	args[4] = E:\\workspace\\test_svn; */                   
	
	var nativeProcessStartupInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();                    
	nativeProcessStartupInfo.executable = cmd;
	nativeProcessStartupInfo.arguments = args;
	
	process = new NativeProcess();
	process.addEventListener(NativeProcessExitEvent.EXIT, onExit);
	process.addEventListener(Event.STANDARD_ERROR_CLOSE, standardErrorClose);
	process.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, onErrorData);
	process.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR, onIOError);
	process.addEventListener(Event.STANDARD_INPUT_CLOSE, standardInputClose);
	process.addEventListener(IOErrorEvent.STANDARD_INPUT_IO_ERROR, onIOError);
	process.addEventListener(ProgressEvent.STANDARD_INPUT_PROGRESS, standardInputProgress);
	process.addEventListener(Event.STANDARD_OUTPUT_CLOSE, standardOutpoutClose);
	process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData);
	process.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR, onIOError);
	
	process.start(nativeProcessStartupInfo);
}

public function standardOutpoutClose(evt:Event):void
{
	trace(standardOutpoutClose);
}

public function standardInputProgress(evt:ProgressEvent):void
{
	trace(standardInputProgress);
}

public function standardInputClose(event:Event):void
{
	trace(standardInputClose);
}

public function standardErrorClose(event:Event):void
{
	trace(standardErrorClose);
}

public function onOutputData(event:ProgressEvent):void
{
	trace(Got: , process.standardOutput.readUTFBytes(process.standardOutput.bytesAvailable)); 
}

public function onErrorData(event:ProgressEvent):void
{
	trace(ERROR -, process.standardError.readUTFBytes(process.standardError.bytesAvailable)); 
}

public function onExit(event:NativeProcessExitEvent):void
{
	trace(Process exited with ", event.exitCode);
}

public function onIOError(event:IOErrorEvent):void
{
	trace(event.toString());
}
