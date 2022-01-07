function followBall(event:MouseEvent):void {
	marker.x=mouseX;
	marker.y=mouseY;
}
function startDragging(event:MouseEvent):void 
{ 
	stage.addEventListener(MouseEvent.MOUSE_MOVE,followBall);
} 
function stopDragging(event:MouseEvent):void 
{ 
	stage.removeEventListener(MouseEvent.MOUSE_MOVE,followBall);
} 
stage.addEventListener(MouseEvent.MOUSE_DOWN, startDragging); 
stage.addEventListener(MouseEvent.MOUSE_UP, stopDragging);



//1.
stage.addEventListener(Event.ENTER_FRAME,followBall);

//2.
function followBall(event:Event):void {
var dx:int = ball_mc.x - mouseX;
var dy:int = ball_mc.y - mouseY;
ball_mc.x -= dx / 5;
ball_mc.y -= dy /5;
}


//Debug Functions
function deleteObjectsByType(type){
	var inks = NB.page.getObjectsByType(type) 
	for (i in inks) {	NB.getObject(inks[i]).deleteObject()}
}

//Main Functions
(function() {jQuery.fn['bounds'] = function () {
	var bounds = {
		pos: {x:0, y:0},
		left: Number.POSITIVE_INFINITY,
		top: Number.POSITIVE_INFINITY,
		right: Number.NEGATIVE_INFINITY,
		bottom: Number.NEGATIVE_INFINITY,
		width: Number.NaN,
		height: Number.NaN
	};

	this.each(function (i,el) {
		var elQ = $(el);
		var off = elQ.offset();
		off.right = off.left + $(elQ).width();
		off.bottom = off.top + $(elQ).height();

		if (off.left < bounds.left)
		bounds.left = off.left;

		if (off.top < bounds.top)
		bounds.top = off.top;

		if (off.right > bounds.right)
		bounds.right = off.right;

		if (off.bottom > bounds.bottom)
		bounds.bottom = off.bottom;
	});
	bounds.pos = {x:bounds.left, y:bounds.top};
	bounds.width = bounds.right - bounds.left;
	bounds.height = bounds.bottom - bounds.top;
	return bounds;
}})();

function hitTest(a, b){
	var aPos = a.bounds();
	var bPos = b.bounds();
	var aLeft = aPos.left;
	var aRight = aPos.left + a.width();
	var aTop = aPos.top;
	var aBottom = aPos.top + a.height();

	var bLeft = bPos.left;
	var bRight = bPos.left + b.width();
	var bTop = bPos.top;
	var bBottom = bPos.top + b.height();

	return !( bLeft > aRight
		|| bRight < aLeft
		|| bTop > aBottom
		|| bBottom < aTop
		);
}

//Get the absolute position of a DOM object on a page
function getObjAbsPos(obj) {
    var curLeft = curTop = 0;
    if (obj.offsetParent) {
    	do {
    		curLeft += obj.offsetLeft;
    		curTop += obj.offsetTop;
    	} while (obj = obj.offsetParent);
    }
    return {x:curLeft, y:curTop};
}; //var center = getObjAbsPos(document.getElementById('canvas'));

function getMousePos(canvas, evt) {
	var rect = canvas.getBoundingClientRect();
	return {
	  x: evt.clientX - rect.left,
	  y: evt.clientY - rect.top
	};
}

function getDivPos(div){
	var pos = $(div).position();
	var w = $(div).width();
	var h = $(div).height();
	return {x:pos.left, y:pos.top}
};

function get2PDistance( point1, point2 ){
  var xs = ys = 0;
  xs = point2.x - point1.x;
  xs = xs * xs;
  ys = point2.y - point1.y;
  ys = ys * ys;
  return Math.sqrt( xs + ys );
}
function getMinDistanceFromPoint(arr, point){
	
	var distances = new Array();
	$.each(arr, function(i, val) {
		distances.push(get2PDistance(val, point))
	});

console.log("dist: ",distances, " smalest: ", Math.min.apply(Math,distances))

	var index = distances.indexOf(Math.min.apply(Math,distances));
	return Object.keys(arr)[index];
}



