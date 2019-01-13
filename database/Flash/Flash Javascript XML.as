	<dialog id="skewlist-dialog" title="Skew Selection" buttons="accept,cancel">
	<grid>
		<columns>
			<column/>
			<column/>
		</columns>
		<rows>
			<row align="left">
				<label value="Skew x: " control="xSkew" align="left"/>
				<popupslider id="xSkew" minvalue="-180" maxvalue="180"/>
			</row>
			<row align="left">
				<label value="Skew y:" control="ySkew" align="left"/>
				<popupslider id="ySkew" minvalue="-180" maxvalue="180"/>
			</row>
			<row align="left">
				<label value="Edge:" control="edge" align="left"/>
				<listbox id="edge" rows="5" oncreate = 'init2()'>
					<listitem label="top center"/>
					<listitem label="right center"/>
					<listitem label="bottom center"/>
					<listitem label="left center"/>
				</listbox>
			</row>
		</rows>
	</grid>
	<button id="worldBtn" label="world" oncreate = 'init()' oncommand = 'init3()'/>
	<textbox id="tb" >
	<script>
	function init(){
		fl.xmlui.set("tb", "Development");
	}
	function init2(){
		var elem = new Object();
		elem = fl.xmlui.getControlItemElement("edge"); //get selected item in listbox
		fl.trace("label = " + elem.label + " value = " + elem.value);
		var itemArray = fl.xmlui.getControlItemElement("edge").length;
		
		
		//fl.trace("items = " +fl.getDocumentDOM().edge.items);
		//elem.addItem(0, "novy");
		
		
		//fl.trace("listbox created: "+fl.xmlui.get("edge", 2));
		//fl.trace("lbx: "+fl.xmlui.edge);
		//edge.items.add("edge", "Dev");
	}
	function init3(){
		var itemArray = fl.xmlui.getControlItemElement("edge");
		for (var prop in itemArray) {
			fl.trace("property " + prop + " = " + itemArray[prop]);
		}
		//itemArray.label = "novy";
		//fl.xmlui.setControlItemElements("edge", itemArray);
		
		var nameArray = new Array("January", "February", "March", "oko", "ruka", "hlava", "noha");
		var monthArray = new Array();
		for (var i in nameArray) {
			var elem = new Object();
			elem.label = nameArray[i];
			elem.value = i;
			monthArray[i] = elem;
		}

		fl.xmlui.setControlItemElements("edge", monthArray);
		
		//fl.trace("label 01 is? "+itemArray.label);
		
		fl.xmlui.set("tb", "Development1458");
		fl.trace("pressed button:"+ fl.xmlui.getControlItemElement("worldBtn"))
	}
	</script>
</dialog>
	
	=============================================================================
	
	
	
	var myXML = <root>
		<child name="firstClip" />
		<child name="secondClip" />
		<child name="thirdClip" />
	</root>
	fl.trace("nodes num: " + myXML.child.length());
	fl.trace("node 2 name: " + myXML.child[1].@name);
	fl.trace("how many nodes named thirdClip? " + myXML.child.(@name == "thirdClip").length());
	
	
	
	var myXMLUIObject = fl.getDocumentDOM().xmlPanel(fl.configURI + "/Commands/myXMLUI.xml");
	if (myXMLUIObject.dismiss == "accept") {
		fl.trace("The edge="+  myXMLUIObject.edge.rows);
		fl.trace("The search="+  myXMLUIObject.edt_search);
	}


<dialog id="skewlist-dialog" title="Skew Selection" buttons="accept,cancel">
	<grid>
		<columns>
			<column/>
			<column/>
		</columns>
		<rows>
			<row align="left">
				<label value="Skew x: " control="xSkew" align="left"/>
				<popupslider id="xSkew" minvalue="-180" maxvalue="180"/>
			</row>
			<row align="left">
				<label value="Skew y:" control="ySkew" align="left"/>
				<popupslider id="ySkew" minvalue="-180" maxvalue="180"/>
			</row>
			<row align="left">
				<label value="Edge:" control="edge" align="left"/>
				<listbox id="edge" rows="5">
					<listitem label="top center"/>
					<listitem label="right center"/>
					<listitem label="bottom center"/>
					<listitem label="left center"/>
				</listbox>
			</row>
		</rows>
	</grid>
</dialog>


==============================================================================

<?xml version="1.0"?>
<dialog id="cmd_dlg"  title="Commands Editor"  buttons="cancel" >
	<hbox>
		<label value="Search..." />
		<textbox id="edt_search" value="some text" size="40" />
	</hbox>

	<label value="Command List:" />
	<listbox tabindex="0" id="lbx" rows="4">
		<listitem id="itm_01" value="0" label="a" />
		<listitem value="1" label="b" />
	</listbox>

	<hbox>
		<button id="btn_edit"  oncommand="fl.xmlui.accept()"  label="Edit" />
	</hbox>
</dialog>




======================================================================================
fl.getDocumentDOM().xmlPanel(fl.configURI + 'Commands/ATest.xml');
fl.trace(fl.xmlui.get('secretword'));//this traces undefined

<dialog buttons="accept,cancel">
  <textbox id="display_tb" size="24" />
  <flash id="trace_fl" width ="150" height="100" src="ATest.swf">
    <property id="secretword" />
  </flash>
  <button id="trace_btn" label="trace Flash" oncommand="fl.xmlui.set('display_tb','the secret word is ' + fl.xmlui.get('secretword'));" />
