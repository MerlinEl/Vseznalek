//changes object type to Button, Graphic or MovieClipdoc.library.setItemProperty("symbolType", "movie clip"); //graphic, button movie clip	var linkageBaseClass = lib.getItemProperty("linkageBaseClass");	var linkageExportForAS = lib.getItemProperty("linkageExportForAS");	var linkageIdentifier = lib.getItemProperty("linkageIdentifier");	var linkageClassName = lib.getItemProperty("linkageClassName");	fl.trace("linkageBaseClass:"+linkageBaseClass);	fl.trace("linkageExportForAS:"+linkageExportForAS);	fl.trace("linkageIdentifier:"+linkageIdentifier);	fl.trace("linkageClassName:"+linkageClassName);function addLinkageName(){	var lib = fl.getDocumentDOM().library;	var itemList = lib.items;	var len = itemList.length;	for(var i = 0; i < len; i++)	{		var item = itemList[i];		lib.selectItem(item.name);		var imageQuality = qualityMap[moduleName + "/" + item.name];		imageQuality = parseInt(imageQuality);		if(imageQuality == 100)		{			lib.setItemProperty('compressionType', 'lossless');		}		else		{			lib.setItemProperty('compressionType', 'photo');			lib.setItemProperty('useImportedJPEGQuality', false);			lib.setItemProperty('quality', imageQuality);		}		lib.setItemProperty('linkageExportForAS', true);		lib.setItemProperty('linkageExportForRS', false);		lib.setItemProperty('linkageExportInFirstFrame', true);		var linkName = item.name.replace(/\.png|\.jpg/g, "");		lib.setItemProperty('linkageClassName', moduleName + "." + linkName);	}}	lib.setItemProperty("sourceFilePath", "file:///C:/buttons.swf");	lib.updateItem();	//fl.getDocumentDOM().library.items[0].linkageURL = "theShareSWF.png";	//fl.trace(lib.items[0].getData("linkageURL"));	//fl.trace(lib.items[0].linkageIdentifier );	//lib.items[0].linkageURL = ".b/ano.png"	//lib.items[0].linkageURL = "file:///C:/buttons.swf"		//fl.getDocumentDOM().library.items[0].linkageURL = "Skin.swf";	//fl.trace(doc.library.items[0].sourceFilePath);	//lib.items[0].linkageURL = "file:///C:/buttons.swf";	//var path = "e:/Work/Nová Škola/@NS INTERACTIVE/Prirodopis 4 - CML/backup/veverka/render/nene/nene0000.png"	//lib.items[0].linkageURL = FLfile.platformPathToURI(path);	//fl.trace(doc.library.items[0].sourceFilePath);		//doc.library.selectItem("nene_0000.png"); 	/*fl.trace("path before:"+lib.getItemProperty("sourceFilePath"));	var new_path_uri = FLfile.platformPathToURI(new_dir+"nene_0002.png");	fl.trace("New path:"+new_path_uri);	//lib.setItemProperty('sourceFilePath', new_path_uri);	lib.setItemProperty('sourceFilePath', "file:///C:/Documents and Settings/nene_0002.png");	fl.trace("path after:"+lib.getItemProperty("sourceFilePath"))*/				for (var i = 0; i<lib_items.length; ++i)     {        item = lib_items[i];        if(item.itemType != "bitmap") continue//only images will be processed		var path = item.sourceFilePath;		var fname = path.split("/").pop();		var new_path_uri = FLfile.platformPathToURI(new_dir+fname)		fl.trace("New path:"+new_path_uri);		lib.selectItem(item.name);		fl.trace("Before:"+item.sourceFilePath)		lib.setItemProperty('sourceFilePath', new_path_uri);		lib.updateItem();		fl.trace("After:"+item.sourceFilePath)	}