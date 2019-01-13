/*FUNCTIONS 2012*/
//delay
function sleep(ms)
{
	var dt = new Date();
	dt.setTime(dt.getTime() + ms);
	while (new Date().getTime() < dt.getTime());
};
//clear cache for current page
function eraseCache(){
  window.location = window.location.href+'?eraseCache=true';
  console.log("Cache for current page is cleared.");
}
//get file creation date
function getFileCreationDate(fpath){ //fpath == "c:\\test.txt"
  var myActiveXObject = new ActiveXObject("Scripting.FileSystemObject");
  var file = myActiveXObject.GetFile(fpath);
  return file.DateCreated;
}
 //return reduced size proportionaly
 function resizeProportionaly(maxw, maxh, currw, currh, offset) {
	var maxw = maxw-offset;
	var maxh = maxh-offset;
	var ratio = 0; //Used for aspect ratio
	/*Check if current width is larger than max*/
	if (currw > maxw) {
		ratio = (maxw / currw); //get ratio for scaling image
		/* Set New hieght and width of Image*/
		currw = maxw;
		currh = Math.ceil(currh * ratio);
	}
	/*Check if current height is larger than max*/
	if (currh > maxh) {
		ratio = (maxh / currh); //get ratio for scaling image
		/*Set new height and width*/
		currh= maxh;
		currw = Math.ceil(currw * ratio);
	}
	return ({  width: currw, height: currh})
 };
//search for an image by path: thumbs/pic0017.jpg
function findImageIndexByPath(path, imgs)
{
	var num = -100;
	$.each( imgs , function( i, img ) {
		var href = $(img).attr('href');
		if (path == href) num = i;
	});
	return num;
};
//Getting the filename from a path
function getFileNameFromPath(path) {
  var ary = path.split("/");
  return ary[ary.length - 1];
};
//make first letter big
String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}; //str = str.capitalize()
//get PHP function by AJAX
function getAjaxFromPHP(php,data){
	var response =  "";
	$.ajax({type:"GET", url:php, data:data, dataType:'json', async: false,
		complete: function(d){ },//console.log( d )},console.log( "ajax complete:" );
		success: function(d){response = d} //console.log( "ajax success:" ); 
	});//.responseText;	
	return (response);
};
//get PHP function by AJAX
function postAjaxToPHP(php,data){
	$.ajax({type:"POST", url:php, data:data, dataType:'json', async: false,
		complete: function(d){},//console.log( "ajax complete:" ); console.log( d );},
		success: function(d){} //console.log( "ajax success:" );console.log( d );
	});			
};
//resize an image
function imageResize(maxw, maxh, img, ftype ){ //img == binary data, ftype == "image/png"
//console.log ('type:'+ftype, 'img:'+img);	
	var new_img = new Image();
	var canvas = document.createElement('canvas');
	new_img.src = img ;
	new_img.onload = function(c) {
		var new_w = new_img.width, 
			 new_h = new_img.height;
		if (new_w > new_h) {
			if (new_w > maxw) {
				new_h *= maxw / new_w;
				new_w = maxw;
			}
		} else {
			if (new_h > maxh) {
				new_w *= maxh / new_h;
				new_h = maxh;
			}
		}
		c.width = new_w;
		c.height = new_h;
		var ctx = c.getContext("2d");
		//if this Boolean value is false, images won't be smoothed when scaled. This property is true by default.
		//ctx.mozImageSmoothingEnabled = false; 
		ctx.drawImage(new_img, 0, 0, new_w, new_h);
		// The resized file ready for upload
	}(canvas);
	return canvas.toDataURL( ftype );
	//return {'file':new_file, 'name':fname, 'type':ftype}
};
function imageJPGResize(maxw, maxh, img, jpegquality){ //img == binary data, jpegquality == val from  0.0 to 1.0.
	var new_img = new Image();
	var canvas = document.createElement('canvas');
	new_img.src = img ;
	new_img.onload = function(c) {
		var new_w = new_img.width, 
			 new_h = new_img.height;
		if (new_w > new_h) {
			if (new_w > maxw) {
				new_h *= maxw / new_w;
				new_w = maxw;
			}
		} else {
			if (new_h > maxh) {
				new_w *= maxh / new_h;
				new_h = maxh;
			}
		}
		c.width = new_w;
		c.height = new_h;
		var ctx = c.getContext("2d");
		//if this Boolean value is false, images won't be smoothed when scaled. This property is true by default.
		//ctx.mozImageSmoothingEnabled = false; 
		ctx.drawImage(new_img, 0, 0, new_w, new_h);
		// The resized file ready for upload
	}(canvas);
	return canvas.toDataURL( "image/jpeg",  jpegquality);
};