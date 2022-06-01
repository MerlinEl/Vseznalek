// shuffle(arr); // shuffles the items in the specified array. Modifies the original array.
		// arr2 = shuffle(arr1.slice()); // to get a new shuffled array w/o modifying original.
		// no allocations or array resizing.
		public static function shuffle(array:Array):Array {
			var l:uint = array.length;
			for (var i:uint=0; i<l; i++) {
				var j:uint = l*random()|0;
				if (j==i) { continue; }
				var item:* = array[j];
				array[j] = array[i];
				array[i] = item;
			}
			return array;
		}
		// boolean(0.8); // returns true or false (80% chance of true)
		public static function boolean(chance:Number=0.5):Boolean {
			return (random() < chance);
		}
		// bit(0.8); // returns 1 or 0 (80% chance of 1)
		public static function bit(chance:Number=0.5):int {
			return (random() < chance) ? 1 : 0;
		}