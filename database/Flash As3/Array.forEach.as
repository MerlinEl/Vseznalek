		private function removeOldCards():void {						var cards:Array = mcCollect.byCondition(this, "prefix", "card");			cards.forEach(function(card:CloneCard, index:int, array:Array) {								card.wipe();			});		}loop: {	strs.forEach(function(item:String,index:int,arr:Array):void{		trace(item);		if("C"==item) break loop;	// break Cíl příkazu nebyl nalezen.	});}//Avar cards_set_1:Array = card_sets.collectItemsByValue("set", 1);cards_set_1.forEach(addUniqueFraction)function addUniqueFraction(element:FractionCard, index:int, array:Array):void {		ftrace("element: % index: % array: %", element, index, array)}	//Bvar square_ranges:Array = mcMath.numbersInRange(square_range[0], square_range[1], "all", square_range[2]); square_ranges.forEach(function (num:Number, index:int, array:Array) { 					array[index] = Math.pow(num, 2); });//Prototypeif (!Array.prototype.forEach) {  Array.prototype.forEach = function(callback, thisArg) {    var T;    if (this === null) {      trace(' this is null or not defined');	  return;    }    var O = Object(this);    var len = O.length >>> 0;    if (typeof callback !== "function") {      trace(callback + ' is not a function');	  return;    }    if (arguments.length > 1) {      T = thisArg;    }    var k:int = 0;    while (k < len) {	      var kValue;      if (k in O) {        kValue = O[k];        callback.call(T, kValue, k, O);      }      k++;    }  }}