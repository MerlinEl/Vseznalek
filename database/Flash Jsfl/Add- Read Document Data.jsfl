//JSFL	ot.getDocumentData = function(doc, data_name){				if (!doc) doc = fl.getDocumentDOM();		if (!doc) return "";		return doc.getDataFromDocument(data_name);	}	ot.delDocumentData = function(doc, data_name){				if (!doc) doc = fl.getDocumentDOM();		if (!doc) return;		doc.removeDataFromDocument(data_name);	}	ot.addDocumentData = function(doc, data_name, data_value){				if (!doc) doc = fl.getDocumentDOM();		if (!doc) return;		ot.log("doc:{0} data_name:{1} data_value:{2}", doc.name, data_name, data_value);		doc.addDataToDocument(data_name, "string", data_value);	}// AS3static public function saveDocumentData(data_name:String, data_str:String):void {		data_str = data_str.replace(/"/g, "'");  // replace double quotes with single	var doc_data:String = MMExecute('OrienTools.addDocumentData("", "'+data_name+'", "'+data_str+'")');}static public function delDocumentData(data_name:String):void {		MMExecute('OrienTools.delDocumentData("", "'+data_name+'")');}static public function readDocumentData(data_name:String):void {		var doc_data:String = MMExecute('OrienTools.getDocumentData("", "'+data_name+'")');	log("readDocumentData > data_name:{0} doc_data:{1}", data_name, doc_data);}