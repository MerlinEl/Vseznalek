var count = 0;            var me = this;// get this here            points.forEach(function(item){                var one = game.add.text(item.centerX, item.centerY, count, this.style);                one.anchor.setTo(0.5)                one.inputEnabled = true;                one.input.enableDrag();                one.input.startDrag(game.input.activePointer);                one.events.onInputDown.add(me.clone, this, 0, one); // now call the function                one.events.onDragStop.add(me.fixLocation);                count++;            })