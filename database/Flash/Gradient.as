   this.createEmptyMovieClip("mc1", this.getNextHighestDepth());    this.createEmptyMovieClip("mc2", this.getNextHighestDepth());    this.blendMode="layer";    this.createTextField("blendLabel", this.getNextHighestDepth(), 50, 150, 100, 100)        fillClip(mc1, 0x00AA00, 0x22FFFF, 100, 100)    fillClip(mc2, 0xFF0000, 0x2211FF, 100, 50)    mc2._x = 33;    mc2._y = 33;        var blendModeIndex = 0;        setInterval(changeBlendMode, 1000);    function changeBlendMode()     {        mc2.blendMode = blendModeIndex % 14 + 1 ;            // values 1 - 14    blendLabel.text = (blendModeIndex% 14 + 1) + ": " + mc2.blendMode;        blendModeIndex++;    }        function fillClip(mc:MovieClip, color1:Number, color2:Number,                alpha1:Number, alpha2: Number) {        matrix = {a:100, b:0, c:0, d:0, e:100, f:0, g:50, h:20, i:1};        mc.beginGradientFill("linear", [color1, color2], [alpha1, alpha2], [0, 0xFF], matrix);        mc.lineStyle(8,0x888888,100)        mc.moveTo(0, 0);        mc.lineTo(0, 100);        mc.lineTo(100, 100);        mc.lineTo(100, 0);        mc.lineTo(0, 0);        mc.endFill();    }