Some animation tools (some of them oldschool, but handy) :
http://www.dave-logan.com/weblog/?p=46
http://www.toonmonkey.com/extensions.html
http://www.animonger.com/freetools.html


fl.clipCopyString(string);Trust the documentation, not the IDE on 


You can use JSFL with actionscript 3.0 by writing a Flash Panel
(aka swfPanel, Window SWF)
In actionscript all you need to do is call:
MMExecute("your javascript here");
e.g.
MMExecute("alert('Hello from AS3!')");
The function returns a String which is the result of the JSFL
operation(s), handy for debugging.
A very good video tutorial on : http://www.gotoandlearn.com/play?id=66

// first, ask for the actionscript file.
var schemaURI = fl.browseForFileURL("open", "Please select your actionscript file", false);
if (schemaURI == null) {
return;
}

//get users temp folder& convert to URI
var win_tempLamePath =FLfile.getSystemTempFolder()+'lame.bat';
var win_tempLameURI =FLfile.platformPathToURI(win_tempLamePath);

FLfile.createFolder(folder+'/Exported SWFS');
fl.openDocument(folder+'/'+flaName);


    //create a temporary textfile that contains the required variables
    FLfile.write(fl.configURI+'/Commands/variables.txt','someVariables=someValue&amp;anotherVariable=anotherValue');
     
    //open the dialog box - remember the JSFL script is paused until this dialog box is closed
    var r = fl.getDocumentDOM().xmlPanel(fl.configURI + 'Commands/xmlPanel.xml');
     
    //now the dialog box has been closed and the variables are no longer needed, we should remove the temporary textfile we created previously
    FLfile.remove(fl.configURI+'/Commands/variables.txt');




settings=fl.getDocumentDOM().xmlPanel(fl.configURI + 'Commands/dialog.xml');
if(settings.dismiss == 'accept')
{
//run the JSFL script based upon the chosen settings
if(settings.checked == 'true')
 
{
//the user clicked on the checkbox and selected it
}
}
else
{
//settings.dismiss = 'cancel'
//they cancelled the dialog box
