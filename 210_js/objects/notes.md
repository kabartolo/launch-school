# 210: Computational Thinking and Javascript Programming

## Objects

* [Basics](#basics)
* [Creating Objects](#creating-objects)
* [Properties](#properties)
* [Methods](#methods)
* [Arithmetic and Comparison Operators](#arithmetic-comparison-operators)
* [Mutability of Values and Objects](#mutability)
* [Pure Functions and Side Effects](#pure-functions-side-effects)

<a name="basics"></a>
### Basics

* Javascript is object-oriented
* Data values and the functions that operate on those values are part of the same object (typically)
* Some built-in objects are `Array`, `String`, `Object`, `Math`, and `Date`.
* Objects are a collection type. A single Object can store multiple values.
* Objects are reference values (they are passed by reference and compared by reference).
* Each object has its own place in memory.

```javascript
// This calls the method toUpperCase on the built-in String object
'hi'.toUpperCase(); // 'HI'
```

* When you apply a method to a primitive, Javascript automatically converts it to an object.

```javascript
var a = 'hi';                      // Create a primitive string with value "hi"
typeof a;                          // "string", this is a primitive string value

var stringObject = new String(a);  // Convert the primitive to an object
typeof stringObject;               // "object", this is a String object

stringObject.toUpperCase();        // Call the method on the object: "HI"

var b = a.toUpperCase();
typeof b;                          // "string"
```

<a name="creating-objects"></a>
### Creating Objects
```javascript
// Using object literal notation:
var colors = {
  red: '#f00',
  orange: '#ff0',
};          

typeof colors;      // "object"
colors.red;         // "#f00"
colors.orange;      // "#ff0"
```

<a name="properties"></a>
### Properties

* Properties are the associations between named items and their values (which represent the attributes of the object).
* Use dot notation or bracket notation to get the value of an object property. Use dot notation when possible.
* A property name can be any valid string, and a property value can be any valid expression.
* Use the reserved keyword `delete` to delete properties from objects.
* Use a `for... in` loop to step through Object properties. Get all object properties with `Object.keys()`


```javascript
// Accessing property values
var animal = 'turtle';
animal.length;          // 9

var colors = {
  red: '#f00',
  orange: '#ff0',
};

colors.red;             // "#f00"

'blue'.length;          // 4 - works with primitives too

var object = {
  a: 'hello',
  b: 'world',
};

// Different notation types
object.a;                 // "hello", dot notation
object['b'];              // "world", bracket notation
object.c;                 // undefined when property is not defined

var foo = {
  a: 1,
  good: true,
  'a name': 'hello',
  person: {
    name: 'Jane',
    gender: 'female',
  },
  c: function () {        // function expression as property value
    return 2;
  },
};

var name = 'a';
foo[name];                // 1, use bracket notation for variables representing property names
foo['a name'];            // "hello", use bracket notation when property name is an invalid identifier
foo['goo' + 'd'];         // true, bracket notation can take expressions
var a = 'a';
foo[a];                   // 1, bracket notation works with variables since they are expressions
foo.person.name;          // "Jane", dot notation can be chained to "dig into" nested objects
foo.c();                  // 2, Call the method 'c'
```

```javascript
// Assigning property values
var count = [0, 1, 2, 3, 4];
count.length = 2;

var colors = {
  red: '#f00',
  orange: '#ff0',
};

colors.blue = '#00f';

// Different notation types
var object = {};              // empty object

object.a = 'hello';
object.a;                     // "hello"

object.a = 'foo';
object.a;                     // "foo" (updates the existing value)

object['a name'] = 'hello';
object['a name'];             // "hello"

object;                       // { a: "foo", "a name": "hello" }

// Delete a property
var foo = {
  a: 'hello',
  b: 'world',
};

delete foo.a;
foo;                          // { b: "world" }

```

```javascript
// Property names and values
var object = {
  a: 1,                           // a is a string with quotes omitted
  'foo': 2 + 1,                   // property name with quotes
  'two words': 'this works too',  // a two word string
  true: true,                     // property name is implicitly converted to string "true"
  b: {                            // object as property value
    name: 'Jane',
    gender: 'female',
  },
  c: function () {                // function expression as property value
    return 2;
  },
};
```

```javascript
// Looping through Object properties
var nick;

var nicknames = {
  joseph: 'Joey',
  margaret: 'Maggie',
};

for (nick in nicknames) {
  console.log(nick);
  console.log(nicknames[nick]);
}

// logs on the console:
joseph
Joey
margaret
Maggie

Object.keys(nicknames);  // [ 'joseph', 'margaret' ]
```

<a name="methods"></a>
### Methods

* Functions define the behavior of an object.
* Functions are called methods when they are part of an object.
* Since a method is a property of the object, you access it using dot notation and call it by appending parentheses.

```javascript
(5.234).toString();       // "5.234"
'pizza'.match(/z/);       // [ "z", index: 2, input: "pizza" ]
Math.ceil(8.675309);      // 9
Date.now();               // 1467918983610
```

```javascript
// Use a trailing comma in a multi-line list of properties
var myObj = {
  prop1: 'sample data',
  method1: function () {},
  prop2: 'sample data',
};

var myObj = {
  prop1: 'sample data',
  prop2: 'sample data',
  method1: function () {},
};
```

<a name="arrays-vs-objects"></a>
### Arrays vs. Objects

* Use an array if the data is more like a list that contains many items and/or if you need to maintain a specific order.
  * Add, retrieve, modify, remove, iterate over elements ("walk the list")
* Use an object if the data is more like an entity with many parts and you need to access values based on the names of those values.
  * Keyed access: use a key value to add, retrieve, modify, or delete a data item.
  * An object can also be called an associative array since each key is associated with a specific datum.

* Arrays are actually objects.
* Accessing values in an array uses object bracket notation.
* Each index is actually a key.

```javascript
var a = ['hello', 'world'];

console.log(typeof a);        // "object"
console.log(a['1']);          // "world", object's bracket notation to access value
console.log(Object.keys(a));  // ["0", "1"], the keys of the object!

// line 1 is equivalent to:

var a = {
  '0': 'hello',
  '1': 'world',
};

console.log(typeof a);        // "object"
console.log(a['1']);          // "world", object's bracket notation to access value
console.log(Object.keys(a));  // ["0", "1"], the keys of the object!

```

**For more information, see ../Arrays/nodes.md**

<a name="arithmetic-comparison-operators"></a>
### Arithmetic and Comparison Operators

* The arithmetic and comparison operators are not useful with objects and often lead to surprising results. When one operand is an object and the other is not, Javascript typically coerces the object to the string `'[object Object]'`. 

```javascript
[] + {};                  // "[object Object]" -- becomes "" + "[object Object]"
[] - {};                  // NaN -- becomes "" - "[object Object]", then 0 - NaN
'[object Object]' == {};  // true
'' == {};                 // false
false == {};              // false
0 == {};                  // false
```

* However, Javascript interprets an object literal in certain contexts (such as at the beginning of a line) as a block of code instead of as an object:
```javascript
{} + [];                  // 0 -- becomes +[]
{}[0];                    // [0] -- the object is ignored, so the array [0] is returned
{ foo: 'bar' }['foo'];    // ["foo"]
{} == '[object Object]';  // SyntaxError: Unexpected token ==
```

* Two objects are considered equal by the `==` and `===` operators only if they are the same object.
* This is because objects are reference values and are compared by their reference (vs primitives, which are compared by value).
```javascript
var a = {};
var b = a;
a == a;                   // true
a == b;                   // true
a === b;                  // true
a == {};                  // false
a === {};                 // false
```

<a name="mutability"></a>
### Mutability of Values and Objects

* Primitive values are immutable. Operations on these values return a new value of the same type.
* Objects are mutable. Their identity remains the same while their data can be changed.
* Objects are reference values (they are passed by reference).

```javascript
var alpha = 'abcde'; // the variable references an immutable string
alpha[0] = 'z';      // "z" (new string created then lost)
alpha;               // "abcde"

alpha = ['a', 'b', 'c', 'd', 'e']; // the variable references an array (an object that can be modified)
                                   // the array in turn holds references to five Strings
alpha[0] = 'z';                    // "z"
alpha;                             // ["z", "b", "c", "d", "e"]

// The identity of the array is the same, but the elements change.
// Element 0 (the `0` property of `alpha`) now points to a new String.
// The old value will be garbage collected.
```

* In the following code, calling `replace` on a String returns a new String with a different value. The local variable `message` is not modified.
```javascript
function lessExcitable(text) {
  return text.replace(/!+/g, '.');  // replaces ! with .
}

var message = 'Hello!';
lessExcitable(message);             // "Hello."
message;                            // "Hello!"
```

* Consider also:
```javascript
function push(array, value) {
  array[array.length] = value;
  return array.length;
}

var numbers = [1, 6, 27, 34];
push(numbers, 92);                  // 5
numbers;                            // [ 1, 6, 27, 34, 92 ], the original array, modified
```

* Note: The object is stored in the heap and has a memory address. Each new variable assigned to an object is really creating or copying a pointer to a place in memory where the object is. Changes can be made to the object itself and the reference remains the same.
```                                             
                                             Stack
employee1 = { name: 'Max', age: 28 } --> employee1Pointer --> {name:'Max',age:28}
employee2 = employee1 -----------------> employee2Pointer ---^
```
* The **reference** to the object here is copied and added to the stack (primitive values are added directly).

```javascript
var name = 'Max';
console.log(name);     // "Max", new string

var secondName = name;
console.log(secondName); // "Max", new string

console.log(name === secondName);  true (value equality, not object equality)

name = 'Chris';
console.log(secondName); // "Max"

console.log(name === secondName);  false

// BUT

var person = {
  age: 28,
  name: 'Max',
  hobbies: ['Sports', 'Cooking'],
};
console.log(person);

// logs:
// [object Object] {
//  age: 28,
//  name: 'Max',
//  hobbies: ['Sports', 'Cooking']
// }

var secondPerson = person;
console.log(secondPerson);

// logs same as above

person.name = 'Chris';
console.log(secondPerson);

// logs
// [object Object] {
//  age: 28,
//  name: 'Chris',
//  hobbies: ['Sports', 'Cooking']
// }

console.log(person === secondPerson);    // true (object equality)

```



<a name="pure-functions-side-effects"></a>
### Pure Functions and Side Effects

* A side effect occurs when a function modifies an external value, in an outer scope or passed to the function as an argument. 
* A function without side effects is called a **pure function**. 
  * A pure function relies only on its arguments to determine its return value. 
  * Given the same argument value(s), it always evaluates to the same result.
  * It always returns a value (otherwise, if it has no side effects and no return value, it would do nothing).

```javascript
// Pure function
function add(a, b) {
  return a + b;
}
```

```javascript
// Not pure functions

// Side effects
var sum = 0;
function add(a, b) {
  sum = a + b;
}

// Does not return the same result given the same argument(s)
var currentTotal = 0;
function addToTotal(num) {
  return currentTotal + num;
}

addToTotal(5);      // returns 5

currentTotal = 5;

addToTotal(5);      // returns 10
```

#### Pure Function Return Value vs. Non-Pure Function Side EFfects
```javascript
function joinString(a, b, c) {
  return a.concat(b, c);
}

var result = joinString('hello,', ' ', 'world!');
console.log(result);             // logs "hello, world!"
```

* You would expect the above function to have no side effects, as it captures and uses the return value.
* To use a function for side effect, pass the variable(s) to be mutated as argument(s). 
```javascript
// Instead of mutating the friends array in the function, the function explicitly mutates the array passed as an argument.
var friends = ['Joe', 'Mary', 'David'];

function removeElement(array, element) {
  var i;
  for (i = 0; i < array.length; i += 1) {
    if (array[i] === element) {
      array.splice(i, 1);
    }
  }
}

removeElement(friends, 'David');     // undefined
friends;                             // ["Joe", "Mary"]

```

* A pure version of the above function. 
* Note that to better show intent. you should reassign the friends variable to the new array returned by removeElement.
```javascript
var friends = ['Joe', 'Mary', 'David'];

function removeElement(array, element) {
  var newArray = [];
  var i;
  for (i = 0; i < array.length; i += 1) {
    if (array[i] !== element) {
      newArray.push(array[i]);
    }
  }

  return newArray;
}

removeElement(friends, 'David');    // ["Joe", "Mary"]
friends;                            // ["Joe", "Mary", "David"]

// better
friends = removeElement(friends, 'David');
friends;                            // ["Joe", "Mary"]
```