import flash.geom.Point;var offset:Number=20;var all_cards = getMovielipsByPrefix(this, "card");var line_posy=new Array();var card_lines=new Object();for (var i=0; i<all_cards.length; i++) {		var card=all_cards[i];	var pos=findPos(line_posy, card.y); 	if (pos != -1){		//trace ("found:"+pos);		if (card_lines[pos]==null)card_lines[pos]=[card] else card_lines[pos].push(card);			}else{		//trace ("not found:"+pos);		line_posy.push(card.y)		pos = line_posy.length-1;		if (card_lines[pos]==null)card_lines[pos]=[card] else card_lines[pos].push(card);	}}for (var o in card_lines){		var line_cards = card_lines[o];	//trace ("line:"+o+" cards:"+cards);	var all_pos = new Array ();	for each (var c in line_cards) all_pos.push(new Point(c.x, c.y) );	all_pos.sort(randomSort)	for (var j=0; j<line_cards.length; j++) {					var po = all_pos[j];		var lc = line_cards[j];		lc.x=po.x;		lc.y=po.y;	}};function findPos (arr:Array, posy:Number):Number{		for (var i=0; i<arr.length; i++) {				var p=arr[i];		if (Math.abs(p-posy) < offset) return i;	}	return -1;}function getMovielipsByPrefix(container, str:String):Array{	var clips:Array = new Array();	for (var i:Number=0; i<=container.numChildren-1;i++) {			var mc = container.getChildAt(i);		if (mc is MovieClip){ 			var prefix = mc.name.split("_")[0];			if (prefix == str) {clips.push(mc)}; 		}	}	return clips;};function randomSort(a:*, b:*):Number {	if (Math.random() < 0.5) return -1;	else return 1;};