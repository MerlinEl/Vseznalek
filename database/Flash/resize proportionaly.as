function resize(mc:MovieClip, maxDimension:int):MovieClip{            //already under the maxDimension            if (mc.width <= maxDimension && mc.width <= maxDimension)                return mc;            else            {                var divisor = ( mc.width >= mc.height) ? mc.width / maxDimension : mc.height / maxDimension;                mc.width = Math.floor(mc.width / divisor);                mc.height = Math.floor(mc.height / divisor);            }	return mc;}		private function fitToContainer(cardTM, cageTM, offset:Number = 0):void {						var scale:Number = Math.min((cageTM.w - offset) / cardTM.w, (cageTM._h - offset) / cardTM.h);			cardTM.w *= scale;			cardTM.h *= scale;		}