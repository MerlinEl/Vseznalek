var destFolder = Folder.selectDialog ("Please choose a location where the new image files will be saved.", sourceFolder);var files = sourceFolder.getFiles("*.tif"); var f = files[i];if (f instanceof Folder) continue; // Consider only some images filetypes.// var files = sourceFolder.getFiles(/.+\.(?:jpe?g|bmp|png)$/i);	var files = sourceFolder.getFiles("*.tif"); for (var i = 0; i < files.length; i++){		var f = files[i];	if (f instanceof Folder) continue;	var docRef = app.open (f);	var layerRef = docRef.activeLayer;