
++ /jsfl/Commands/FrameMoveUp.jsfl (リビジョン 1193)
//up
(function () {
  var timeline = fl.getDocumentDOM().getTimeline();
  var selectedFrames = timeline.getSelectedFrames();
  if ((selectedFrames[0] - 1) >= 0) {
    timeline.setSelectedFrames([selectedFrames[0] - 1, selectedFrames[1], selectedFrames[1] + 1]);
  }
})();
++ /jsfl/Commands/FrameMoveDown.jsfl (リビジョン 1193)
//down
(function () {
  var timeline = fl.getDocumentDOM().getTimeline();
  var selectedFrames = timeline.getSelectedFrames();
  if ((selectedFrames[0] + 1) < timeline.layers.length) {
    timeline.setSelectedFrames([selectedFrames[0] + 1, selectedFrames[1], selectedFrames[1] + 1]);
  }
})();
++ /jsfl/Commands/SetLibraryNameToInstanceName.jsfl (リビジョン 1193)
/**
 *  set library name to selected instance name
 *  @see http://bitmap.dyndns.org/blog/archives/001398.html
 */
var selectedItems = fl.getDocumentDOM().selection;
for (var i = 0; i < selectedItems.length; i++) {
    var element = selectedItems[i];
    var regex = /(.*\/)?(.*)$/;
    var result = regex.exec(element.libraryItem.name);
    element.name = result[2];
}
++ /jsfl/Commands/FrameMoveLeft.jsfl (リビジョン 1193)
//left
(function () {
  var timeline = fl.getDocumentDOM().getTimeline();
  var selectedFrames = timeline.getSelectedFrames();
  if (selectedFrames[1] - 1 >= 0) {
    timeline.setSelectedFrames([selectedFrames[0], selectedFrames[1] - 1, selectedFrames[1]]);
  }
})();
++ /jsfl/Commands/PublishFLAFiles.jsfl (リビジョン 1193)
/**
 *  publish all .fla files
 *  @see http://bitmap.dyndns.org/blog/archives/001198.html
 */
var dir = fl.browseForFolderURL("select target folder");

var fileList = FLfile.listFolder(dir + "/*.fla", "files");

for (var i = 0; i < fileList.length; i++) {
  var file = dir + "/" + fileList[i];
  var doc = fl.openDocument(file);
  doc.publish();
  doc.close();
}
++ /jsfl/Commands/AddLayerAndWriteStopScript.jsfl (リビジョン 1193)
/**
 *  add new layer and write "this.stop();"
 *  @see http://bitmap.dyndns.org/blog/archives/001389.html
 */
var items = fl.getDocumentDOM().library.getSelectedItems();
for (var i = 0; i < items.length; i++) {
  fl.getDocumentDOM().library.editItem(items[i].name);
  var timeline = fl.getDocumentDOM().getTimeline();
  timeline.currentLayer = 1; 
  timeline.addNewLayer("script");
  timeline.layers[1].frames[0].actionScript = "this.stop();"; 
}
++ /jsfl/Commands/FrameMoveRight.jsfl (リビジョン 1193)
//right
(function () {
  var timeline = fl.getDocumentDOM().getTimeline();
  var selectedFrames = timeline.getSelectedFrames();
    timeline.setSelectedFrames([selectedFrames[0], selectedFrames[1] + 1, selectedFrames[1] + 2]);
})();
++ /jsfl/Commands/MoveToOrigin.jsfl (リビジョン 1193)
/**
 *  move to 0,0 origin
 */
var doc = fl.getDocumentDOM();
for (var i in doc.selection) {
  doc.selection[i].x = 0;
  doc.selection[i].y = 0;
}
++ /jsfl/Commands/SetInstanceName.jsfl (リビジョン 1193)
/**
 *  open setting selected instance name prompt
 *  @see http://bitmap.dyndns.org/blog/archives/001581.html
 */
var instanceName = prompt("set intance name", "");
if (instanceName) {
  fl.getDocumentDOM().selection[0].name = instanceName;
}