maximizePointBounds = function(point, w, h){

	return {
	pos:{x:point.x-app_offset.x, y:point.y-app_offset.y},
	left:point.x-app_offset.x-w/2, 
	top:point.y-app_offset.y-h/2, 
	right:point.x-app_offset.x+w/2, 
	bottom:point.y-app_offset.y+h/2, 
	width:w, 
	height:h
	}
}

maximizeBounds = function(rect, w, h){
	rect.left -=w/2;
	rect.right +=w/2; 
	rect.top -=h/2;; 
	rect.bottom +=h/2;
	rect.width=w; 
	rect.height=h;
	return rect;
}

round2Point = function(p2){
		return {x:Math.round(p2.x), y:Math.round(p2.y)};
}

intersectRect = function (r1, r2) {
	return !(r2.left > r1.right
        || r2.right < r1.left
        || r2.top > r1.bottom
        || r2.bottom < r1.top);
};

/*
----O-----
-        -
O        O
-        -
----O-----
*/
getSnapPos = function(rect, point){
	var midpoints={
		top: {x:rect.left+rect.width/2, y:rect.top},
		left:{x:rect.left, y:rect.top+rect.height/2},
		right:{x:rect.right, y:rect.top+rect.height/2},
		bottom:{x:rect.left+rect.width/2, y:rect.bottom}
	}
	var pos = getMinDistanceFromPoint(midpoints, point);
	console.log("closest pos", pos)
};


drawCircleMarker = function(point){
	var circle = $("<div class='circle_markers' style='position:fixed; border-radius: 50px'></div>")
	$(document.body).append(circle);
	circle.attr({id: 'current'}).css({	
		width: marker_size, height: marker_size,
		background: "red",
		border:"2px #FF00FF solid",
        top: point.y-marker_size/2-app_offset.x , //offsets
        left:point.x-marker_size/2-app_offset.y //offsets
   })
   return circle;
}

drawBoxMarker = function(bounds){ //drawBoxMarker(rect_b);
var box = $("<div class='rect_markers' style='position:fixed; border:2px #FF00FF solid'></div>").hide();
	$(document.body).append(box);
	box.attr({id: 'current'}).css({
             top: bounds.top , //offsets
             left: bounds.left, //offsets
			 width: bounds.width,
			 height:bounds.height
   }).fadeIn();
};

function setDivPos(marker, point){
	marker.attr({id: 'current'}).css({	
        top: point.y-marker_size/2-app_offset.x , //offsets
        left:point.x-marker_size/2-app_offset.y //offsets
   })
}


findClosestObject = function(div, class_str){
	
	var set = $(class_str);
	var data = {obj:undefined, rect:undefined};
	
	$.each(set, function(	) {
		var element = $(this);
		console.log("hit test: "+ hitTest(div, element))
		var rect_a = $(element).bounds();
		var rect_b = $(div).bounds();
			rect_b = maximizeBounds(rect_b, drop_tolerance/2, drop_tolerance);
		if (intersectRect(rect_a, rect_b)){
			data.obj=element; data.rect=rect_a;
		}
//debug
//drawCircleMarker(rect_b.pos);
	})
	return data;
}

function chnageDivBorder(div, clr){
	
	div.css("border", clr+" solid 4px");
}
/*
 * Copyright (c) 2012 Ethernity.
 * Licensed under the MIT license.
 *
 * @version 1.01
 */

 //get current document  path:  /c:/Documents and Settings/Merlin/Plocha/Nae Stánky/www/test09/index.html
function getDocumentPath()
{
	document.write(window.location.pathname);
}
 //get current document  full path:  file://localhost/c:/Documents%20and%20Settings/Merlin/Plocha/Na%C5%A1e%20St%C3%A1nky/www/test09/index.html
function getDocumentFullPath ()
 {
	document.write(location.href);
 }
 //split url path at www
 function splitDocumentPath (str)
 {
	var path_array = window.location.pathname.split( str );
	return (path_array[0]+str)
 }
 
