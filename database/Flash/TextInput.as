var listenerObject:Object = new Object();listenerObject.enter = function(eventObject:Object) {    //...};textInputInstance.addEventListener("enter", listenerObject);on (enter){    trace(this);}/** Requires:- TextInput instance on Stage (instance name: my_ti)*/var my_ti:mx.controls.TextInput;// Create listener object.var tiListener:Object = new Object();tiListener.handleEvent = function (evt_obj:Object){ if (evt_obj.type == "enter"){if (my_ti.length < 8) { trace("You must enter at least 8 characters");} else { trace("Thanks");} }}// Add listener.my_ti.addEventListener("enter", tiListener);var textInput0:TextInput = new TextInput;textInput0.textEditorProperties.returnKeyLabel = ReturnKeyLabel.GOtextInput0.addEventListener(FeathersEventType.ENTER,onEnter)var textInput1:TextInput = new TextInput;private function onEnter(e:FeathersEventType):void{setTimeout(textInput1.setFocus,200);}