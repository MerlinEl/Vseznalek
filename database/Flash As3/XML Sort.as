<DATA>  <TITLES>    <item label="Český jazyk 2" title="CJA2"/>    <item label="Český jazyk 3" title="CJA3"/>    <item label="Český Jazyk 4" title="CJA4"/>    <item label="Český Jazyk 5" title="CJA5"/>    <item label="Český Jazyk 6" title="CJA6"/>    <item label="Český Jazyk 7" title="CJA7"/>    <item label="Český Jazyk 8" title="CJA8"/>  </TITLES></DATA>XMLData = mcTranXML.sortXML( XMLData, "item", "label");       static public function sortXML(source:XML, elementName:Object, fieldName:Object, options:Object = null):XML {			// list of elements we're going to sort			var list:XMLList = source.elements("*").(name() == elementName);						// list of elements not included in the sort -			// we place these back into the source node at the end			var excludeList:XMLList=source.elements("*").(name()!=elementName);			list= sortXMLList(list,fieldName, options);			list += excludeList;			source.setChildren(list);			return source;		}				static public function sortXMLList(list:XMLList, fieldName:Object, options:Object = null):XMLList {			var arr:Array = new Array();			var ch:XML;			for each(ch in list) arr.push(ch);			var resultArr:Array = fieldName==null ?			options==null ? arr.sort() :arr.sort(options)			: arr.sortOn(fieldName, options);			var result:XMLList = new XMLList();			for(var i:int=0; i<resultArr.length; i++) {				result += resultArr;			}			return result;		}