//var newPathname = array.join("/");
function assembleArray (array)
{
	var str = "";
	for ( i = 0; i < array.length; i++ ); 
	{
	  str += "/";
	  str += array[i];
	}
	return str
}
 
//file://localhost/c:/Documents%20and%20Settings/Merlin/Plocha/Nae%20Stánky/www/galerie/fotografie/index.htm
function getLocalPath8 (dir_name) 
{
	var path_array = window.location.pathname.split('www');
	var full_path = path_array[0]+"www/" + dir_name + "/index.html";
	return full_path;
}
 
 //get part of path
 function getPathStruct ()
 {
	document.write("<P>Protocol: ");
	document.write(location.protocol);
	document.write("<P>Host: ");
	document.write(location.host);
	document.write("<P>Path: ");
	document.write(location.pathname);
	document.write("<P>PathArray: ");
	var pathArray = window.location.pathname.split( '/' );
	document.write(pathArray);
	document.write("<P>PathArray[2]: ");
	document.write(pathArray[2]);
	document.write("<P>URLpath: ");
	var my_url = window.location.protocol + "://" + window.location.host + "/" + window.location.pathname;
	document.write(my_url);
	document.write("<P>URLpath: ");
	document.write(location.href);
	document.write("<P>LastIndex: ");
	document.write(location.href.lastIndex);
	document.write("<P>Split It At WWW: ");
	var pathArray = window.location.pathname.split('www');
	document.write(pathArray);
	document.write("<P>Split It At WWW[0]: ");
	document.write(pathArray[0]);
	document.write("<P>Domain: ");
	document.write(document.domain);
	//var newURL = window.location.protocol + "://" + window.location.host + "/" + window.location.pathname + window.location.search + window.location.hash;
	//document.write(newURL);
	//var fullUrl = window.location.pathname + window.location.search;
	//document.write(fullUrl);
	//window.location.protocol.replace(/\:/g, ) + :// + window.location.host
	//var my_url = document.href.substring(0,location.href.lastIndexO f("/")+1);
 }
 
//napíe ahoj: napis();
function napisAhoj()
{
	document.write("ahoj");
}

//napíe zadaný text: napis('dobrý vecer');
function napisSlovo (string)
{
	document.write(string);
}

//vytiskne do html dokumentu datum posledních úprav
function posledniUpravy()
{
	document.write(document.lastModified);
}

//Nyní vloíme do naeho dokumentu aktuální cas
function licalTime()
{
	var today = new Date();
	document.write("The time now is: ",today.getHours(),":",today.getMinutes());
	document.write("The date is: ", today.getMonth()+1,"/",today.getDate(),"/",today.getYear());
}

//vytvorí edit box ze kterého si pak vezme string a secte s dalím stringem
function show_prompt()
{
	var name=prompt("Please enter your name","Harry Potter");

	if (name!=null && name!="")
	{
		document.write("<p>Hello " + name + "! How are you today?</p>");
	}
}

//tvorba okna s preddefinovaným textem
function okno()
{
	obsah = window.prompt("Text, který chcete mít v novém okne","text");
	dyn_okno = window.open("","dyn_okno","height=100px, width=100px, top=0, left=100px, resizable=no, status=no, toolbar=no,location=no, scrollbars=yes, resizable=yes");
	dyn_okno.document.write("<html><body>");
	dyn_okno.document.write(obsah);
	dyn_okno.document.write("</body></html>");
}

//okno na plnou obrazovku s vycentrovaným nadpisem
function OpenNewWindow()
{
	msg=open("","DisplayWindow","toolbar=no,directories=no,menubar=no");
	msg.document.write("<HEAD><TITLE>Yo!</TITLE></HEAD>");
	msg.document.write("<CENTER><h1><B>This is really cool!</B></h1></CENTER>");
}

