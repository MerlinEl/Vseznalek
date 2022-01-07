var _doc = (fl.getDocumentDOM() ? fl.getDocumentDOM() : fl.createDocument());var _lib = _doc.library;fl.outputPanel.clear();ReplaceItemWithItem('Game Layouts/card holder', 'Game Layouts/card holder new');function ReplaceItemWithItem(oldmcname, newmcname){  var item1 = GetItem(oldmcname);  var item2 = GetItem(newmcname);  if (!item1) return false;  if (!item2) return false;  if (oldmcname == newmcname)    return true;  return ReplaceAllItems(item1, item2);}function ReplaceAllItems(item1, item2){  var timelines = _doc.timelines;  var i, l = timelines.length;  var items = _lib.items;  var changed = false;// Main timelines  for (i = 0; i < l; i++)  {    var timeline = timelines[i];    changed |= ReplaceItems(timeline, item1, item2);  }// Timelines in library items  for (i = 0, l = items.length; i < l; i++)  {    var item = items[i];    switch (item.itemType)    {    case "movie clip":    case "graphic":    case "button":      changed |= ReplaceItems(item.timeline, item1, item2);      break;    }  }  return changed;}function ReplaceItems(timeline, item1, item2){  var changed = false;  if (timeline && item1 && item2)  {    var layers = timeline.layers;    var lay, layl = layers.length;    for (lay = 0; lay < layl; lay++)    {      var layer = layers[lay];      var frames = layer.frames;      var fr, frl = frames.length;      for (fr = 0; fr < frl; fr++)      {        var frame = frames[fr];        if (frame && frame.startFrame == fr)        {          var elements = frame.elements;          var e, el = elements.length;          for (e = 0; e < el; e++)          {            var elem = elements[e];            if (elem && elem.elementType == "instance")  // Elements can be empty            {              var item = elem.libraryItem;              if (item.name == item1.name)              {                elem.libraryItem = item2;                changed = true;              }            }          }        }      }    }  }  return changed;}function GetItem(itemname){  if (!_lib.selectItem(itemname))  {    alert("'" + name + "' does not exist in the library!");    return null;  }  return _lib.getSelectedItems()[0];}