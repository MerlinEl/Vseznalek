#target photoshop// Mini-Script to call one of two different actions depending on the aspect of the image.// This one requires editing by the end user.// (c) Mike Dickson www.photoshoptools.ca// Licensed under the GPLdocRef = activeDocument;rulerUnits = app.preferences.rulerUnits;app.preferences.rulerUnits = Units.PIXELS;// If this is a landscape picture...if ( docRef.height.value < docRef.width.value ) {    // EDIT HERE    app.doAction("YOUR LANDSCAPE ACTION NAME", "YOUR ACTION SET");} else {    // EDIT HERE    app.doAction("YOUR PORTRAIT ACTION NAME", "YOUR ACTION SET");}app.preferences.rulerUnits = rulerUnits;     function checkSpelling(myEvent){    alert('Check Spelling...');   app.menuActions.item("Check Spelling...").invoke();    }<html><head><script type="text/javascript">function onSmartGuidesClick() {    _AdobeInvokeScript('app.menuActions.itemByID(24349).invoke() ');}</script></head><body><center>    <input type="checkbox" id="smartGuides" checked="true" onClick="onSmartGuidesClick()"/>    <label for="smartGuides" style="font-family:sans-serif;font-size:9px;width:114;height:20">Smart Guides</label></center></body></html>