</dialog>

MMExecute("fl.trace('Hello From Flash XMLUI');");
XMLUI.setProperty('secretword','duck');

=====================================================================================

// Check to see if there is a file open first.
fl.outputPanel.clear(); //clear console
var dom = fl.getDocumentDOM();
if (dom == null)
{
    alert("Please open a file.");
}
else
{
   var fileLocation =  fl.configURI + "Commands/Commands Editor.jsfl";
   //app.openDocument(fileLocation)
  // app.openScript(fileLocation)
// the xmlPanel method opens the dialog
function edit(){
	fl.trace("fn edit")
}	
	
	var xml_path = fl.configURI + "/Commands/myXMLUI.xml"
	var xml = FLfile.read(xml_path)
	fl.trace(xml["edge"]); //.@value

	
	
	var myXMLUIObject = fl.getDocumentDOM().xmlPanel(fl.configURI + "/Commands/myXMLUI.xml");
	//var fileList = FLfile.listFolder(folderURI, "files”) // files
	fl.trace("begin")
	for (var prop in myXMLUIObject) {
	fl.trace("property " + prop + " = " + myXMLUIObject[prop]);
	}
	fl.trace("items = " +myXMLUIObject["edge"]);//get selected item in listbox
	
	
	myXMLUIObject.oncreate = function() {
		fl.trace("interface created")
		//XMLUI.setProperty('secretword','duck');
	}

	if (myXMLUIObject.dismiss == "accept") {
		fl.trace("The edge="+  myXMLUIObject.edge.rows);
		fl.trace("The search="+  myXMLUIObject.edt_search);
		
		fl.trace("The tabs="+myXMLUIObject["edge"] );
		//fl.trace("The edge="+  String.fromCharCode(myXMLUIObject["edge"].charCodeAt(0)));
		//fl.xmlui.setVisible("edge", true);
		//fl.trace("The vis="+fl.xmlui.getVisible("edge"));
		
		
		/*
		var elem = new Object();
		elem = fl.xmlui.getControlItemElement("edge");
		fl.trace("element = "+ elem+" length = "+ elem.rows+" label = " + elem.label + " value = " + elem.value);
		
		var nameArray = new Array("January", "February", "March");
		var monthArray = new Array();
		for (i=0;i<nameArray.length;i++){
		elem = new Object();
		elem.label = nameArray[i];
		elem.value = i;
		monthArray[i] = elem;
		}
		fl.xmlui.setControlItemElements("myControlID", monthArray); */
	}


	/*
	XMLUI.set("author", list.value);
	
	var elem = new Object();
elem.label = "Fax";
elem.value = "707-555-5555";
fl.xmlui.setControlItemElement("PhoneNumber",elem); 
	
	
	
	if (myXMLUIObject.dismiss == "accept") {
	   fl.trace("The textbox=" + myXMLUIObject.myXMLUIProperty);
	   fl.trace("The slider=" + myXMLUIObject.slider1);
	  
	}*/

}


/*
var values = new Array();
values.push("Animal Shelters and Rescues");
values.push("Birds");
values.push("Cats");
values.push("Dogs");
values.push("Other Pets");
values.push("Rabbits");
myXMLUIObject.setAcceptableValues(values);
*/	
	/*
	var elem = new Object();
	elem = fl.xmlui.getControlItemElement("myListBox");
	var isEnabled = fl.xmlui.getEnabled("myListBox");
	fl.trace("is enabled? "+ isEnabled);
	fl.trace("label = " + elem.label + " value = " + elem.value);
	*/
	
	/*
	var nameArray = new Array("January", "February", "March");
	var monthArray = new Array();
	for (i=0;i<nameArray.length;i++){
	elem = new Object();
	elem.label = nameArray[i];
	elem.value = i;
	monthArray[i] = elem;
	}
	fl.xmlui.setControlItemElements("myControlID", monthArray); 
	fl.xmlui.setEnabled("myControl", true); 
	*/
	
	/*
	for (idx in fl.getDocumentDOM().library.items) {
		if (fl.getDocumentDOM().library.items[idx].itemType == "video") {
		var myItem = fl.getDocumentDOM().library.items[idx];
		fl.trace(myItem.name + " source is " + myItem.sourceFilePath);
		}
	}
	*/

/*

import flash.filesystem.File;

var prefsFile:File = File.applicationStorageDirectory;
prefsFile = prefsFile.resolvePath("preferences.xml");


var desktop:File = File.desktopDirectory;
var files:Array = desktop.getDirectoryListing();
for (var i:uint = 0; i < files.length; i++) {
    trace(files[i].nativePath);
}


var user_path = File.userDirectory.nativePath
var cmd_path = user_path + "/AppData/Local/Adobe/Flash CS5.5/en_US/Configuration/Commands/";
var f = "C:\Users\Orien\AppData\Local\Adobe\Flash CS5.5\en_US\Configuration\Commands\fit_epage.jsfl"
trace(cmd_path)
var desktop:File = new File (cmd_path);
var files:Array = desktop.getDirectoryListing();
for (var i:uint = 0; i < files.length; i++) {
    trace(files[i].nativePath);
}
//app.openDocument(files[0])
var myTextLoader:URLLoader = new URLLoader();
myTextLoader.addEventListener(Event.COMPLETE, onLoaded);
function onLoaded(e:Event):void {
trace(e.target.data);
}
myTextLoader.load(new URLRequest("C:/Temp/a.txt"));

*/