//Okno, které budeme tlacítky zvetovat a posunovat.
function okno2()
{
	obsah = window.prompt("Text, který chcete mít v novém okne","text");
	dyn_okno = window.open("","dyn_okno",
	                       "height=100px, width=100px, top=0, left=100px, resizable=no, status=no, toolbar=no,location=no, scrollbars=yes, resizable=yes");
	dyn_okno.document.write("<html><body>");
	dyn_okno.document.write(obsah);
	dyn_okno.document.write("<input type='button' onClick='resizeBy(10,10);' value='otevri okno' id='em'>");
	dyn_okno.document.write("<input type='button' onClick='moveBy(10,10);' value='otevri okno' id='em'>");
	dyn_okno.document.write("</body></html>");
}

//This is done to make the following JavaScript code compatible to XHTML. <![CDATA[
function prompt()
{
	("Input your country Name :",'');
}


// CHANGE THESE TO ALTER THE SCROLL SPEED
ScrollSpeed = 220;  // milliseconds between scrolls
ScrollChars = 1;    // chars scrolled per time period

function SetupTicker()
{
	// add space to the left of the message
	msg = "                                                                 ";
	// PUT YOUR MESSAGE HERE, USE += TO ADD THEM TOGETHER
	msg += "Csesta Slunce     ";
	msg += "     ";
	msg += "Gallerie Obrazu, Diskuze, Zajímavé odkazy... ";
	msg += "     ";
	msg += "© Merlin El & Semi 2012";
	msg += "     ";
	msg += "Stránky se upravují...";
	// this starts the ticker
	RunTicker();
}

// Spustí rolovaní textu na spodní lite
function RunTicker()
{
	window.setTimeout('RunTicker()',ScrollSpeed);
	window.status = msg;
	msg = msg.substring(ScrollChars) + msg.substring(0,ScrollChars);
}
function fillImagePatern(img_str, align, id) 
{  
	
	var canvas = document.getElementById(id)
	var ctx = canvas.getContext('2d');  
	// create new image object to use as pattern  
	var img = new Image();  
	img.src = img_str;  
	img.onload = function()
	{  
		// create pattern  
		var ptrn = ctx.createPattern(img,'repeat');  
		ctx.fillStyle = ptrn;  
		var pos = {x:0,y:0};
		switch(align) 
		{
			 case "top" : pos.y = 0; break;
			 case "bottom" : pos.y = canvas.height-img.height; break;
			 default : pos.y = 0;
		 }
		ctx.fillRect(pos.x,pos.y,canvas.width,img.height);  
	}  
} 

function inicializeInterface()
{
    //create an element for bottom bar
	//<div><canvas id="canvas" width="400" height="150"></canvas></div>	
	//fillImagePatern('./theme/bar_body.png')
	fillImagePatern("./theme/bar_body.png", "bottom", "page-background") 
}
function drawPaleteToCanvas() //<canvas id="canvas" width="150" height="150"></canvas>
{
  var ctx = document.getElementById('canvas').getContext('2d');
  for (i=0;i<6;i++){
    for (j=0;j<6;j++){
      ctx.fillStyle = 'rgb(' + Math.floor(255-42.5*i) + ',' + 
                       Math.floor(255-42.5*j) + ',0)';
      ctx.fillRect(j*25,i*25,25,25);
    }
  }
}
function drawPaternToCanvas() 
{  
	var ctx = document.getElementById('canvas').getContext('2d');  
	// create new image object to use as pattern  
	var img = new Image();  
	img.src = 'wallpaper.png';  
	img.onload = function()
	{  
		// create pattern  
		var ptrn = ctx.createPattern(img,'repeat');  
		ctx.fillStyle = ptrn;  
		ctx.fillRect(0,0,150,150);  
	}  
} 

