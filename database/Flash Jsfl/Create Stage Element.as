if (confirm("Warning: You have selected multiple items.\nDo you want to convert your selection to a new library item?"))		{			var newName;			if (doc.getTimeline().name == "Scene 1") newName = DEFAULT_CLASS_NAME;			else newName = doc.getTimeline().name + DEFAULT_CLASS_NAME;						convertToSymbol(newName);			selectedInstance.libraryItem.linkageExportForAS = true;			selectedInstance.libraryItem.linkageClassName = getClassPackageName(selectedInstance.libraryItem) + "." + newName;			selectedInstance.libraryItem.linkageBaseClass = "flash.display.MovieClip";						// when multiple items on current frame > distributeToLayers			/*if (selectedInstance.layer.frames[doc.getTimeline().currentFrame].elements.length > 1)			{				fl.getDocumentDOM().distributeToLayers();			}*/		}fl.getDocumentDOM().convertToSymbol("movie clip", newName, "top left");function setAsSprite(item)	{		item.linkageExportForAS = true;		item.name = item.name.split("/").pop().split("-").join("_").split(" ").join("_");		item.linkageClassName = item.name.split("/").pop();		item.linkageBaseClass = "flash.display.Sprite";		item.linkageExportInFirstFrame = true;	}