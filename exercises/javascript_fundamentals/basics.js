// 1.

var paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
                ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
                dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
                ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
                diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \   
                hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

console.log(paragraph);
// This throws a syntax error due to the extra spaces after the slash on line 7.
// The spaces before the text on lines 4 to 8 are also interpreted by Javascript as space and 
// the result is extra spacing in the middle of some sentences.

// 2.

var myBoolean = true;
var myString = 'hello';
var myArray = [];
var myOtherString = '';

if (myBoolean) {
  console.log('Hello'); // 'Hello'
}

if (!myString) {
  console.log('World'); // 
}

if (!!myArray) {
  console.log('World'); // 'World'
}

if (myOtherString || myArray) {
  console.log('!'); // '!'
}

// 3.

if (condition1) {
  // ...
  if (condition2) {
    // ...
  } else {
    // ...
  }
} else {
  // ...
  if (condition4) {
    // ...
    if (condition5) {
    // ...
    }
  }
}

// condition1 -> condition2
//            -> not condition2
// not condition2 -> condition4 -> condition5
//                -> contition4 -> not condition5
//                -> not condition4

// As a tree:
// if condition1 -- if condition2 -- end
//                \ else -- end
// else          -- if condition4 -- if condition 5 -- end
//                                 \ end
//                \ end
// There are 5 possible paths.

// 4. 

var name = 'Bob'; // 'Bob'
var saveName = name; // 'Bob'
name = 'Alice'; // 'Alice'
console.log(name, saveName); // 'Alice Bob'

var name = 'Bob';
var saveName = name;
name.toUpperCase(); // 'BOB'
console.log(name, saveName); // 'Bob Bob'

// In the second case, the string 'Bob' is not changed to uppercase; Javascript instead
// creates a new string, 'BOB'. The uppercase 'BOB' is not assigned to the variable `name`. 
// The `name` variable still points to the string 'Bob'. 

// Javascript temporarily coerces primitive values into their object counterparts to give them
// access to the object's methods. 

// 5.

var number1 = prompt('Enter the first number:');
var number2 = prompt('Enter the second number:');

console.log(number1 + ' + ' + number2 + ' = ' + (number1 + number2));
console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));

// Expected results: 

// Enter the first number: 23
// Enter the second number: 17

// 23 + 17 = 40
// 23 - 17 = 6
// 23 * 17 = 391
// 23 / 17 = 1
// 23 % 17 = 6
// 23 ** 17 = 1.4105003956066297e+23

// Since the prompt() method returns a string, a numeric sum will not be performed. Since
// both operands are strings, Javascript will perform string concatenation and return 
// "23 + 17 = 2317". For the other equations, since -, *, /, % and ** are only defined for
// numbers, Javascript will coerce the operands into numbers and produce the expected results.

// To fix the sum, use Number(number1) and Number(number2) instead of number1 and number2 at
// initialization to coerce the string representations of the numbers into Number instances.

// 6.


// Expected output:

// Please enter a phrase: walk
// // console output
// There are 4 characters in "walk".

// Please enter a phrase: walk, don't run
// // console output
// There are 15 characters in "walk, don't run".

var phrase = prompt('Please enter a phrase:');

var numChars = phrase.length;
console.log('There are ' + numChars + ' characters in "' + phrase + '".');

// Further exploration:

// No spaces:

var phrase = prompt('Please enter a phrase:');

var numChars = phrase.replace(' ', '').length;
console.log('There are ' + numChars + ' characters in "' + phrase + '".');

// Alphabetic chars only:

var phrase = prompt('Please enter a phrase:');

var numChars = phrase.replace(/\W+/g, '').length;
console.log(`There are ${numChars} characters in "${phrase}"`);