function createImage() 
{
var pattern = new Image;
pattern.src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAARCAIAAABbzbuTAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAZtJREFUeNqMUs+rAVEUvjNG2MhClOUsppSEjbWFpOwtMIv5B2ZhZqkkZKkpe+XPYKtsbSxsZIGaQpgi4r3Pu5p3eV45dW/nnPt959zzg5RKpU6n8/WxkHq9LghCs9n8lICjKAohpFwuf0LgcCzLSqfTo9FIVVVd10He7XbX6/V8Pu/3e47jcB+Px0AgkEqlCOXNZjNJkgB1/wg+6XA4ACXPomkasXM1Gg3yj4AZi8WAHgwGgu1dLpcvOKRKJBLZbDaTyYDgdDrvXjtDLpd7yT6dTv8WzdNnaPP53A6Mezgc+v3+N/+jvO12GwwGqQfFYJRQksnker1+MwfIZDLxeDwA+Xy+xWIBT6VSgYk+Hg4HlvAoerVaodNQ8vl8KBSCUqvVAG2326g4EolsNhuYGNQjQ6/XAwh9GI/HbDxZltn/o2OPDBgctaPRKIsQRZEqWJxisXg3aaRCoQBvv99nw59Op3A4DH+1Wu12u09FYwh4w/6wBGwUOhuPx6FfLpfb7fZbtGEYpmnyPM/+x+v1tlotl8sFHdtFnd8CDACAg6Y2weEZQQAAAABJRU5ErkJggg==";
return pattern
}

function createStraightPatern() 
{
	var pattern = createImage()
	var context = document.getElementById('canvas').getContext('2d');
    context.beginPath();
    context.lineWidth = 16;
    context.strokeStyle = context.createPattern(pattern, 'repeat');
    context.moveTo(0, 0);
    context.lineTo(150, 150);
    context.stroke();
	document.pattern = context
} 

function createImagePaternXXX() 
{
	var pattern = document.getElementById('bar') //load an image from webpage by id
	var canvas  = document.getElementById('canvas')
	var context = canvas.getContext('2d');
    context.beginPath();
    context.lineWidth = pattern.height;
	//alert(pattern.height)
    context.strokeStyle = context.createPattern(pattern, 'repeat');
    context.moveTo(0,canvas.width); //draw in bottom part of canvas
    context.lineTo(canvas.width, 0);
    context.stroke();
	document.pattern = context
} 

function fillImagePatern(img_str, align) 
{  
	var canvas = document.getElementById('canvas')
	var ctx = canvas.getContext('2d');  
	// create new image object to use as pattern  
	var img = new Image();  
	img.src = img_str;  
	img.onload = function()
	{  
		// create pattern  
		var ptrn = ctx.createPattern(img,'repeat');  
		ctx.fillStyle = ptrn;  
		var pos = {x:0,y:0};
		switch(align) 
		{
			 case "top" : pos.y = 0; break;
			 case "bottom" : pos.y = canvas.height-img.height; break;
			 default : pos.y = 0;
		 }
		ctx.fillRect(pos.x,pos.y,canvas.width,img.height);  
	}  
} 

function openImageInWindow () 
{
	var image = document.getElementById('photoNote');
	window.open(image.src);
}

//get local or internet path
function getLocalPath (dir_name) 
{
	if (location.protocol != "http:") /*check if is online or offline*/
	{
		var path_array = window.location.pathname.split('www');
		var full_path = path_array[0]+"www" + dir_name + "/index.html";
		return full_path
	}
	else return dir_name
};
//get document information
 function getPathStruct ()
 {
	document.write("<P>Protocol: ");
	document.write(location.protocol);
	document.write("<P>Host: ");
	document.write(location.host);
	document.write("<P>Path: ");
	document.write(location.pathname);
	document.write("<P>PathArray: ");
	var pathArray = window.location.pathname.split( '/' );
	document.write(pathArray);
	document.write("<P>PathArray[2]: ");
	document.write(pathArray[2]);
	document.write("<P>URLpath: ");
	var my_url = window.location.protocol + "://" + window.location.host + "/" + window.location.pathname;
	document.write(my_url);
	document.write("<P>URLpath: ");
	document.write(location.href);
	document.write("<P>LastIndex: ");
	document.write(location.href.lastIndex);
	document.write("<P>Split It At WWW: ");
	var pathArray = window.location.pathname.split('www');
	document.write(pathArray);
	document.write("<P>Split It At WWW[0]: ");
	document.write(pathArray[0]);
	document.write("<P>Domain: ");
	document.write(document.domain);
	document.write("<P>Is Http Host?: ");
	document.write(location.protocol  == "http:");
 };
 
 function getImgSize(img_src){
    var newImg = new Image();
    newImg.src = img_src;
    var height = newImg.height;
    var width = newImg.width;
    p = $(newImg).ready(function(){
        return {width: newImg.width, height: newImg.height};
    });
    //console.log ('width:'+p[0]['width']+" height:"+p[0]['height']);
};

 //cereate XML object
