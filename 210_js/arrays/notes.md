# 210: Computational Thinking and Javascript Programming

## Arrays

* [Basics](#basics)
* [Iterating Through an Array](#iterating)
* [Accessing, Modifying, and Detecting Values](#accessing)
* [Arrays Are Objects](#arrays-are-objects)
* [Array Operations](#array-operations)
* [Arithmetic Operations on Arrays](#arithmetic-operations)
* [Comparison Operators](#comparison-operators)
* [The Array Length Property](#length)
* [Using Object Operations with Arrays](#object-operations)
* [Warnings](#warnings)

<a name="basics"></a>
### Basics

* Arrays are the basic collection type in Javascript, indexed by non-negative integer values starting from 0.
* The sequence of elements may or may not be important.
* Bracket notation is an **operator** (for Strings and Objects), not a method.

```javascript
// Non-verbose Array construction:
[]
[0, 1, 2]
[42, 'hello', false, [3, 5]]

// Verbose Array construction:
new Array(1, 2, 3);
```

* Recall that when passing an object (e.g., an array), **the value is the *reference* to the object**.

```javascript
var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray); // [1, 2, 3]

myArray = [1, 2];
console.log(myOtherArray); // [1, 2, 3]
```

In the above, the variable `myOtherArray` is assigned to the same value that `myArray` references. When `myArray.pop()` is executed, it is executed on the array object itself, which is still referenced by `myOtherArray`. Then, `myArray` is reassigned to a new array object, but `myOtherArray` still references the original array.

<a name="iterating"></a>
### Iterating Through an Array

* The `for` loop can iterate through the elements of an Array.

```javascript
var count = [1, 2, 3, 4, 5];
var i;

for (i = 0; i < count.length; i++) {
  console.log(count[i]);
}

// logs to console:
// 1
// 2
// 3
// 4
// 5
```

* Do not use `for in` with arrays: It does not guarantee the order of the items, and `for in` is used to iterate through the properties of an object (the array object may contain properties other than its indexed elements). Use a for loop to iterate through an array's elements only.

<a name="accessing"></a>
### Accessing, Modifying, and Detecting Values

* The first element in an Array has index 0.
* Access, modify and detect values using bracket notation.
* Add values using the `Array.prototype.push` function.
* If you skip indexes when assigning values to locations in an Array, Javascript inserts undefined in the skipped positions.
* You *cannot* access the last elements of the array using bracket notation and a negative index. The index must be a non-negative integer.

```javascript
var count = [1, 2, 3];

count[0];                // 1
count[-1];               // undefined
count[count.length - 1]  // 3

count[3] = 3;
count;                   // [1, 2, 3, 3]
count.push(5);
count;                   // [1, 2, 3, 3, 5]

count[3] = 4; 
count;                   // [1, 2, 3, 4, 5]

count[6] = 7;
count;                   // [1, 2, 3, 4, 5, undefined, 7]

count[5];                // undefined (index 5 is itself undefined, NOT value at index 5 is undefined)

count;
<!-- 
0:1
1:2
2:3
3:4
4:5
6:7 -->

```

<a name="arrays-are-objects"></a>
### Arrays Are Objects

* Arrays are really Objects: `typeof []; // 'object'`
* To determine whether a value is an Array is tricky. Use `Array.isArray()`.

```javascript
Array.isArray([]);      // true
Array.isArray('array'); // false
```

* We can insert data into an array at a negative index because arrays are objects. The added item becomes part of the array object but is not really one of the array elements (the `length` property will remain the same, for example). 
* Each index is actually a key.
* For this reason, you cannot access array elements by negative index expecting to get values from the end of the array. The `[]` notation is a property accessor for **objects**. If the property does not exist, it returns undefined. 

```javascript
function nthElementOf(arr, index) {
  return arr[index];
}

var digits = [4, 8, 15, 16, 23, 42];

digits[-1] = -42;            // -42
nthElementOf(digits, -1);    // -42
digits[-1];                  // -42
digits['-1'];                // -42; note that we are using a string here

digits[-2];                  // undefined
```

<a name="array-operations"></a>
### Array Operations

#### Push

[Array.prototype.push](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push)

* Adds new value(s) to end of array
* Args: array, value
* Returns: length of new array
* Mutates original array

```javascript
// Can add more than one value to the array
var stringArray = ['a', 'b'];

stringArray.push('c', 'd');
stringArray; // ['a', 'b', 'c', 'd']
```

#### Pop

[Array.prototype.pop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop)

* Removes last item of array and returns it.
* Args: array
* Returns: last item in array (removed from array)
* Mutates original array

#### Unshift

[Array.prototype.unshift](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)

* Adds new value to beginning of array (remaining items shift right)
* Args: array, value
* Returns: length of new array
* Mutates original array

#### Shift

[Array.prototype.shift](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift)

* Removes first item of array and returns it.
* Args: array
* Returns: first item in array (removed from array)
* Mutates original array

#### IndexOf

[Array.prototype.indexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf)

* Args: array, value
* Returns: first index of value in array, searching forwards, or -1 if value is not present in array
* Does not mutate original array
* Uses the strict equality operator (`===`) to compare items.

#### LastIndexOf

[Array.prototype.lastIndexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf)

* Args: array, value
* Returns: last index of value in array, searching backwards, or -1 if value is not present in array
* Does not mutate original array

#### Slice

[Array.prototype.slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice)

* Args: array, start, end
* Returns: new array of values from original array between start index (inclusive) and end index (exclusive)
* Does **not** mutate original array
* **Allows negative values for both arguments**
```javascript
var array = [1, 2, 3];

array.slice(1);    // [2, 3];
array.slice(1, 1); // [];
array.slice(1, 2); // [2];

```

```javascript
var array = [1, 2, 3, 4, 5];
array.slice(2, -1) // [3, 4]
array.slice(-1)    // [5]
```

* Copy an array (this creates a **shallow copy**; the original and copied arrays share the same elements):
```javascript
var array = [1, 2, 3];
var shallowCopy = array.slice(); // [1, 2, 3]
array.pop();
shallowCopy;                     // [1, 2, 3]
```

#### Splice

[Array.prototype.splice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)

* Args: array, start, deleteCount, items
* Returns: new array
* **DOES** mutate original array
* **Allows negative value for first argument**
* If values are given, they will be added to the array from the start index.
* If deleteCount is 0 or negative, no elements are removed.

```javascript
var array = [1, 2, 3];

array.splice(1);    // [2, 3];
array;              // [1];

array = [1, 2, 3];
array.splice(1, 1); // [2];
array;              // [1, 3];

array = [1, 2 ,3];
array.splice(1, 2); // [2, 3];
array;              // [1];

array = [1, 2, 3];
array.splice(0, 0, 4); // [] (nothing removed, 4 added at index 0)
array;                 // [4, 1, 2, 3];
array.splice(0, 1, 0); // [4];
array;                 // [0, 1, 2, 3];

```

```javascript
var array = [1, 2, 3, 4, 5];
array.splice(-2, 1)  // [4]
array.splice(-1)     // [5]
array;               // [1, 2, 3]

```

* Remove an item by index position:
```javascript
var fruits = ["Strawberry", "Banana", "Mango"];
fruits.splice(1, 1); // "Banana"
fruits; // ["Strawberry", "Mango"]
```

#### Concat

[Array.prototype.concat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)

* Args: first array, one or more arrays or other values
* Returns: new array of values from original arrays
* Does not mutate original arrays

#### Join

[Array.prototype.join](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join)

* Args: array, string separator
* Returns: new string of values from array separated by string argument
* Does not mutate original array or string

#### Reverse

[Array.prototype.reverse](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse)

* Args: array
* Returns: reference to original array, elements in reverse order
* Mutates the array in place

#### Sort

[Array.prototype.sort](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort)

* Sort usually gives unexpected results if the items in the array are not strings.
```javascript
var array = [4, 15, 23];
array.sort; // [15, 23, 4], sorted according to Unicode value
```

* Pass a custom function to sort numbers.

<a name="arithmetic-operations"></a>
### Arithmetic Operations on Arrays

* Arithmetic operations do not work on arrays as they do in Ruby. 
* They **convert** arrays to strings before performing the operation.

```javascript
var initials = ['A', 'H', 'E'];
initials + 'B';                   // "A,H,EB"
initials;                         // [ "A", "H", "E" ]
```

```javascript
initials + ['B'];      // "A,H,EB"
initials;              // [ "A", "H", "E" ]
```

```javascript
[1] * 2;              // 2 -- becomes '1' * 2, then 1 * 2
[1, 2] * 2;           // NaN -- becomes '1,2' * 2, then NaN * 2
[5] - 2;              // 3
[5] - [2];            // 3
5 - [2];              // 3
5 - [2, 3];           // NaN -- becomes 5 - '2,3', then 5 - NaN
[] + [];              // '' -- becomes '' + ''
[] - [];              // '' -- becomes '' - '', then 0 - 0
+[];                  // 0
-[];                  // -0
```

**Javascript does NOT produce a warning for these operations.**

<a name="comparison-operators"></a>
### Comparison Operators

* `==` and `===` do not work in the following example because the two arrays are different objects.

```javascript
var friends = ['Bob', 'Josie', 'Sam'];
var enemies = ['Bob', 'Josie', 'Sam'];
friends == enemies;                    // false (value equality in Ruby, returns true)
friends === enemies;                   // false (case equality in Ruby, returns true)
[] == [];                              // false
[] === [];                             // false
```

```javascript
var friends = ['Bob', 'Josie', 'Sam'];
var roommates = friends;
friends == roommates;                  // true
friends === roommates;                 // true
```

* When compared with a non-array using the non-strict equality operator, an array is implicitly coerced into a String before the comparison.

```javascript
[] == '0';               // false -- becomes '' == '0'
[] == 0;                 // true -- becomes '' == 0, then 0 == 0
[] == false;             // true -- becomes '' == false, then 0 == 0
[] == ![];               // true -- same as above
[null] == '';            // true -- becomes '' == ''
[undefined] == false;    // true -- becomes '' == ''
[false] == false;        // false -- becomes 'false' == 0, then NaN == 0
```

** `>`, `>=`, `<`, and `<=` are useless with arrays and objects.**

* To compare the *values* of two different Javascript objects, you must write your own function. For example: 

```javascript
function arraysEqual(array1, array2) {
  var i;

  if (array1.length !== array2.length) {
    return false;
  }

  for (i = 0; i < array1.length; i++) {
    if (array1[i] !== array2[i]) {
      return false;
    }
  }

  return true;
}
```

<a name="length"></a>
### The Array Length Property
* Javascript's built-in Array methods use the `length` property (using and/or setting it).
* `Array.length` is always a non-negative integer less than 2<sup>32</sup> (rougly 4.2 billion)
* Its value is numerically one greater than the largest **array index** in the array. 
* You can change the length of an array by assigning a new value to the `length` property (increasing its size inserts `undefined` in the extra locations, decreasing its size deletes excess elements);

```javascript
var count = [1, 2, 3];

count.length;     // 3

count.length = 10;
count;            // [ 1, 2, 3, undefined x 7 ]
count.length = 2;
count;            // [ 1, 2 ]; excess elements are lost

```

```javascript
var myArray = [];
myArray.length;                  // returns 0

myArray = ['foo', 'bar', 'baz'];
myArray.indexOf('baz');          // returns 2 (this is the largest index)
myArray.length;                  // returns 3
```

* Which elements of the array object are array indexes, and which are not?
* Note: `indexOf` returns `-1` if the element does not exist in the array. It only works for elements of the array.

```javascript
var myArray = [];
myArray['foo'] = 'bar';
myArray[0] = 'baz';
myArray[1] = 'qux';

console.log(myArray);         // logs ['baz', 'qux', foo: 'bar']
myArray.length;               // returns 2 since foo: 'bar' is not an element
myArray.indexOf('bar');       // returns -1 since 'bar' isn't an element

myArray[-1] = 'hello';
myArray[-2] = 'world';
myArray.length;               // returns 2
myArray.indexOf('hello');     // returns -1 since 'hello' is not an element
                              // the fact that myArray[-1] is 'hello' is
                              // coincidental
myArray.indexOf('world');     // returns -1 since 'world' is not an element

console.log(myArray);         // logs ['baz', 'qux', foo: 'bar', '-1': 'hello', '-2': 'world']
Object.keys(myArray).length;  // returns 5 (there are 5 keys at this point)
myArray.length;               // returns 2 (but only 2 keys are indexes)
```

* Property names that are non-negative integers are array indexes. Values that are assigned index properties are called `elements` of the array. All other property names and values are NOT considered elements of the array.
* `Array.prototype.indexOf` returns -1 if the value it is passed is not an element of the array (even if the value is associated with a non-index property).
* The value of `length` depends entirely on the largest **array index**. In the code above, the largest valid index is `1`. Therefore, the `length` returns 2.
* Logging an array logs the value alone if the item is an element. Otherwise, it logs the key:value pair.
* To count all properties, use `Object.keys(array).length`, since `array.length` returns only the number of elements.

* What are the implications of setting an array's length property? 
```javascript
var myArray = [1, 2, 3];
myArray.length;         // returns 3

// setting to a larger value than the current largest array index
myArray.length = 5;
console.log(myArray);   // logs (5) [1, 2, 3, empty × 2] on Chrome Console
                        // logs [1, 2, 3, <2 empty slots>] on Firefox console
                        // logs [1, 2, 3, ,] on node REPL
myArray.length;         // returns 5

myArray[6] = 'foo';
myArray.length;         // returns 7
console.log(myArray);   // logs (7) [1, 2, 3, empty × 3, "foo"] on Chrome Console
                        // logs [1, 2, 3, <3 empty slots>, "foo"] on Firefox console
                        // logs [1, 2, 3, , , , 'foo'] on node REPL

// setting to a smaller value than the current largest array index with value
myArray.length = 2;
console.log(myArray);   // logs [1, 2]

myArray.length = 5;
console.log(myArray);   // logs (5) [1, 2, empty × 3] on Chrome Console
                        // logs [1, 2, <3 empty slots>] on Firefox console
                        // logs [1, 2, , ,] on node REPL
myArray.length;         // returns 5
```

* The array loses data when its `length` property is set to a value smaller than the current largest array index.
* If you directly set the value of an array element using a valid index that is greater than the current largest index, Javascript sets the `length` to `1` greater than the array index provided. The number of empty slots is thus also included in the length.

Note the difference in number of properties and number of indexes:
```javascript
var count = [1, 2, 3, 4, 5];
count[6] = 7;
count;   // [1, 2, 3, 4, 5, undefined x 1, 7];

Object.keys(count).length; // 6
count.length               // 7 !
```

<a name="object-operations"></a>
### Using Object Operations with Arrays

* Object operations such as `in` and `delete` can be used on arrays but they may yield surprising results. It is better to use more idiomatic ways to accomplish array tasks.

* You *can* use the `in` operator to see whether an Object contains a specific key. This works fine with arrays:
```javascript
0 in [];   // false
0 in [1];  // true

// However, the intent of the code is not clear in the above. Compare the index directly to the array's length to see whether the array has it:
var numbers = [4, 8, 1, 3];
2 < numbers.length;         // true;
```

* You *can* use `delete` on Arrays but it can cause problems. Use `Array.prototype.splice` to remove a value from an Array.

<a name="warnings"></a>
### Warnings

* Use caution when modifying the properties of an array directly, such as changing the `length` property, using `delete` to remove a value, or adding properties with keys that are not array indexes. Unexpected results can occur.
* Properties that are not array indexes will **not** be processed by the built-in Array methods.
* Empty slots will also not be processed by these methods, since they are not array elements.
* It is especially risky to pass these modified array objects to methods that you don't control.