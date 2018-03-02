# 210: Computational Thinking and Javascript Programming

## List Processing and Functional Abstractions

* [Passing Functions as Arguments](#passing-functions-as-arguments)
* [Declarative Programming with Abstractions](#declarative-programming)
* [List Processing Abstractions](#list-processing-abstractions)
* [Iteration](#iteration)
* [Filtering/Selection](#filtering-selection)
* [Transformation](#transformation)
* [Reducing](#reducing)
* [Interrogation](#interrogation)
* [Sort](#sort)
* [Combining Abstractions](#combining-abstractions)
* [Functional Abstractions on Objects](#functional-abstractions-on-objects)

<a name="passing-functions-as-arguments"></a>
### Passing Functions as Arguments

* Functions are first-class values in Javascript, so they can be stored in variables and passed to other functions
* Arguments passed to a function dictate certain aspects of its behaviour.

#### Abstractions Allow Code to Specialize

Common behaviour among functions can be extracted:

```javascript
function prasadOrder() {
  console.log('I am very hungry and would like a salad.');
}

function sueOrder() {
  console.log('I am sort of hungry and would like a sandwich.');
}

function jaiOrder() {
  console.log('I am not hungry and would like a smoothie.');
}
```

Refactoring separates the code that defines how to build each line of text from the values provided to each person. (Although this does remove duplicate code, this is not the goal of the `buildOrder` function).

```javascript
function buildOrder(hungerLevel, item) {
  return 'I am ' + hungerLevel + ' hungry and would like a ' + item + '.';
}

function prasadOrder() {
  console.log(buildOrder('very', 'salad'));
}

function sueOrder() {
  console.log(buildOrder('sort of', 'sandwich'));
}

function jaiOrder() {
  console.log(buildOrder('not', 'smoothie'));
}
```

#### Passing Functions as Arguments

* Functions can be passed as arguments that affect the overall behaviour of the function they are passed to.

```javascript
var count = [1, 2, 3, 4, 5];

function iterate(array) {
  var i;
  var (i = 0; i < array.length; i ++ 1) { // for each element in array
    console.log(array[i]); // log the element to the console
  }
}

iterate(count);
// logs
1
2
3
4
5
```

Inherent behavior:
* how to iterate through an array
* what to do with each element
Determined by parameters:
* which array to iterate through

However, using a function as an argument allows us to control what we couldn't before: what we do with each element.
```javascript
function iterate(array, callback) {
  var i;
  for (i = 0; i < array.length; i += 1) { // for each element in array
    callback(array[i]); // invoke callback and pass the element
  }
}

iterate(count, function (number) { console.log(number); });

//logs
1
2
3
4
5
```

We can also store the function and then pass it in as an argument:
```javascript
function logger(number) {
  console.log(number);
}

iterate(count, logger);

// logs
1
2
3
4
5
```

#### Behavior as Arguments to Allow Abstractions

* A function as argument provides supplemental behaviour to the function from outside the function itself. A specific problem can be made more abstract. 
  * Specific problem: iterate through an array and log the elements
  * Abstraction: iterate through an array and do something

With the `iterate` function available, we can avoid the code needed to loop through an array in another function. That other function can then focus only on **what to do with each element in the array**.
```javascript
function oddOrEven(array) {
  iterate(array, function (number) {
    if (number % 2 === 0) {
      console.log('even');
    } else {
      console.log('odd');
    }
    });
}

// Using a built-in method instead:
function oddOrEven(array) {
  array.forEach(function (number) {
    if (number % 2 === 0) {
      console.log('even');
    } else {
      console.log('odd');
    }
  });
}
```

<a name="declarative-programming"></a>
### Declarative Programming with Abstractions

#### Imperative Style

The abstraction level of the following code is *"create a new empty array, iterate through the original array and push the odd numbers onto the new array, and log the new array to the console"*. **This is purely imperative code.**

```javascript
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var newArray = [];
var i;

for (i = 0; i < array.length; i += 1) {
  if (array[i] % 2 === 1) {
    newArray.push(array[i]);
  }
}

console.log(newArray);
```

* Imperative style focuses on the steps of solving a problem. Each line of code has a purpose, but you need to understand the implementation in order to understand the purpose. 
* For example, `num % 2 === 1` checks whether `num` is an odd number (we need to interpret the code to know what it does).

#### Abstraction

* We can move the details of detecting odd numbers to the body of a new function:
```javascript
function isOddNumber(number) {
  return number % 2 === 1;
}
```

* This raises the abstraction level of more complicated programs, such as
```javascript
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var newArray = [];
var i;

for (i = 0; i < array.length; i += 1) {
  if (isOddNumber(array[i])) { // tells what to do vs. how to do it
    newArray.push(array[i]);
  }
}

console.log(newArray);
```

* We can raise the abstraction level further by using `Array.prototype.forEach` instead of a `for` loop:

```
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var newArray = [];

array.forEach(function (element) { // what to do as we iterate through the array
  if (isOddNumber(element)) {
    newArray.push(element);
  }
});

console.log(newArray);

function isOddNumber(number) {
  return number % 2 === 1;
}
```

By filtering abstraction, the code truly reflects its purpose.

```javascript
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var oddNumbers = array.filter(function (element) {
  return isOddNumber(element); // function expression calls another function
});

console.log(oddNumbers);

function isOddNumber(number) {
  return number % 2 === 1;
}

// Refactored to: 
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var oddNumbers = array.filter(isOddNumber); // just pass the function by name

console.log(oddNumbers);

function isOddNumber(number) {
  return number % 2 === 1;
}

```

The abstraction level is now *"filter the original array to get odd numbers and log them on the console."* This is more readable, more concise, and more robust (since it uses a built-in abstraction instead of writing a new function). 

#### Declarative Programming

* CSS, for example, is declarative and works at a very high level of abstraction.
* The higher the level of abstraction, the more declarative the code, which frees programmers to focus on describing a good solution to the problem rather than the detailed steps needed.
* JavaScript's built-in list processing abstractions allow declarative programming, or you can write your own abstractions.

<a name="list-processing-abstractions"></a>
### List Processing Abstractions

* These array methods take a function as an argument (the `callback`). The function implements an abstraction, and the method invokes this function for each element in the array.
* With the exception of `some` and `every`, all list-processing abstractions traverse the entire list. To return early from processing a list, use a `for` loop.
* JavaScript doesn't have as many functional abstractions or data structures as "pure" functional programming languages like Clojure and Haskell.

#### forEach

* Abstraction: iteration
* Purpose: To perform an operation on each element in an Array
* Arguments: 
  * Callback function, taking three arguments:
    * value of current element in array
    * index of current element in array
    * array being processed
* Returns: `undefined`

#### filter

* Abstraction: filtering/selection
* Purpose: Select a subset of elements
* Arguments:
  * Callback function, taking three arguments:
    * value of current element in array
    * index of current element in array
    * array being processed
  * Returns: boolean
* Returns: new Array

#### map

* Abstraction: transformation
* Purpose: Compute a new value from each element
* Arguments:
  * Callback function, taking three arguments:
    * value of current element in array
    * index of current element in array
    * array being processed
  * Returns: transformed element
* Returns: new Array

#### sort

* Abstraction: ordering
* Purpose: Rearrange elements by sorting the Array in place
* Arguments:
  * Callback function, taking two arguments:
    * item1:
    * item2: 
    * Returns: neg. int. (item1 < item2), pos. int. (item1 > item2), or 0 (item1 === item2)
* Returns: sorted Array

#### reduce, reduceRight

* Abstraction: reducing/folding
* Purpose: Iteratively compute a result based on all element values
* Arguments:
  * Callback function, taking four arguments:
    * accumulator: return value of previous callback invocation (initial value on first iteration)
    * value of current element in array
    * index of current element in array
    * array being processed
* Returns: single value (the value returned by the final callback invocation)

#### every, some

* Abstraction: interrogation
* Purpose: Determine whether an Array's elements meet a condition 
* Argments: 
  * Callback function, taking three arguments:
    * value of current element in array
    * index of current element in array
    * array being processed
    * Returns: boolean value
* Returns: boolean value

<a name="iteration"></a>
### Iteration

* The preferred way to iterate over an array in Javascript is the `forEach` method.
* It invokes the given function once for each element in the array and returns `undefined` (it does not use the return value of the callback). This means `forEach` must have side effects to be useful.

* My implementation of `forEach`:
```javascript
function myForEach(array, func) {
  var i;
  for (i = 0; i < array.length; i += 1) {
    func(array[i]);
  }

  return undefined;
}

var min = Infinity;
var getMin = function (value) {
  min = value <= min ? value : min;
};

myForEach([4, 5, 12, 23, 3], getMin);   // undefined
console.log(min);                       // 3
```

* The `forEach` method ignores the return value of its callback function. Therefore, the following won't work as expected:
```javascript
function compareLists(list1, list2) {
  list1.forEach(function (item, index) {
    if (item !== list2[index]) {
      return false;
    }
  });

  return true; // always returns true
}
```

<a name="filtering-selection"></a>
### Filtering/Selection

* Filtering is the process of creating a new array containing a subset of an existing array. Use the `filter` method in JavaScript.
* If the callback function returns `true`, the element is included in the new array; if it returns `false`, it is excluded. The new array is returned from the `filter` function.

* My implementation of `filter`:
```javascript
function myFilter(array, func) {
  var newArray = [];
  
  array.forEach(function (value) {
    if (func(value)) {
      newArray.push(value);
    }
  });

  return newArray;
}

var isPythagoreanTriple = function (triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
};

myFilter([{ a: 3, b: 4,  c: 5 },
          { a: 5, b: 12, c: 13 },
          { a: 1, b: 2,  c: 3 },], isPythagoreanTriple);

// returns [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ]
```

<a name="transformation"></a>
### Transformation

* Transformation is the creation of a new array that contains values calculated from the values of the original array. Use the `map` method for transformation in JavaScript.
* The values returned by the callback function become the elements in the new array. The `map` function returns the new array. The size of the new array is the same as the size of the original array.

* My implementation of `map`:
```javascript
function myMap(array, func) {
  var newArray = [];

  array.forEach(function (value) {
      newArray.push(func(value));
  });

  return newArray;
}

var plusOne = function (n) { return n + 1; };

myMap([1, 2, 3, 4], plusOne);       // [ 2, 3, 4, 5 ]

```

<a name="reducing"></a>
### Reducing

* Each invocation of the callback used by the `reduce` method affects later invocations. 
* The `accumulator` is the return value of the previous callback invocation.
* The first value of the `accumulator` is the initial value of the array on the first iteration OR `initialValue` if a second argument is given.
* If `initialValue` is not given, `reduce` starts processing with the second element of the array.
* `reduce` passes the `accumulator` to the next callback invocation. The return value of each callback invocation (the `accumulator`) therefore becomes the first argument to the next callback invocation. 
* The return value of the last callback invocation becomes the return value of the function itself.

```javascript
var count;

function add(previousValue, element) {
  var sum = previousValue + element;
  console.log(previousValue, element, sum);
  return sum;
}

var count = [1, 2, 3, 4, 5];
count.reduce(add);            // 15
console.log(count.reduce(add));
// logs
1 2 3     // The return value...
3 3 6     // becomes the first argument to the next callback invocation
6 4 10
10 5 15   // The last return value...
15        // becomes the value logged by console.log

// The value of the accumulator changes like so: 1 -> 3 -> 6 -> 10 -> 15
```

* Given an `initialValue` argument:
```javascript
console.log(count.reduce(add, 0));
// logs
0 1 1        // The callback is run an extra time
1 2 3
3 3 6
6 4 10
10 5 15
15
```

* My implementation of `reduce`:
```javascript
function myReduce(array, func, initial) {
  var accumulator = initial || array[0];

  array.forEach(function (value) {
    accumulator = function(accumulator, value);
  });

  return accumulator;
}

var smallest = function (result, value) {
  return result <= value ? result : value;
};

var sum = function (result, value) {
  return result + value;
};

myReduce([5, 12, 15, 1, 6], smallest);           // 1
myReduce([5, 12, 15, 1, 6], sum, 10);            // 49
```

```javascript
function longestWord(words) {
  return myReduce(words, longest);
}

var longest = function (result, currentWord) {
  return currentWord.length >= result.length ? currentWord : result;
};

longestWord(['abc', 'launch', 'targets', '']);      // "targets"
```

<a name="interrogation"></a>
### Interrogation

* Interrogation checks how many of an array's elements satisfy some condition.
* In JavaScript, the `some` and `every` functions take a callback function. This function should return a boolean.
* The `every` method iterates over all the elements until the callback returns a falsy value, and then `every` immediately returns `false`. If no elements produce a falsy value, then `every` returns `true`.
* The `some` method iterates over all the elements until the callback function returns a truthy value, and then `some` immediately returns `true`. If no elements have a truthy value, `some` returns `false`.

* My implementation of `every`:
```javascript
function myOwnEvery(array, func) {
  var i;

  for (i = 0; i < array.length; i += 1) {
    if (!func(array[i])) return false;
  }

  return true;
}

var isAString = function (value) {
  return typeof value === 'string';
};

myOwnEvery(['a', 'a234', '1abc'], isAString);       // true
```

<a name="sort"></a>
### Sort

* Sort lets you rearrange the elements of an array from lowest to highest or vice versa.
* In JavaScript, `sort` takes a callback function and performs an **in-place** sort of the array (it mutates the array). **It also returns a reference to the sorted array.**
* Returns reference to mutated (sorted) array, so **`sort` can be used for either its return value or its side effect**.

* Example
```javascript
function compareScores(score1, score2) {
  if (score1 < score2) {
    return -1;
  } else if (score1 > score2) {
    return 1;
  } else {
    return 0;
  }
}

var scores = [88, 50, 60, 99, 12, 23];
scores.sort(compareScores);            // [ 12, 23, 50, 60, 88, 99 ]
scores;                                // mutated to [ 12, 23, 50, 60, 88, 99 ]

```
* `sort` only cares about the sign of the callback return value. 1, -1 and 0 are convenient values.
* This is a more succinct way to sort numbers:
```javascript
function compareNumbers(num1, num2) {
  return num1 - num2;
}
```

<a name="combining-abstraction"></a>
### Combining Abstractions

* Abstractions can be combined in a way where the return value of one abstraction is the input for another.
* Problems can be broken down into abstractions and then combined to get the final solution.
* We can break down the problem below into steps:
  * For each name in the list, determine its first letter.
    * Result: array of first letters.
    * Abstraction: Transformation
    * `map`
  * Count the occurrences of each first letter.
    * Result: Object containing letters as keys and counts as values.
    * Abstraction: Reduction
    * `reduce`
  * Determine the first letter that occurs most often.
    * Result: Letter with the largest number of occurrences.
    * Abstraction: Reduction
    * `reduce`

```javascript
// We want to determine the most frequent starting letter of the names in a list.
var names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];

var letters = names.map(function (name) {
  return name[0];
});

// letters is [ "H", "G", "K", "H", "K", "K", "O" ]

var counts = letters.reduce(function (obj, letter) {
  obj[letter] = obj[letter] || 0; 
  obj[letter] += 1;
  return obj;
}, {});

// counts is { H: 2, G: 1, K: 3, O: 1 }

var letter = Object.keys(counts).reduce(function (lastLetter, currentLetter) {
  if (counts[lastLetter] > counts[currentLetter]) {
    return lastLetter;
  } else {
    return currentLetter;
  }
});

// letter is "K"
```

<a name="functional-abstractions-on-objects"></a>
### Functional Abstractions on Objects

* Use `Object.keys()` to get an array of the object's keys
* You can then call any array method, such as `forEach`, on that array **if you only need to work with the keys**.

```javascript
var myObject = { a: 1, b: 2, c: 3 };

Object.keys(myObject).forEach(function (key) {
  console.log('key: ' + key + ', value: ' + String(myObject[key]));
});

// logs
key: a, value: 1
key: b, value: 2
key: c, value: 3
```

* To work with the entire object, you must rely on side effects to build up a new data structure. You cannot use `map` and other abstraction methods on an object directly.

```javascript
// map to a new object with values doubled from myObject
function doubleObjectValues(object) {
  var newObject = {};
  Object.keys(object).forEach(function (key) {
    newObject[key] = object[key] * 2;            // side effect
  });

  return newObject;
}

doubleObjectValues({ a: 1, b: 2, c: 3 });        // { a: 2, b: 4, c: 6 }

```

### Low Level Abstractions

* A more direct route to a solution is okay when high-level abstractions would involve many iterations over the input.
* For example,
```javascript
function isAllUnique(string) {
  var seen = {};
  var lowerCasedString = string.toLowerCase();
  var i;

  for (i = 0; i < lowerCasedString.length; i += 1) {
    if (lowerCasedString[i] === ' ') {
      continue;
    }

    if (seen[lowerCasedString[i]]) {
      return false;
    } else {
      seen[lowerCasedString[i]] = true;
    }
  }

  return true;
}
```