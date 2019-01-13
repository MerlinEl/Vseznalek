Availability: ActionScript 1.0; Flash Player 5 - Array sorting option added in Flash Player 7.

Parameters

compareFunction: Object [optional] - A comparison function used to determine the sorting order of elements in an array. Given the elements A and B, the result of compareFunction can have one of the following three values:

    -1, if A should appear before B in the sorted sequence
    0, if A equals B
    1, if A should appear after B in the sorted sequence

options: Number [optional] - One or more numbers or names of defined constants, separated by the | (bitwise OR) operator, that change the behavior of the sort from the default. The following values are acceptable for the options parameter:

    Array.CASEINSENSITIVE or 1
    Array.DESCENDING or 2
    Array.UNIQUESORT or 4
    Array.RETURNINDEXEDARRAY or 8
    Array.NUMERIC or 16


//sort from highest to lowest 
array.sort(Array.DESCENDING | Array.NUMERIC) 
//sort from lowest to highest 
array.sort(Array.NUMERIC)


function debugArray(arr){

	for each (o in arr) debugObject(o);
}
function debugObject(obj){
        fl.trace(obj+" {\n");
        for (var i in obj){
			
			var o = obj[i];
			var n = o.name != undefined ? o.name : o
			fl.trace("	"+i+": "+n);
        }
        fl.trace("}\n-----");
}
function sortByX(a, b) {
    if (a.x < b.x) return -1;
    else if (a.x > b.x) return 1;
    return 0;
}

card_array.sortOn(["y"], Array.DESCENDING | Array.NUMERIC);
card_array = card_array.shift(); //remove first object from input array

´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´
var highscores:Array = new Array();
highscores.push({score: 827, player: "John"});
highscores.push({score: 918, player: "Harry"});
highscores.sortOn("score", Array.DESCENDING | Array.NUMERIC);

for (var i:int = 0; i < highscores.length; i++)
{
    trace(highscores[i].score, highscores[i].player);
}
´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´
function sortObjectsInX() {

	var data_array = new Array;
	for (var i=0; i<sel.length; i++){
	
		var o = sel[i];
		data_array.push({obj:o, name:o.name, index:i+1, pos:[o.x, o.y]})
		debug(data_array[i])
	}
	sel.sort(sortByX); //sort objects by x pos
	debug(sel)
	//move objects by index
	for each (d in data_array){d.obj.x = sel.x};
	
}
´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´

/**
* Optimized Array sortOn method, for sorting Arrays by child property. This function modifies the input Array
* @param        {Array}                arr                        An Array of Objects
* @param        {String}        prop                A property name to sort on; defaults to 'name'
* @param        {Boolean}        alpha                An optional flag to sort alphabetically
* @returns      {Array}                                        The sorted Array)
*/
sortOn:function(arr, prop, alpha)
{
	function swap(arr, a, b)
	{
			var tmp = arr[a];
			arr[a] = arr[b];
			arr[b] = tmp;
	}

	function partition(array, begin, end, pivot)
	{
			var piv = alpha ? String(array[pivot][prop]).toLowerCase() : array[pivot][prop];
			swap(array, pivot, end - 1);
			var store = begin;
			var ix;
			for(ix = begin; ix < end - 1; ++ix)
			{
					if((alpha ? String(array[ix][prop]).toLowerCase() : array[ix][prop]) <= piv)
					{
							swap(array, store, ix);
							++store;
					}
			}
			swap(array, end - 1, store);

			return store;
	}

	function qsort(array, begin, end)
	{
			if(end - 1 > begin)
			{
					var pivot        = begin + Math.floor(Math.random() * (end - begin));
					pivot                = partition(array, begin, end, pivot);
					qsort(array, begin, pivot);
					qsort(array, pivot + 1, end);
			}
	}

	prop = prop || 'name';
	qsort(arr, 0, arr.length);
	return arr;
},