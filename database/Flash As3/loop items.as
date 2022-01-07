//Remove Space Symbols

fl.outputPanel.clear(); //clear console

function deleteSpaceSymbols(doc){
	var tl = doc.getTimeline();
	var num = tl.currentLayer;
	var layer = tl.layers[num];
	var frames=layer.frames;
	var cnt = 0;
	for(var k = 0 ; k < frames.length ; k++){
		var frame = frames[k];
		doc.selectNone();
		fl.trace("fr:"+(k+1))
		var elements=frame.elements;
		for(var l = 0 ; l < elements.length ; l++){
			var element = elements[l];
			//get content of element [object SymbolItem]
			if (element.elementType == "instance"){
				var item = element.libraryItem;
				//fl.trace("el lib item:"+item)
				if (item.itemType == "movie clip"){
					var tl_in = item.timeline
					var layer_in = tl_in.layers[0];
					var frame_in =layer_in.frames[0];
					var elements_in = frame_in.elements;
					for(var m = 0 ; m < elements_in.length ; m++){
						var element_in = elements_in[m];
						//fl.trace("is mc: "+element_in)
						if(element_in.elementType == "text" && element_in.textType == "static"){
							//fl.trace("tx:"+element_in.elementType)
							var txt = element_in.getTextString() //if space symbol found
							if (txt.indexOf("	") != -1){
								element_in.setTextString(txt); //rewrite text without changes is enough :-)
								cnt++
							}
						}
					}
				}
			}
		}
	}
	fl.trace("Items with symbol space removed:"+cnt)
};

function findSpace(txt){
	for each (var c in txt){
		if (encodeURI(c)=="%09") return true;
	}
	return false
};

//if (doc.selection.length != 0) doc.deleteSelection();	
deleteSpaceSymbols(fl.getDocumentDOM());


/*
classText.replace(searchReg, userReplaceText);
deleteThese = new Array();
scope.getTimeline().getChildren()
*/


//Remove Blank Text Fields


fl.outputPanel.clear();
var doc = fl.getDocumentDOM();
scanLibrary(doc.library);

function scanLibrary(library){

    // loop variables:
    var item, timeline, layerCnt, frameCnt, elems, elemCnt, matX, tx, matY, ty;
    
    var items = library.items;
    var replaceCount = 0;
    
    // for each item in the library:
    for( var i = 0; i < items.length; i++ ){
        item = items[i];
		fl.trace("library item:"+ item)
        // dig into any MCs:
        if (item.itemType == "movie clip" || item.itemType == "graphic" ){
            // store current timeline:
            timeline = item.timeline;
            
            // store total number of layers:
            layerCnt = timeline.layerCount;
            
            // set up editing mode:
            library.selectItem(item);
            library.editItem();
            
            // cycle through all layers within this timeline:
            while(layerCnt--){
                // store total frames
                frameCnt = timeline.layers[layerCnt].frameCount;
                
                // cycle through all frames within this layer:
                while(frameCnt--){
                    // store elements array:
                    elems = timeline.layers[layerCnt].frames[frameCnt].elements;
                    
                    // store total number of elements in this frame:
                    elemCnt = elems.length;
                    
                    // cycle through all elements within this frame:
                    while(elemCnt--){
                        // process any text type element:
                       var el = elems[elemCnt];
					   if( el.elementType == "text" && el.textType == "static"){
							var txt = el.getTextString() //if space symbol found
							//fix empty textfield or textfield with one white space
							if (txt.length == 0 || txt == " "){
								fl.trace("txt:"+txt);
								el.setTextString("konipas obecny potvora usata"); //rewrite text without changes is enough :-)
								//library.deleteItem(el.name);
								el.selected = true;
								
								replaceCount++;
							//fix symbol space
							} else if (txt.indexOf("	") != -1){
								el.setTextString(txt); //rewrite text without changes is enough :-)
								replaceCount++;
							}
                        }
						library.selectItem(item);
						if (doc.selection.length != 0) doc.deleteSelection();
                    }//elemCnt
                }
            }
        }
    }
	fl.trace("fixed blank text fields:"+replaceCount);
}

/*
function updateStageEmbedAllFonts(dom)
{
    var theLayers = dom.getTimeline().layers;
    for (var i = 0; i < theLayers.length; i++)
    {
        var theElems = theLayers[i].frames[0].elements;
        for (var c = 0; c < theElems.length; c++)
        {
            if (theElems[c].elementType == "text") 
            {
                theElems[c].embedRanges = "9999";//all
            }
        }
    }
}
updateStageEmbedAllFonts((fl.getDocumentDOM()))
*/