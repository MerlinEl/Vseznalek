//get lelement by ID
var obj = $("#my_obj_id");
var o = $("#Stage_miminko");

//change layers order
o.insertAfter("#Stage_RoundRect");
o.insertBefore("#Stage_RoundRect");
$("#2").prependTo("#parent");

//get position
var pos = o.position()
o.position().left
o.position().top

//set position
o.css({top: 0, left: 0, position:'absolute'});
document.getElementById('canvas').style.left = 20px



	$('#widget').mousemove(function(evt) {
		var mousePos = getMousePos(this, evt);
		console.log("Mouse position: " + mousePos.x + "," + mousePos.y);
	})
	
	$('#widget').click(function (e) { //Offset mouse Position
        var posX = $(this).offset().left,
            posY = $(this).offset().top;
        console.log('mouse_x: '+(e.pageX - posX) + ' , mouse_y: ' + (e.pageY - posY));
    });
	

canvas.addEventListener('mousemove', function(evt) {
 var mousePos = getMousePos(canvas, evt);
 console.log('Mouse position: ' + mousePos.x + ',' + mousePos.y;);
}

contains = function (X, Y){
	if (typeof (X) === 'object'){
		X = X.X?X.X:X.x;
		Y = X.Y?X.Y:X.y;
	}
	return (X >= this.left && X = this.top && Y <= this.bottom);
}

var _array = [1,3,2];
Math.max.apply(Math,_array); // 3
Math.min.apply(Math,_array); // 1

arr.indexOf(Math.max.apply(window,arr))

console.log($('#green_text').css('width'))
xm=xm.replace(/\-/g, '_'); 