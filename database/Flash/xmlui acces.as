				'var nameArray = new Array("January", "February", "March");'  +				'var monthArray = new Array();' +				'for (i=0;i&#60;nameArray.length;i++){' + 					'elem = new Object();'+					'elem.label = nameArray[i];' +					'elem.value = i;' + 					'selected=(i==0);'+					'monthArray[i] = elem;'  +				'};'+				'fl.xmlui.setControlItemElements("list_menu", monthArray);'+var nameArray = new Array("Numeric", "Alpha", "AlphaNumeric", "Latin", "NonLatin", "NoRestriction");fl.xmlui.setControlItemElements("container",nameArray);xmlPanelOutput.parameters["container"].value = "145"		dialogXML += '<script>';			dialogXML += 'function addXMLItem(){'+								//'var co = fl.xmlui.getControlItemElement("container");'+				'var co = fl.xmlui.get("list_menu");'+				'fl.trace("obj:"+fl.actionsPanel.getClassForObject(co));'+				'var sel_name = fl.xmlui.get("container");'+				'if (sel_name.length == 0) return;'+				'var cfg_file = fl.configURI+"Commands/config.xml";'+				'if (!FLfile.exists(cfg_file)) return;'+				'var xml = new XML ( FLfile.read( cfg_file ) );'+				'var new_item = new XML (&#60;item name="" x="" y="" w="" h="" /&#62;);'+				'new_item.@x = fl.xmlui.get("edt_x");'+				'new_item.@y = fl.xmlui.get("edt_y");'+				'new_item.@w = fl.xmlui.get("edt_w");'+				'new_item.@h = fl.xmlui.get("edt_h");'+				'new_item.@name = sel_name;'+				'xml.Text_Format.appendChild(new_item);'+				'fl.xmlui.set("container", xml);'+			'};';			dialogXML += 'function saveXMLItem(){'+							'var cfg_file = fl.configURI+"Commands/config.xml";'+					'if (!FLfile.exists(cfg_file)) return;'+					'var xml = fl.xmlui.get("container", xml);'+					'FLfile.write(cfg_file , xml);'+					'fl.trace("saved XML:"+xml);'+					'fl.xmlui.set("container", "");'+			'};';			dialogXML += 'function loadXMLData(){'+								'var string_values = fl.xmlui.get("list_menu");'+					'var values = string_values.split(",");'+					'var elem = new Object();'+  					'elem = fl.xmlui.getControlItemElement("list_menu");'+ 					'var sel_name = elem.label;'+					'fl.trace("label = " + sel_name + " tag = " + values);'+ //tag=sfdfd					'fl.xmlui.set("edt_x", values[0]);'+					'fl.xmlui.set("edt_y", values[1]);'+					'fl.xmlui.set("edt_w", values[2]);'+					'fl.xmlui.set("edt_h", values[3]);'+				'};';		dialogXML += '</script>';			dialogXML += '</dialog>';