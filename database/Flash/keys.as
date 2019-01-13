function getLayerKeyframes(layer) {
        var keyframes = [];
        var frames = layer.frames;
        var frame;
        for (var i=0; i<frames.length; i++) {
                frame = frame;
                //fl.trace(i +' '+ frame.startFrame);
                if (frame.startFrame === i) {
                        //frame.elements, frame.elements.length, frame.elements[0].name, frame.elements[0].instanceType
                        //Get all Keyframes including empty ones
                        keyframes.push(frame);
                }
        }
        //ignore layers that only have empty keyframes
        if (keyframes.length === 1) { //TODO: verify at least one entity between all keyframes
                frame = keyframes[0];
                if (!frame.elements || frame.elements.length === 0) {
                        return [];
                }
        }
        return keyframes;
}



