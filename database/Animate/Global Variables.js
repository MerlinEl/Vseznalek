//canvas, stage, exportRoot, anim_container, dom_overlay_container, fnStartAnimation;var comp=AdobeAn.getComposition("7F539059DEDBBE4CA50B3B07472310DF");console.log("canvas", canvas)console.log("anim_container", anim_container)console.log("dom_overlay_container", dom_overlay_container)console.log("comp", comp)console.log("lib", lib)var loader = new createjs.LoadQueue(false);loader.addEventListener("fileload", function(evt){handleFileLoad(evt,comp)});loader.addEventListener("complete", function(evt){handleComplete(evt,comp)});loader.loadManifest(lib.properties.manifest);function handleFileLoad(evt, comp) {	var images=comp.getImages();		if (evt && (evt.item.type == "image")) { images[evt.item.id] = evt.result; }	}function handleComplete(evt,comp) {}