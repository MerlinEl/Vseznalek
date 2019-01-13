/**
 * Copy the selected items to create a grid.
 *
 * @author Andrew Guldman, Fluid Inc
 */


/**
 * Configure the effect. Create any necessary shared functions.
 */
function configureEffect()
{
	// Load shared functions
	// The runScript path is relative to the Commands directory.
	// shared.jsfl is in the Effects directory
	//fl.trace("shared.jsfl path="+ fl.configURI + "Effects/shared.jsfl");
//	fl.runScript(fl.configURI + "Effects/shared.jsfl");
//	fl.trace("configureEffect(copytogrid)");
}



/**
 * Remove the effect.
 */
function removeEffect()
{
	reverse();
}

/**
 * Perform the effect.
 */
function executeEffect()
{
	var ef = fl.activeEffect;
	forward( false, ef.rows, ef.columns, ef.horizontalGap, ef.verticalGap );
}


/**
 *
			<property id="rows" />
			<property id="columns" />
			<property id="horizontalGap" />
			<property id="verticalGap" />
 */
function forward( preview, rows, columns, horizontalGap, verticalGap )
{
	try
	{
		doAlert( "forward" );

		// initialize
		fl.enableImmediateUpdates( true );
		fl.runScript(fl.configURI + "Effects/shared.jsfl");

		// initialize
		fl.enableImmediateUpdates( true );
		fl.runScript(fl.configURI + "Effects/shared.jsfl");
		// Shorthand variables
		var dom = fl.getDocumentDOM();
		
		// edit the symbol
		dom.enterEditMode("inPlace");
		
		// convert the shape into specified type
		var libName = Object.fxutil.generateLibName();
		doAlert( "creating lib item: " + libName);
		var mySymbolName = dom.convertToSymbol("graphic", libName, "top left"); 
		
		// Move the symbol to the Effects folder
		Object.fxutil.moveToEffectsFolder(mySymbolName.name);
		
		// Copy the selected symbol instance immediately, before monkeying with
		// layers, etc.
		dom.clipCopy();
		
		// Measure the selected instance
		var element = dom.selection[0];
		var width = element.width;
		var height = element.height;
		
		// Now select none to facilitate layer manipulation.
		// This is important -- the new layer can't be selected if there is
		// an active selection in the old layer. Bug?
		dom.selectNone();
		
		// Put the copies on a new layer. This will make it easier
		// to remove the effect later if necessary.
		var tl = dom.getTimeline();
		var mainLayerName = tl.getLayerProperty("name")
		var layerIx = tl.addNewLayer(mainLayerName + " Copies", "normal", false);
		var newLayer = tl.layers[layerIx];
		newLayer.effectLayer = true;
		tl.setSelectedLayers(layerIx, true);
		tl.currentLayer = layerIx;
		
		var firstCopy = true;
		for (var rowIx = 0; rowIx < rows; rowIx++)
		{
			for (var colIx = 0; colIx < columns; colIx++)
			{
				if ( (rowIx == 0) && (colIx == 0) )
				{
					// This is the original object. Don't copy or paste it.
					// Don't do anything. Go immediately to the next item.
					continue;
				}
	//			else if ( (rowIx > 0) || (colIx > 1) )
				else if (!firstCopy)
				{
					// This is not the first copy
					// Copy the most recent duplicate
	//				Object.fxutil.myTrace(1, "b4 clipCopy: sel.len=" + dom.selection.length);
					dom.clipCopy();
	//				Object.fxutil.myTrace(1, "after clipCopy");
				}
				// Paste in place
				dom.clipPaste(true);
				firstCopy = false;
				if ( (colIx == 0) && (rowIx > 0) )
				{
					// Create a new row
					dom.moveSelectionBy({x: (-columns + 1) * (horizontalGap + width), y:verticalGap + height});
				}
				else
				{
					// Put it in the same row
					dom.moveSelectionBy({x:horizontalGap + width, y:0});
				}
			}
		}
		dom.exitEditMode();

		if (preview)
		{
			// Export the preview swf
			Object.fxutil.exportPreviewSWF( dom.selection[0] );
		}
		
		Object.fxutil.myTrace(1, "CopyToGrid: forward: done");
	}
	catch (e)
	{
		fl.trace("Exception in forward: " + e);
	}
}


function reverse()
{
	try
	{
		doAlert( "reverse" );

		fl.runScript(fl.configURI + "Effects/shared.jsfl");
		Object.fxutil.myTrace(1, "CopyToGrid: reverse: start");
		
		// Shorthand variables
		var dom = fl.getDocumentDOM();
		dom.enterEditMode("inPlace");
		
		// Delete layer 2. It contains the copy.
		var tl = dom.getTimeline();
		tl.deleteLayer(1);
		
		// Break apart the symbol instance on layer 1
		tl.currentLayer = 0;
		tl.currentFrame = 1;
		dom.selectAll();
		
		// Get the name of the library symbol so we can delete it after 
		// we break it apart
		var libItem = dom.selection[0].libraryItem;
		dom.breakApart();
		
		// delete the library item
		var libName = libItem.name;
		doAlert( "removing library item: " + libName);
		dom.library.deleteItem( libName );
		
		// go back to the main timeline
		dom.exitEditMode();
		
		// delete the folder if it is empty
		if (Object.fxutil.folderIsEmpty())
		{
			doAlert( "deleting effects folder" );
			fl.getDocumentDOM().library.deleteItem( Object.fxutil.getEffectsFolderName() );
		}
		
		doAlert( "reverse finished" );
	}
	catch (e)
	{
		fl.trace("Exception in reverse: " + e);
	}
}


function doAlert( str )
{
	//alert( str );
}


