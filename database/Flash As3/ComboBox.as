import fl.data.DataProvider;var dpDownMenu:ComboBox = new ComboBox();dpDownMenu.width = 100;dpDownMenu.height = 22;dpDownMenu.addItem({data:1,label:’TestItem01′});dpDownMenu.addItem({data:2,label:’TestItem02′});dpDownMenu.addItem({data:3,label:’TestItem03′});dpDownMenu.x = 2.5;dpDownMenu.y = 4.0;var cbx_tfo:TextFormat = new TextFormat();cbx_tfo.size = 12;cbx_tfo.font = "Arial";dpDownMenu.textField.setStyle("textFormat", cbx_tfo);dpDownMenu.dropdown.setRendererStyle("textFormat", cbx_tfo);dpDownMenu.dropdown.rowHeight = 22;dpDownMenu.dropdownWidth = 100;dpDownMenu.dataProvider = dropData;dpDownMenu.rowCount = uint(dropData.length);dpDownMenu.addEventListener(Event.CHANGE, setPath);addChild(dpDownMenu);		private function setPath(e:Event):void{					var dict_file = "resources/"+ComboBox(e.target).selectedItem.fname;			trace("dict_file:"+dict_file)		};