function createXMLHttpRequest() 
{
	try { return new XMLHttpRequest(); } catch(e) {}
	try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) {}
	try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch (e) {}
	alert("XMLHttpRequest not supported");
	return null;
}
//get echo from PHP
function MakeRequest(output_item, php_file)
{
  var xmlHttp = createXMLHttpRequest();
  xmlHttp.onreadystatechange = function()
  {
    if(xmlHttp.readyState == 4) 
	{
		var response = xmlHttp.responseText;
		$(output_item).text(response);
	}
  }
  xmlHttp.open("GET", php_file, true);
  xmlHttp.send(null);
};
//call PHP fn to write data in XML
function saveDataToXML(img_id, title, description){
	$.ajax({
		type: "POST",
		url: "scripts/edit_xml.php",    // this is the path from above
		data: { "name": img_id, "title": title,"text": description },
		complete: function(data) //manage the complete if needed
		{
			console.log(data)
		},
		success: function(php) //get some data back to the screen if needed
		{
			//$('#output_item').text(php)
			console.log(php)
		} 
	});
};

//Getting the filename from a path
function getFileNameFromPath(path) {
  var ary = path.split("/");
  return ary[ary.length - 1];
}

//display hidden form
function editDescription(){
	// show the mask
    $("#JqAjaxFormMask").fadeTo(500, 0.64);
    // show the popup
    $("#JqAjaxForm").show();
	//load description dat to form
	var str1=$("#caption h3").text();						
	var str2=$("#caption p").text();
	$("#form_title").val(str1);
	$("#form_text").val(str2);
	//set focus to first  edit box
	$('#JqAjaxForm #form_title').focus();
/*
	$("#JqAjaxForm").fadeIn("slow");
	$("#JqAjaxForm").slideDown("slow");
*/	
};

//commit changes to caption and div element
function updateCaption (img_name, title, txt)
{
	//send new data to caption box
	$("#caption h3").text(title);
	$("#caption p").text(txt);	
	//send new data to img item
	var img_list = $('.jTscroller a').children('img');// get an array of elements
	img_list.each(function(){ //go trough array elements
		var thumb_path = $(this).attr('src');
		if (thumb_path == "thumbs/"+img_name)
		{
			$(this).attr('alt', title)
			$(this).attr('longdesc', txt)
		}
	})
};

//center element A to element B
function centerElementToBottom(a, b)
{
	var img_w = $(b).width(); // Get height
	$(a).width(img_w);  // Set height
	// center to document
	$(a).offset
	({
		left: $(document).width()/2 -  $(a).width()/2
	});
};
//centerElement ('#caption', '#mainImage')


