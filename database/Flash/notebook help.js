	// Add an observer that listens to when angles change
	NB.addObserver("annotationRotatedEvent", function(evt) {
	// Make sure it is myself spinning
	if(NB.HOSTGUID != evt.eventData.guid) return;
	// Update the angle!
	console.log(Math.round(evt.eventData.angle))
	});
	
	
	console.log("widget droped")
	recognizeSelected = function(evt){
		//var ann = NB.page.getSelectedObject();
		//if(ann == null) return;
		console.log(evt);
	}
	NB.addObserver("annotationClickedEvent", recognizeSelected);
	
	
	
	createMarkerAt = function(rect){
	// Generate the object prototype
	var prototype = NB.objectPrototype.shape("hexagon"); //
	var size = 10;
	prototype.stroke.color = [255, 0, 0];
	prototype.stroke.thickness = 4;
	prototype.x = rect.pos.x+rect.width/2+app_offset.x-size/2;
	prototype.y = rect.pos.y-size/2+app_offset.y;
	prototype.height = size;
	prototype.width = size;
	//prototype.size = 2;
	console.log("creating prototype: ", prototype)
	// Add the object
	NB.addObject(prototype);
}


var objs = NB.page.getObjectsWithCustomProperty("myProperty");
var objs = NB.page.getObjectsWithCustomProperty("myProperty", true);
ann.setCustomProperty("marker", 0) 



var ann = NB.getObject(evt.eventData.guid); 
ann.deleteObject();

//delete objects with same param
var objs = NB.page.getObjectsWithCustomProperty("marker");
for( i in objs ) {
	objs[i].deleteObject();
}

//writing in DOMWindow
function createPolyLine(){
	this["RotationPoint"]="(159.000000,316.000000)";
	this["fade-enable"]="0";
	this["fade-time"]="6";
	this["fill"]= "none";
	this["marker-end"]= "url(#Diamond20)";
	this["marker-start"]= "url(#Diamond19)";
	this["points"]=""
	this["stroke"]="#000000";
	this["stroke-dasharray"]="18,6,6,6";
	this["stroke-width"]="6.00";
	this["transform"]="rotate(0.00,146.48,304.14)";
	this["visible"]="1";
	this["xml:id"]="annotation.QN9QBLCHH7LKFAQDT0A43R3LR";
	var str = "<polyline "//"/>"
	return this
}