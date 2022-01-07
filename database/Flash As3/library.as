var items = fl.getDocumentDOM().selection;
for(var i=0;i<items.length;i++)
{
	// fl.trace(items[i].name);
	//fl.trace("TEST");
	//fl.trace(items[i].libraryItem.name.split("/").pop().toString())
	//items[i].name=items[i].libraryItem.name.split("/").pop().toString();
	items[i].name = "burt_"+i.toString();
}

function collapseFolderTree(){

	lib = fl.getDocumentDOM().library;
	fl.getDocumentDOM().library.selectItem("img");
	fl.trace("organize")
	fl.getDocumentDOM().library.expandFolder(false,true,"img");
	/*
	var sel_name = fl.getDocumentDOM().selection[0].libraryItem.name;
	var path_arr = sel_name.split("/");
	var elem_path = path_arr[0];
	for(var i=1;i<path_arr.length;i++) {
		fl.getDocumentDOM().library.expandFolder(true,false,elem_path);
		elem_path += "/"+path_arr[i];	
	}*/
	/*for each (var i in lib.items){
		
		if (lib.getItemType(i.name) == "folder") {
		fl.getDocumentDOM().library.expandFolder(true,false, i.name.split("/")[0]);
		}
	}*/
}