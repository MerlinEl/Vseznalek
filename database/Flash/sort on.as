class User {    public var name:String;    public var age:Number;    public function User(name:String, age:uint) {        this.name = name;        this.age = age;    }    public function toString():String {        return this.name + ":" + this.age;    }}var users:Array = new Array();users.push(new User("Bob", 3));users.push(new User("barb", 35));users.push(new User("abcd", 3));users.push(new User("catchy", 4));trace(users); // Bob:3,barb:35,abcd:3,catchy:4users.sortOn("name");trace(users); // Bob:3,abcd:3,barb:35,catchy:4users.sortOn("name", Array.CASEINSENSITIVE);trace(users); // abcd:3,barb:35,Bob:3,catchy:4users.sortOn("name", Array.CASEINSENSITIVE | Array.DESCENDING);trace(users); // catchy:4,Bob:3,barb:35,abcd:3users.sortOn("age");trace(users); // abcd:3,Bob:3,barb:35,catchy:4users.sortOn("age", Array.NUMERIC);trace(users); // Bob:3,abcd:3,catchy:4,barb:35users.sortOn("age", Array.DESCENDING | Array.NUMERIC);trace(users); // barb:35,catchy:4,Bob:3,abcd:3var indices:Array = users.sortOn("age", Array.NUMERIC | Array.RETURNINDEXEDARRAY);var index:uint;for(var i:uint = 0; i < indices.length; i++) {    index = indices[i];    trace(users[index].name, ": " + users[index].age);}// Results:// Bob : 3// abcd : 3// catchy : 4// barb : 35const sortOn = require('sort-on-as3');sortOn.extend(Array); // add `sortOn` to Array prototype const people = [  { name: 'Andreas',  age: 45 },  { name: 'Matthias', age: 29 },  { name: 'Steve',    age: 29 }]; people.sortOn(['age', 'name']);console.log(people); // Output://  { name: 'Matthias', age: 29 },//  { name: 'Steve',    age: 29 },//  { name: 'Andreas',  age: 45 }