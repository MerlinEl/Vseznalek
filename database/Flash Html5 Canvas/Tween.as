var rainbow = this.rainbow_01;rainbow.animate = function(val){		var slot = this.getChildAt(0);	slot.children.forEach(function(ring, index) {				var angle = ring.negative ? -val : val;		createjs.Tween.get(ring, {loop: -1, bounce: true}, true)			.to({rotation: angle}, 3000)	});};rainbow.animate(45);rainbow.animate = function(){		var slot = this.getChildAt(0);	slot.children.forEach(function(ring, index) {				ring.rotation += ring.rotation + ring.step === 360 ? ring.rotation = 0 : ring.step;	});};	createjs.Ticker.setFPS(24);	createjs.Ticker.addEventListener("tick", tick);	function tick(e) {				rainbow.animate();		//stage.update();	}