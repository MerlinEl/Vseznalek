setTimeout(function(){		//nominalBounds		const inputElements = document.getElementsByTagName('input');		//log("inputElements:", inputElements)		//var tf_1 = inputElements[0]; //document.getElementById("tf_input_f0_02");		//var tf_1 = tl.localToGlobal(tl.tf_input_f0_02.x, tl.tf_input_f0_02.y);		//tf_1.x += tl.x;		//tf_1.y += tl.y;		/*		tf_1 = {						x:tl.tf_input_f0_02.x,// + tl.x,			y:tl.tf_input_f0_02.y// + tl.y		}					console.log("tf_1:", tf_1)	*/				var s = document.createElement("INPUT");		s.setAttribute("type", "text");		s.setAttribute("value", "0");		s.setAttribute("id", "input_01");		s.setAttribute("class", "ui-textinput");		s.style.cssText += [			"; display : display",			"pointer-events : all",			"box-sizing: border-box",			"position: absolute",			"width: 160.167px",			"height: 35.2368px",			"transform-origin: -0.2px 0.2px",			"transform: matrix(0.5, 0, 0, 0.5, 452.637, 166.244)",			"font-size : 40px",			"text-align : center",			//"background-color   : rgba(0, 0, 0, 0)",			//"border-top-style    : hidden",			//"border-right-style  : hidden",			//"border-left-style   : hidden",			//"border-bottom-style : hidden",			//"outline : none"//,			//"height : 60px",			//"padding-bottom: 10px"		].join("; ");		dom_overlay_container.appendChild(s);		window.addEventListener("resize", updateFont);				var scale_percent1 = (canvas.width / tl.startSize.w) * 100;		var startSize = {w:160.167, h:35.2368};		//var startPos = {x:452.637,y:166.244}			//x:(tl.tf_input_f0_02.nominalBounds.x),// / 100) * scale_percent1, 			//y:(tl.tf_input_f0_02.nominalBounds.y) /// 100) * scale_percent1		//};			//console.log("left:", s.style.left, "top:", s.style.top)	console.log("left:", startPos.x, "top:", startPos.y)	console.log("left:", tl.tf_input_f0_02.nominalBounds.x, "top:", tl.tf_input_f0_02.nominalBounds.y)	console.log("left:", tl.tf_input_f0_02.x, "top:", tl.tf_input_f0_02.y)	console.log(	"left:",((tl.tf_input_f0_02.x / 100) * scale_percent1), 	"top:", ((tl.tf_input_f0_02.y / 100) * scale_percent1)	)			function updateFont() {			var scale_percent = (canvas.width / tl.startSize.w) * 100;			s.style.fontSize = ((40 / 100) * scale_percent) + "px";			s.style.width = ((startSize.w / 100) * scale_percent) + "px";			s.style.height = ((startSize.h / 100) * scale_percent) + "px";			var left = ((startPos.x / 100) * scale_percent);			var top = ((startPos.y / 100) * scale_percent);			//s.style.left = left;			//s.style.top = top;			s.style.transform = "matrix(0.5, 0, 0, 0.5, "+left+", "+top+")";		}				log("the style:", s.style)		console.log("input text:", s)			}, 200);