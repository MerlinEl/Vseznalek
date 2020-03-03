-------------------------------------------------------------
Adding a Method to an Object
-------------------------------------------------------------
myFather.name = function () {
  return this.firstName + " " + this.lastName;
};
-------------------------------------------------------------
Adding a Property to a Constructor
-------------------------------------------------------------
function Person(first, last, age, eyecolor) {
  this.firstName = first;
  this.lastName = last;
  this.age = age;
  this.eyeColor = eyecolor;
  this.nationality = "English";
}
Person.nationality = "English";
-------------------------------------------------------------
Adding a Method to a Constructor
-------------------------------------------------------------
function Person(first, last, age, eyecolor) {
  this.firstName = first;
  this.lastName = last;
  this.age = age;
  this.eyeColor = eyecolor;
  this.name = function() {return this.firstName + " " + this.lastName;};
  this.changeName = function (name) {
    this.lastName = name;
  };
}
myMother.changeName("Doe");
-------------------------------------------------------------
Built-in JavaScript Constructors
-------------------------------------------------------------
var x1 = new Object();    // A new Object object
var x2 = new String();    // A new String object
var x3 = new Number();    // A new Number object
var x4 = new Boolean();   // A new Boolean object
var x5 = new Array();     // A new Array object
var x6 = new RegExp();    // A new RegExp object
var x7 = new Function();  // A new Function object
var x8 = new Date();      // A new Date object
-------------------------------------------------------------
JavaScript Getter (The get Keyword)
-------------------------------------------------------------
// Create an object:
var person = {
  firstName: "John",
  lastName : "Doe",
  language : "en",
  get lang() {
    return this.language;
  }
};
// Display data from the object using a getter:
document.getElementById("demo").innerHTML = person.lang;
-------------------------------------------------------------
JavaScript Setter (The set Keyword)
-------------------------------------------------------------
var person = {
  firstName: "John",
  lastName : "Doe",
  language : "",
  set lang(lang) {
    this.language = lang;
  }
};
// Set an object property using a setter:
person.lang = "en";
// Display data from the object:
document.getElementById("demo").innerHTML = person.language;
-------------------------------------------------------------
Object.defineProperty()
-------------------------------------------------------------
// Define object
var obj = {counter : 0};

// Define setters
Object.defineProperty(obj, "reset", {
  get : function () {this.counter = 0;}
});
Object.defineProperty(obj, "increment", {
  get : function () {this.counter++;}
});
Object.defineProperty(obj, "decrement", {
  get : function () {this.counter--;}
});
Object.defineProperty(obj, "add", {
  set : function (value) {this.counter += value;}
});
Object.defineProperty(obj, "subtract", {
  set : function (value) {this.counter -= value;}
});

// Play with the counter:
obj.reset;
obj.add = 5;
obj.subtract = 1;
obj.increment;
obj.decrement;
-------------------------------------------------------------
Sorting
-------------------------------------------------------------
//Modify original array.
Array.prototype.sortBy = function(p) {
	this.sort(function(a,b){
		return (a[p] > b[p]) ? 1 : (a[p] < b[p]) ? -1 : 0;
	});
}
//Not modify original array.
Array.prototype.sortBy = function(p) {
  return this.slice(0).sort(function(a,b) {
    return (a[p] > b[p]) ? 1 : (a[p] < b[p]) ? -1 : 0;
  });
}
objs = [{age:44,name:'vinay'},{age:24,name:'deepak'},{age:74,name:'suresh'}];

objs.sortBy('age');
// Returns
// [{"age":24,"name":"deepak"},{"age":44,"name":"vinay"},{"age":74,"name":"suresh"}]

objs.sortBy('name');
// Returns
// [{"age":24,"name":"deepak"},{"age":74,"name":"suresh"},{"age":44,"name":"vinay"}]
-------------------------------------------------------------
function compare( a, b ) {
  if ( a.last_nom < b.last_nom ){
    return -1;
  }
  if ( a.last_nom > b.last_nom ){
    return 1;
  }
  return 0;
}
objs.sort( compare );
-------------------------------------------------------------
objs.sort((a,b) => (a.last_nom > b.last_nom) ? 1 : ((b.last_nom > a.last_nom) ? -1 : 0)); 
-------------------------------------------------------------
var objs = [ 
  { first_nom: 'Lazslo',last_nom: 'Jamf' },
  { first_nom: 'Pig', last_nom: 'Bodine'  },
  { first_nom: 'Pirate', last_nom: 'Prentice' }
];

var sortedObjs = _.sortBy( objs, 'first_nom' );
-------------------------------------------------------------
function dynamicSort(property) {
    var sortOrder = 1;
    if(property[0] === "-") {
        sortOrder = -1;
        property = property.substr(1);
    }
    return function (a,b) {
        /* next line works with strings and numbers, 
         * and you may want to customize it to your needs
         */
        var result = (a[property] < b[property]) ? -1 : (a[property] > b[property]) ? 1 : 0;
        return result * sortOrder;
    }
}

var People = [
    {Name: "Name", Surname: "Surname"},
    {Name:"AAA", Surname:"ZZZ"},
    {Name: "Name", Surname: "AAA"}
];


People.sort(dynamicSort("Name"));
People.sort(dynamicSort("Surname"));
People.sort(dynamicSort("-Surname"));
-------------------------------------------------------------
/**
 * @description
 * Returns a function which will sort an
 * array of objects by the given key.
 *
 * @param  {String}  key
 * @param  {Boolean} reverse
 * @return {Function}
 */
const sortBy = (key, reverse) => {

  // Move smaller items towards the front
  // or back of the array depending on if
  // we want to sort the array in reverse
  // order or not.
  const moveSmaller = reverse ? 1 : -1;

  // Move larger items towards the front
  // or back of the array depending on if
  // we want to sort the array in reverse
  // order or not.
  const moveLarger = reverse ? -1 : 1;

  /**
   * @param  {*} a
   * @param  {*} b
   * @return {Number}
   */
  return (a, b) => {
    if (a[key] < b[key]) {
      return moveSmaller;
    }
    if (a[key] > b[key]) {
      return moveLarger;
    }
    return 0;
  };
};
-------------------------------------------------------------
Get Object's prototype
-------------------------------------------------------------
function Student() {
    this.name = 'John';
    this.gender = 'M';
}

var studObj = new Student();

Student.prototype.sayHi= function(){
    alert("Hi");
};

var studObj1 = new Student();
var proto = Object.getPrototypeOf(studObj1);  // returns Student's prototype object
            
alert(proto.constructor); // returns Student function 
-------------------------------------------------------------
-------------------------------------------------------------

-------------------------------------------------------------
Array Prototyping
-------------------------------------------------------------

let items = [
    {name: 'books', quantity: 2},
    {name: 'movies', quantity: 1},
    {name: 'games', quantity: 5}
];

function findMovies(item) { 
    return item.name === 'movies';
}

console.log(items.find(findMovies));

// Output
//  { name: 'movies', quantity: 1 }




function showInfo(element, index, array) {
  console.log('element = ' + element + ', index = ' + index + ', array = ' + array);
  return false;
}

console.log('return = ' + [4, 6, 8, 12].find(showInfo));