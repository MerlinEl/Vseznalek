   http://help.adobe.com/en_US/flash/cs/extend/WS5b3ccc516d4fbf351e63e3d118a9024f3f-7feaCS5.html xmlui summary    xmlui.accept()    xmlui.cancel()    xmlui.get()    xmlui.getControlItemElement()    xmlui.getEnabled()    xmlui.getVisible()    xmlui.set()    xmlui.setControlItemElement()    xmlui.setControlItemElements()    xmlui.setEnabled()    xmlui.setVisible()xmlui.accept()xmlui.cancel()xmlui.get(controlPropertyName)Returns: retrieves the value of the specified property of the current XMLUI dialog box.xmlui.getControlItemElement(controlPropertyName)Returns: An object that represents the current control item for the control specified by controlPropertyName.xmlui.getEnabled(controlID)Returns: A Boolean value of true if the control is enabled; false otherwise.xmlui.getVisible(controlID)Returns: A Boolean value of true if the control is visible; false otherwise.xmlui.set(controlPropertyName, value)xmlui.setControlItemElement(controlPropertyName, controlID)xmlui.setControlItemElements(controlID, elementItem)xmlui.setEnabled(controlID, visible)xmlui.setVisible(controlID, visible)XUL Flash JSFL cheatsheet referenceXUL controlsXUL object	events	attributes<targetlist>		oncreate		id value width height flex pathtype<textbox>		oncreate onchange		id value label<popupslider>		oncreate		id value minvalue maxvalue width flex<checkbox>		oncreate		id value label checked<colorchip>		oncreate onchange		id value format(hex)<choosefile>		none?		id value pathtype required size type width flex<button>		oncreate oncommand		id value label flex, width<listbox>		oncreate onchange onsetfocus		id width flex rows height  <listitem>		 		label value selected<menulist>		oncreate onchange onsetfocus		editable width height flex  <menupop>		oncreate onchange onsetfocus		id    <menuitem>		 		label value selected<radiogroup>		oncreate		id value groupbox  <radio>		 		label value selected<flash>		oncreate		id value src width height<grid>		  	   <columns>		  	     <column>		  	   <rows>		  	     <row>		  	 <vbox>		 		pathtype<hbox>		 		pathtype<spacer>		 		 <label>		 		value<separator>		 		 <script>		JSFL xmlui referencexmlui.accept()xmlui.cancel()xmlui.get(controlPropertyName)Returns: retrieves the value of the specified property of the current XMLUI dialog box.xmlui.getControlItemElement(controlPropertyName)Returns: An object that represents the current control item for the control specified by controlPropertyName.xmlui.getEnabled(controlID)Returns: A Boolean value of true if the control is enabled; false otherwise.xmlui.getVisible(controlID)Returns: A Boolean value of true if the control is visible; false otherwise.xmlui.set(controlPropertyName, value)xmlui.setControlItemElement(controlPropertyName, controlID)xmlui.setControlItemElements(controlID, elementItem)xmlui.setEnabled(controlID, visible)xmlui.setVisible(controlID, visible)		//var doc = fl.getDocumentDOM();		//var box=doc.getElementById("result");		//x.value=x.value.toUpperCase();