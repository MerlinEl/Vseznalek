//https://transfonter.org///<link href="stylesheet.css" rel="stylesheet">//<link rel="preload" href="Graphik-Semibold.ttf" as="font" type="font/ttf" crossorigin>log(document)var newlink = document.createElement('link');newlink.innerHTML = 'Graphik';newlink.setAttribute('type', 'text/css');newlink.setAttribute('rel', 'stylesheet');newlink.setAttribute('href', './fonts/stylesheet.css');document.body.appendChild(newlink);document.fonts.load('10pt "Graphik"').then(renderText);function renderText() {		log('done')}var wl = window.location;var cs_url = wl.port.length > 0 ? wl.origin + "/index.css" : wl.href + "index.css"log("cs_url:", cs_url)var loader = new createjs.FontLoader(cs_url, true);loader.on("complete", handleLoad);loader.load();function handleLoad() {	log("font Graphik was loaded!")	//var div = document.createElement("div");	//div.className = "resultItem";	//div.innerHTML = "COMPLETE";	//result.appendChild(div);}