//Delete Layers
fl.outputPanel.clear(); //clear console

var doc = fl.getDocumentDOM();
var tl = doc.getTimeline();
var all_layers = tl.layers;
var sel_layers = tl.getSelectedLayers();

if (doc != null && sel_layers.length > 0) deleteSelectedLayers();

function deleteSelectedLayers(){

	for each(n in sel_layers)tl.deleteLayer(n);
};



layer.locked = !layer.locked;

local_tl.setLayerProperty("visible", true);
local_tl.setLayerProperty("layerType", "normal");
local_tl.setLayerProperty("locked", false);

doc.selectAll();
doc.clipCopy();
doc.selectNone();
doc.clipPaste(true);


fl.getDocumentDOM().getTimeline().addNewLayer(arguments[0], "guide", false);
fl.getDocumentDOM().getTimeline().currentLayer = 0;
fl.getDocumentDOM().selection = sel;
fl.getDocumentDOM().breakApart();
fl.getDocumentDOM().getTimeline().setSelectedLayers(cur_tl.currentLayer, true);
 //delete the layer
 tl.setSelectedLayers(tl.currentLayer, true);
 tl.deleteLayer(tl.currentLayer);



	
	// Create the new layer and set its name.
	layerIndex = tml.addNewLayer();
	var layer = tml.layers[layerIndex];
	layer.name = name;
	
	// Cut the selection, select the layer, paste-in-place, and try to unselect the item (maybe the layer is still selected?)
	doc.clipCut();
	tml.setSelectedLayers(layerIndex, true);
	doc.clipPaste(true);
	// This doesn't seem to have much effect, but let's do it anyway.  The more reliable thing is the selectNone() at the
	// top of the loop.
	item.selected = false;