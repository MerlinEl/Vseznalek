var doc = fl.getDocumentDOM();var results = fl.findObjectInDocByType("shape", doc);for (var i = 0; i < results.length; i++) {    if ( results[i].obj.isGroup )    {        doc.selection = [results[i].obj];        doc.unGroup();    }}// Look for shapestypeToSearchFor = "shape";results = fl.findObjectInDocByType(typeToSearchFor, doc);var textObjects;for(var i = 0; i < results.length; i++){    var members = results[i].obj.members;    for(var j = 0; j < members.length; j++)    {        if(members[j].elementType == "text" && members[j].textType == "dynamic")        {            doWhatever(members[j]);        }    }}function doWhatever(textObj){    fl.trace(textObj.getTextString());}