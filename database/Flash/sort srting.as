 var words:Array = new  Array("coté", "côte");  var sorter:Collator = new Collator("fr-FR", CollatorMode.SORTING);  words.sort(sorter.compare);  trace(words);// côte,coté 			var sorter:Collator = new Collator("cs-CZ", CollatorMode.SORTING); 			text_ab.sort(sorter.compare);