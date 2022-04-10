Hey there! I have a use case for multi-drag on a single object.(Excellent work btw, I love the project!)In an app I'm working on, the user drags "paper cutouts" (physics sprites) around the screen. I use spring constraints to perform the actual drag, which gives a sense of weight to the sprites and feels more genuine, as if you were dragging them across a tabletop by hand. It is natural for the user to use two fingers at once to drag a single object so they get better control over how the sprite rolls as they drag it.I've forked the code to re-enable multi-drag on a single object (reverting #3767), which works well, but the dragend event doesn't fire for the second (and subsequent) drags. This is due to the single-drag architecture in src/input/InputPlugin.js. Needs more work.My question is, do you think it would be worthwhile for me to submit a PR to support multi-drag? Do other people need it?As it would be a behavioural (and potentially breaking) change, I would make it configurable per-object.So the proposed PR would do the following:Add a new opt-in option to enable multi-drag per-object (e.g. stickerSprite.setInteractive({ draggable: true, multiDrag: true })Modify src/input/InputPlugin.js to respect this setting when managing drag states.