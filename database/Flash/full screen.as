import flash.display.Stage; 
import flash.display.StageAlign; 
import flash.display.StageScaleMode; 
import flash.events.Event;


	import flash.events.FullScreenEvent;
	import flash.display.StageDisplayState;
	stage.displayState = StageDisplayState.FULL_SCREEN; 

private function toggleFullScreen():void {
	stage.displayState = ( stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE ) ?
												 StageDisplayState.NORMAL :
												 StageDisplayState.FULL_SCREEN_INTERACTIVE;
}


public function Main():void {
            NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, onInvoke);
            ...
}
private  function onInvoke(event:InvokeEvent):void {
            toggleFullScreen();
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            ...
}
private  function toggleFullScreen():void {
            stage.displayState = ( stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE ) ?
                                                 StageDisplayState.NORMAL :
                                                 StageDisplayState.FULL_SCREEN_INTERACTIVE;
}