function resizeProportionaly2(maxw, maxh, currw, currh) {
   var ratio = maxh/maxw;
   if (currh/currw > ratio){ // height is the problem ?
     if (currh > maxh){
       currw = Math.round(currw*(maxh/currh));
       currh = maxh;
     }
	 } else { // width is the problem ?
     if (currw > maxh){
       currh = Math.round(currh*(maxw/currw));
       currw = maxw;
     }
   } 
   return ({  width: currw, height: currh})
 };
 
 function resizeProportionaly(maxw, maxh, currw, currh) {
	var ratio = 0; //Used for aspect ratio
	if (currw > maxw) {
		ratio = (maxw / currw); //get ratio for scaling image
		/* Set New hieght and width of Image*/
		currw = maxw;
		currh = Math.ceil(currh * ratio);
		/*Check if current height is larger than max*/
		if (currh > maxh) {
			ratio = (maxh / currh); //get ratio for scaling image
			/*Set new height and width*/
			currh= maxh;
			currw = Math.ceil(currw * ratio);
		}
	}
	return ({  width: currw, height: currh})
 };
 
 function resizeImageProportionaly(img, maxw, maxh) {
	var ratio = 0; //Used for aspect ratio
	var width = img.width(); //Current image width
	var height = img.height(); //Current image height
	/*Check if the current width is larger than the max*/
	if (width > maxw) {
		ratio = (maxw / width); //get ratio for scaling image
		/* Set New hieght and width of Image*/
		img.attr({
			width : maxw,
			height : (height * ratio),
			alt : "your-alt-text-you-can-remove-this"
		});
		height = (height * ratio); //Reset height to match scaled image
		width = (width * ratio); //Reset width to match scaled image
		/*Check if current height is larger than max*/
		if (height > maxh) {
			ratio = (maxh / height); //get ratio for scaling image
			/*Set new height and width*/
			img.attr({
				height : maxh,
				width : (width * ratio),
				alt : "your-alt-text-you-can-remove-this"
			});
		}
	}
}

$.fn.roundThis = function(radius) {
    return this.each(function(e) {
        $(this).css({
           "border-radius": radius,
           "-moz-border-radius": radius,
           "-webkit-border-radius": radius
        });
    });
};

$(function() {

    // usage
    $("p").roundThis('50px');

});

$(document).ready(function () {
    $.fn.yourExt = {

        _readjustHTML5CanvasHeight: function () {
            //clear the canvas by readjusting the width/height
            var html5Canvas = $('#html5CanvasId');
            var canvasDiv = $('#divCanvasId');

            if (html5Canvas.length > 0) {
                html5Canvas[0].width = canvasDiv.width();
                html5Canvas[0].height = canvasDiv.height();
            }
        }
        ,
        //uses HTML5 <canvas> to draw line representing relationship
        //IE support with excanvas.js
        _drawLineBetweenElements: function (sourceElement, targetElement) {

            //draw from/to the centre, not the top left
            //don't use .position()
            //that will be relative to the parent div and not the page
            var sourceX = sourceElement.offset().left + sourceElement.width() / 2;
            var sourceY = sourceElement.offset().top + sourceElement.height() / 2;

            var targetX = targetElement.offset().left + sourceElement.width() / 2;
            var targetY = targetElement.offset().top + sourceElement.height() / 2;

            var canvas = $('#html5CanvasId');

            //you need to draw relative to the canvas not the page
            var canvasOffsetX = canvas.offset().left;
            var canvasOffsetY = canvas.offset().top;

            var context = canvas[0].getContext('2d');

            //draw line
            context.beginPath();
            context.moveTo(sourceX - canvasOffsetX, sourceY - canvasOffsetY);
            context.lineTo(targetX - canvasOffsetX, targetY - canvasOffsetY);
            context.closePath();
            //ink line
            context.lineWidth = 2;
            context.strokeStyle = "#000"; //black
            context.stroke();
        }


        drawLines: function () {
        //reset the canvas
        $().yourExt._readjustHTML5CanvasHeight();

        var elementsToDrawLinesBetween;
        //you must create an object that holds the start and end of the line
        //and populate a collection of them to iterate through
        elementsToDrawLinesBetween.each(function (i, startEndPair) {
            //dot notation used, you will probably have a different method
            //to access these elements
            var start = startEndPair.start;
            var end = startEndPair.end;

            $().yourExt._drawLineBetweenElements(start, end);
        });
    }
	
function getCharsBefore(str, chr) {
    var index = str.indexOf(chr);
    if (index != -1) {
        return(str.substring(0, index));
    }
    return("");
}		
	
	
/*

	var pattern = document.getElementById('bar').getContext('2d')
	var context = document.getElementById('canvas').getContext('2d');
    context.beginPath();
    context.lineWidth = 16;
    context.strokeStyle = context.createPattern(pattern, 'repeat');
    context.moveTo(0, 0);
    context.lineTo(150, 150);
    context.stroke();
	document.pattern = context
*/


xm=xm.replace(/\"/g, '\''); //replace Double for Single Quotes