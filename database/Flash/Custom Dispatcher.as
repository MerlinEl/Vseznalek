import imost.mcCustomEvent;			editBox.getData(e.item["ID"], e.item["DefaultText"]);			editBox.addEventListener(mcCustomEvent.ON_ACCEPT, onAccept);			editBox.displayDialog(true);						function onAccept(ce:mcCustomEvent):void {								removeEventListener(mcCustomEvent.ON_ACCEPT, onAccept);								//replace text at current row				var new_text:String = ce.result as String;				e.item["DefaultText"] = new_text;				textBoxGrid.invalidateItem(e.item);								//replace text on xml_cz				ParseXML.replaceTextById(xml_cz, e.item["ID"], e.item["DefaultText"]);				ftrace("Mod cz XML:\n%", xml_cz);			}dispatchEvent(new mcCustomEvent(mcCustomEvent.ON_ACCEPT, textBox_cz.text));