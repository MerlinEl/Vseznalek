		private function snapToDropField(cage:MovieClip, card:MovieClip):void{		card.console.text = "x:"+cage.mouseX+" y:"+cage.mouseY;						var field:MovieClip = getClosestField(cage, card)			trace("ClosestField:"+field.name+" at x:"+cage.mouseX+" y:"+cage.mouseY);			GLF.scale(card, new Point(0.8, 0.8));			GLF.pos(card, field.start_pos);						//var targets:Array = cage.getObjectsUnderPoint(new Point(mouseX, mouseY));//GLF.pos(card)			//trace("targets at pos:"+targets);			//traceObjs(targets)		}		private function getClosestField(cage:MovieClip, card:MovieClip):MovieClip{					var fields:Array = GLF.getMovielipsByNamePart(cage, "drop_field_");			var distances:Array = new Array();			for each (var f in fields) {							distances.push({"dist":GLF.getDistance2P(new Point(cage.mouseX, cage.mouseY) , f.start_pos), "obj":f});			}			distances.sortOn("dist");			return distances[0].obj;		};