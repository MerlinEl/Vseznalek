//Flash Pro CCvar lib = fl.getDocumentDOM().library;while(lib.unusedItems.length > 0){    fl.trace("Deleting... " + lib.unusedItems.length + " items");    var unusedArr = lib.unusedItems;    for(var i=0;i<unusedArr.length;i++)     {        var unused = unusedArr[i];        fl.trace("  deleting " + unused.name);        lib.deleteItem(unused.name);    }   }//ORvar unusedArr = fl.getDocumentDOM().library.unusedItems;for(var i=0;i<unusedArr.length;i++)     fl.getDocumentDOM().library.selectItem(unusedArr[i].name,false,true);fl.trace(unusedArr.length+' Items selected');