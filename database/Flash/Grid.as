		private function createBoard(source:MovieClip, posx:Number,posy:Number,rows:Number,columns:Number,size:Number, offset:Number):void{			for(var row_cnt = 0; row_cnt < rows; row_cnt++) {					for(var col_cnt = 0; col_cnt < columns; col_cnt++) {									var mc = cloneObject(source);					mc.width = mc.height = size;					mc.x = posx + (col_cnt*size) * offset;					mc.y = posy + (row_cnt*size) * offset;					mc.name = "carda_01"					parent.addChild(mc);				}			}		};createBoard(mc, x-width/2+box_size/2, y-height/2+box_size/2+10, 2, box_limit, box_size, 1.1)