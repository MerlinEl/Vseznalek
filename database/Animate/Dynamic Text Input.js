	const inputElements = document.getElementsByTagName('input');	log("inputElements:", inputElements)	$( document ).ready(function() {        log("tf:", $('#tf_a'))		log("tf:", $('#tf_a').text)		$('#tf_a').text('45');    });	// Input text is not supported in a HTML5 Canvas document. 	// It's only available in AS3/AIR document types.	// For HTML5 use TextInput Component 	// setTimeout method to make sure the component it's ready to be referenced in the beginning	setTimeout(function(){				//tl.tf_input_02.type = "input";		var tf_input_01 = document.getElementById("tf_input_01");		// console.log(tf_input_01.style.cssText)		// console.log(tf_input_01.style)				tf_input_01.style.cssText += [			"color : black",			"; font-weight : bold",			//"font-size: 200.0%",			"font-size : 40px",			"text-align : center",			"background-color   : rgba(0, 0, 0, 0)",			"border-top-style    : hidden",			"border-right-style  : hidden",			"border-left-style   : hidden",			"border-bottom-style : hidden",			"outline : none"//,			//"height : 60px",			//"padding-bottom: 10px"		].join("; ");				tf_input_01.value = "50";		createjs.Tween.get().wait(100).call(setCarret);		function setCarret(){						var tf = document.getElementById("tf_input_01")				tf.focus()				//tf.style.fontSize = "40px";		}		var start_w = canvas.width;		window.addEventListener("resize", function () {			var scale_percent = (canvas.width / start_w) * 100;			tf_input_01.style.fontSize = ((40 / 100) * scale_percent) + "px";		})		}, 0);	 // https://createjs.com/docs/easeljs/classes/Text.html	 /*var text = new createjs.Text("Hello World", "20px Arial", "#ff7700");	text.x = 100;	text.textBaseline = "alphabetic";	text.mouseEnabled="true";	text.onclick="focus()"	 tl.addChild(text);*/		var s = document.createElement("INPUT");	s.setAttribute("type", "text");	s.setAttribute("value", "0");	s.setAttribute("id", "input_01");	//s.setAttribute("position", "absolute");	//document.body.appendChild(s);	//dom_overlay_container.appendChild(s);	canvas.parentNode.appendChild(s);	console.log("input text:"+s)	setTimeout(function(){				//var inputText = dom_overlay_container.children["input_01"];		var inputText = document.getElementById("input_01");		inputText.style.position = "absolute";		inputText.style.left = tl.tf_input_04.x + "px";		inputText.style.top = tl.tf_input_04.y + "px";		inputText.setAttribute("value", "80");		console.log("input text:"+inputText)		inputText.focus();		var text = new createjs.Text("Plain Text");		text.set({		  text: inputText.value,		  textAlign: "center",		  textBaseline: "middle",		  x: tl.tf_input_04.x + tl.tf_input_04 / 2,		  y: tl.tf_input_04.x + tl.tf_input_04 / 2		});		tl.addChild(text);		inputText.onkeyup = function() { //.keyup(function(e){		  text.set({			text: inputText.value		  })		  stage.update()		}	})/*<input type="text" id="input" value="Start Text" />*/	/*var element = new createjs.DOMElement("idname");	element.htmlElement.onclick = function() {		alert("I am active");	}*/	// Create a DIV layer above the canvas	// Accepts ID, X, Y, width, height, HTML content, and CSS styling (optional)	// CSS styling is a CSS-formatted literal string	var mkDiv = function(id, x, y, w, h, html, css) {		var d = document.createElement("div");		d.id = id;		d.style.cssText = "position:absolute; left:" + x + "px; top:" + y + "px; width:" + w + "px; height:" + h + "px; overflow:auto;" + (css ? css : "");		d.innerHTML = html;		canvas.parentNode.appendChild(d);	}	// Remove an element by ID name	/*rmDiv = function(id) {		try {			var elem = document.getElementById(id);			elem.parentNode.removeChild(elem);		}		catch(e) {}	}*/	//So for example, to create an input text element, you could do:	mkDiv("myInputDiv", 200, 200, 500, 100, "<input id='myInput' type='text'>", "font-size:32px; background:fuchsia");				// setTimeout method to make sure the component it's ready to be referenced in the beginning	setTimeout(function(){				//tl.tf_input_02.type = "input";		var tf_input_01 = document.getElementById("tf_input_01");		// console.log(tf_input_01.style.cssText)		// console.log(tf_input_01.style)				tf_input_01.style.cssText += [			"color : black",			"; font-weight : bold",			"font-size : 40px",			"text-align : center",			"background-color   : rgba(0, 0, 0, 0)",			"border-top-style    : hidden",			"border-right-style  : hidden",			"border-left-style   : hidden",			"border-bottom-style : hidden",			"outline : none"//,			//"height : 60px",			//"padding-bottom: 10px"		].join("; ");				tf_input_01.value = "50";		createjs.Tween.get().wait(100).call(setCarret);		function setCarret(){						document.getElementById("tf_input_01").focus();		}		}, 0);	// setTimeout method to make sure the component it's ready to be referenced in the beginning	setTimeout(function(){				var textInput = dom_overlay_container.children["tf_001"];		textInput.style.fontSize = "50px";		textInput.style.textAlign = "center";		textInput.height = "80px"		textInput.style.border = "0px";		textInput.style.background = "false"		textInput.style.display = "flat"		//textInput.style.backgroundColor = "#E6AE55"		//background: 'rgb(232, 241, 250)'		console.log(textInput.style.background)		console.log(textInput.style)		//textInput.style.align = "center"			//.bold = "true"		//textInput.style.fontFamily = "'Comic Sans MS', cursive, sans-serif";	}, 0);	this.tf_001.on("added", function () {		console.log("added")		document.getElementById("tf_001")			.style.fontSize = "28px"			.disabled = true	});function wndsize(){  var w = 0;var h = 0;  //IE  if(!window.innerWidth){    if(!(document.documentElement.clientWidth == 0)){      //strict mode      w = document.documentElement.clientWidth;h = document.documentElement.clientHeight;    } else{      //quirks mode      w = document.body.clientWidth;h = document.body.clientHeight;    }  } else {    //w3c    w = window.innerWidth;h = window.innerHeight;  }  return {width:w,height:h};}function wndcent(){  var hWnd = (arguments[0] != null) ? arguments[0] : {width:0,height:0};  var _x = 0;var _y = 0;var offsetX = 0;var offsetY = 0;  //IE  if(!window.pageYOffset){    //strict mode    if(!(document.documentElement.scrollTop == 0)){offsetY = document.documentElement.scrollTop;offsetX = document.documentElement.scrollLeft;}    //quirks mode    else{offsetY = document.body.scrollTop;offsetX = document.body.scrollLeft;}}    //w3c    else{offsetX = window.pageXOffset;offsetY = window.pageYOffset;}_x = ((wndsize().width-hWnd.width)/2)+offsetX;_y = ((wndsize().height-hWnd.height)/2)+offsetY;    return{x:_x,y:_y};}var center = wndcent({width:350,height:350});document.write(center.x+';<br>');document.write(center.y+';<br>');document.write('<DIV align="center" id="rich_ad" style="Z-INDEX: 10; left:'+center.x+'px;WIDTH: 350px; POSITION: absolute; TOP: '+center.y+'px; HEIGHT: 350px"><!--К сожалению, у Вас не установлен flash плеер.--></div>');