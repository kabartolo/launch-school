# 210: Computational Thinking and Javascript Programming

## Basics

* [Running Code](#running-code)
* [Data Types](#data-types)
* [Variables](#variables)
* [Operators](#operators)
* [Expressions and Statements](#expressions-statements)
* [Input and Output](#input-output)
* [Explicit Primitive Type Coercions](#primitive-type-coercions-explicit)
* [Implicit Primitive Type Coercions](#primitive-type-coercions-implicit)
* [Conditionals](#conditionals)
* [Looping and Iteration](#looping-iteration)
* [Errors](#errors)

<a name="running-code"></a>
### Running Code

Place the Javascript in an HTML file and open it in Chrome. 

Add the Javascript either directly inside a `script` element or by loading it from a file:

```javascript
<body>
  <script>
    console.log('I run automatically!');
  </script>
</body>
```


```javascript
<script src="my_javascript.js"></script>
```

Avoid combining the attribution of a `src` to the script tag *and* embedding script inside it. If both exist, only the Javascript from the referenced file will be loaded.

```javascript
console.log("I'm Loaded!");
```

```javascript
<body>
  <script src="my_javascript.js">
    console.log("I'm NOT Loaded!");
  </script>
</body>
```

<a name="data-types"></a>
### Data Types

Use the `typeof` operator to get the data type of any value:
```javascript
typeof false; // "boolean"
```

There are five **primitive** data types (primitive values) in Javascript (ES5): number, boolean, string, null, and undefined. It has one **compound** data type: object. In ES6, there is an additional data type: symbol.

**Unlike in Ruby, strings are immutable in Javascript. All primitives in Javascript are immutable.** Instead of changing the value itself of a variable, Javascript assigns a *new* value to the variable. You must remember to assign the new value to the desired variable.

* Primitives are passed by value and compared by value.
* Primitives exist on the stack.

```javascript
a = 'hello';
a.toUpperCase(); // a new "HELLO" string is returned
a;               // still "hello"
```

```javascript
var name = 'Bob'; // name points to string 'Bob'
var saveName = name; // saveName points to string 'Bob' (copy)
name = 'Alice'; // name now points to new string 'Alice'; saveName still points to 'Bob'
console.log(name, saveName); // 'Alice Bob'
```

Strings, numbers and booleans are primitives, but Javascript distinguishes between the primitive
values and their object counterparts (where the objects are instances of String, Number, or Boolean). The primitive types are *coerced* into objects in order to access the object's methods; this is only temporary, however, as the object will be thrown away after use. See: [https://javascriptweblog.wordpress.com/2010/09/27/the-secret-life-of-javascript-primitives/](https://javascriptweblog.wordpress.com/2010/09/27/the-secret-life-of-javascript-primitives/)

```javascript
var foo = "bar";
typeof foo; // "string"

String.prototype.toUpperCase = function() {
  return typeof this;
}

foo.toUpperCase(); // "object"
foo; // "bar"
typeof foo; // "string"

```

#### Numbers
  * JS uses a floating point system to represent all numbers. 
  * There are no distinct data types (e.g., integer, float).
  * JS uses 64 bits to store numbers in memory, so the largest Number that can be used is 9,223,372,036,854,775,807, but the largest number that can be precisely stored is 9,007,199,254,740,991 (`Number.MAX_SAFE_INTEGER`) due to Javascript's use of double precision floats. The maximum number that can be represented is 1.7976931348623157e+308 (`Number.MAX_VALUE`).
  * The special number values are `Infinity`, `-Infinity`, and `NaN` (not a number, used when a math function encounters an error such as when dividing by zero).
  * Decimal fractions are approximate
  * Therefore, the associative law does not always hold for binary floating point. 
```javascript
a = 0.1;
b = 0.2;
c = 0.3;
console.log(a + b) + c === a + (b + c); // false
```

#### Booleans
  `true` and `false`

#### Strings
  * Javascript strings have *no* size limit.
  * There is no character type (a char is a string with length 1).
  * There is no functional distinction between single- and double-quoted Strings.
  * Use `+` to **concatenate** strings. 
  * You can use `\` at the end of a line (within the quotation marks) to ignore newlines and concatenate lines of strings (warning: Javascript will treat any spaces or tabs after the `\` as literal and then fail to find the closing quote mark). It is better not to use this syntax.
```javascript
var a = "This is a \
multi-line string"; // ok
var b = "This is a \ 
multi-line string;" // Syntax error
```
  * Strings can hold any character in the UTF-16 character set (no awareness of surrogate pairs).
  * Formatting characters should be handled using escape sequences: 
    | Code | Character       |
    | :--- | :-------------- |
    | \n   | New line        |
    | \t   | Tab             |
    | \r   | Carriage return |
    | \v   | Vertical tab    |
    | \b   | Backspace       |

  * Strings are like a collection of characters, and characters are indexed (starting from 0). Use `String.prototype.charAt()` or bracket notation to access a character in a string. As for Arrays, indexes can only be non-negative integers.

```javascript
'hello'.charAt(1); // "e"
```

```javascript
'hello'[1]; // "e"
```
    * Note: bracket notation in Javascript is an *operator* (not a method as it is in Ruby). 
  * Strings have a `length` property: `'hello'.length; // 5`
  * Javascript's string methods: [https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/prototype](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/prototype)

#### Null data type

* Note the error in the standard:
```javascript
typeof null; // "object"
```

#### undefined data type

<a name="variables"></a>
### Variables

#### Names

Variable names:
* are case-sensitive;
* can be of any length;
* must start with a Unicode letter, an underscore (`_`), or a dollar sign(`$`);
* must contain Unicode letters, numbers (except for the first char), or underscores; and
* must not be a [reserved word](http://www.ecma-international.org/ecma-262/5.1/#sec-7.6.1).

#### Declaring and Assigning Variables

There is an important difference between declared and undeclared names. Variables are declared using the `var` keyword. 

Use `=` to assign a value to a variable once it is declared.

```javascript
var book;

book = 'The Way of Kings'; // variable 'book' is assigned the String value 'The Way of Kings'
```

Combine the variable declaration and assignment with an initialization assignment:

```javascript
var book = 'The Way of Kings';
```

Note: A declared variable will be initialized to `undefined` if it is not assigned a value.

#### Dynamic Typing

A variable in Javascript is just a name for a value at a particular time; it can hold a reference to any data type or value and can be reassigned to different type or value without error. This is called dynamic typing.

```javascript
var myName = 'Joe';
myName = 200;
myName; // 200
```
<a name="operators"></a>
### Operators

Operators tell the computer to perform operations on values (operands)

#### Arithmetic Operators

`+`, `-`, `/`, `*`, `%`

Note: Javascript numbers are floating points. Unlike in Ruby, division in Javascript returns a floating-point number.

```javascript
2014 / 1000; // logs: 2.014 (Ruby would return 2)
```

`%` is the **remainder** operator, not the modulo operator of other programming languages. It returns the remainder of an integer division. With positive integers, it acts like a modulo (e.g., `10 % 3` returns `1`). The distinction is seen when one of the numbers is negative: `10 % -3` returns `-1` when `%` performs as a remainder and `-2` when it performs as a modulo.

#### Assignment Operators and Shorthand

| Name                      | Shorthand Operator | Meaning    |
| :------------------------ | :----------------- | :--------- |
| Addition assignment       | a += b             | a = a + b  |
| Subtraction assignment    | a -= b             | a = a - b  |
| Multiplication assignment | a \*= b            | a = a \* b |
| Division assignment       | a /= b             | a = a / b  |
| Remainder assignment      | a %= b             | a = a % b  |

#### Comparison Operators

A comparison operator returns a boolean value based on whether the comparison it performs is true or false. Javascript attempts to implicitly convert two operands of different types but this can cause problems; it is thus best to avoid `==` and `!=` in favor of the strict `===` and `!==` that do not perform conversions.

| Operator               | Description                                                            |
| :--------------------- | :--------------------------------------------------------------------- |
| Equal (==)             | Returns true if the operands are equal                                 |
| Not Equal (!=)         | Returns true if the operands are not equal                             |
| Strict Equal (===)     | Returns true if the operands are equal and of the same type            |
| Strict Not Equal (!==) | Returns true if the operands are not equal and/or not of the same type |
| Greater than (>)       | Returns true if the left operand is greater than the right             |
| Less than (<)          | Returns true if the left operand is less than the right                |

```javascript
'1' == 1;  // true (which may not be what you expect)
'1' === 1; // false
```

#### String Operators

Strings can be compared like numbers, based on their Unicode lexicographical ordering.

```javascript
'a' < 'b';         // true
'Ant' > 'Falcon';  // false
'50' < '6';        // true ('5' precedes '6' lexicographically)
```

#### Logical Operators

Combining boolean values and logical operators:

* Logical And (`&&`)
  * Returns `true` if both operands are true, `false` otherwise
  * For non-boolean values, returns the first operand if it can be converted to `false`, the second operand otherwise
  * This can be used to avoid null references:
```javascript
if (a) {
  return a.member;
} else {
  return a;
}
// can be written as
return a && a.member;

// for example
var object = { firstName = 'Kate' };
console.log(object && object.firstName); // 'Kate'
console.log(object && object.lastName);  // undefined (object is undefined, which is falsy)
```

* Logical Or (`||`)
  * Returns `true` if at least one operand is true, `false` otherwise
  * For non-boolean values, returns the first operand if it can be converted to `true`, the second operand otherwise
  * This can be used to fill in default values.
```javascript
var last = input || nr_items; // if input is truthy, then assign input to last, otherwise assign nr_items

// for example
var input = 'hello';
var message = 'goodbye';
console.log(input || message); // 'hello'

input = '';
console.log(input || message); // 'goodbye'
```

* Logical Not (`!`)
  * Returns `true` if its operand can be converted to false, `false` otherwise
  * This is a unary operator (it takes only one operand).
  * `!!` produces booleans

<a name="expressions-statements"></a>
### Expressions and Statements

An expression is code that **resolves to a value**. The **return value** of an expression is the value that 
it resolves to.

```javascript
'hello';   // a single string is an expression
10 + 13;   // arithmetic operations are expressions
sum = 10;  // assignments are expressions
```

Some common expression types are arithmetic (`10 + 3`), string (`'hello' + 'world'`), and logical (`10 > 9`). An expression can be used as part of an assignment.

```javascript
var a;
var b;
var c;

a = 3;
b = 10 + 3;         // 10 + 3 is an expression that resolves to 13 and used as part of the assignment for sum
c = (a + (3 + b));  // a more complicated expression
```

#### Operator Precedence 

Javascript performs multiplication and division operations before addition and subtraction. Parentheses override the default precedence. Parentheses can enclose any expression (including function calls).

```javascript
3 + 3 * 4;    // 15
(3 + 3) * 4;  // 24
```

Arithmetic operators have higher precedence than logical AND and OR, which have higher precedence than assignment.

```javascript
var a = 0;

0 && (a += 1); // 0 (short-circuits at first falsy value, 0)
a && (a -= 1); // 0 (short-circuits at first falsy value, 0, referenced by a)
a || (a += 1); // 1 (short-circuits at first truthy value, 1, returned from a += 1)
```

#### Increment and Decrement Operators

The increment (`++`) and decrement (`--`) operators increment and decrement their operands by `1`, respectively. They can appear before or after their operand (prefix and postfix, respectively). 

* Used standalone, they behave the same when prefixed or postfixed.
* As part of a complex expression, the behaviour changes: 
  * Operator after operand: JS evaluates the expression then modifies the operand.
  * Operator before operand: JS modifies the operand, then evaluates the expression.

```javascript
var a;
var b;
var c;

a = 5;
b = a++;  // equivalent to "b = a; a++;". so now b is 5 and a is 6
c = ++a;  // equivalent to "++a; c = a;". so now c is 7 and a is 7
```

* **JS style guides suggest using `num += 1` and `num -= 1` instead.** This is because unary increment/decrement operators are subject to automatic semicolon insertions and can cause silent errors. They are also less expressive.
* Also note, `++` and `--` return the original value before incrementing/decrementing. `+= 1` and `-=1` return the new value after incrementing/decrementing. See [Looping and Iteration](#looping-iteration) (while loops) for an example of a subtle bug this can introduce.

#### Logical Short Circuit Evaluation in Expressions

The short-circuit rules for evaluating logical And (`&&`) and logical Or (`||`):
* `a || b`: if `a` is `true`, the result is always `true`. Javascript short-circuits the evaluation and returns `true` without evaluating `b`.
* `a && b`: if `a` is `false`, Javascript short-circuits the evaluation and returns `false` without evaluating `b`.

#### Statements

The **return value** of a statement is `undefined`. 

Statements control the execution of the program but do not necessarily resolve to a value (e.g., variable declarations, `if` statements, looping). Variable assignments are *expressions* but variable declarations are *statements*.

```javascript
var a;                // a statement to declare variables
var b;
var c;
var b = (a = 1);      // this works, because assignments are expressions too
// the above has three expressions: 1, a = 1, and b = 1

var c = (var a = 1);  // this gives an error, since a statement can't be used as part of an expression
```

```javascript
var myNumber = 3; // both a statement and an expression, but returns undefined
```

The ternary operator is used in an expression while an `if/else` statement is a statement.
```javascript
var count = (isTrue() ? 0 : 1); // evaluates to 0 or 1, so it's an expression

var count = if (isTrue()) { // SyntaxError (if/else expressions don't evaluate to a value)
              0;
            } else {
              1;
            }
```

<a name="input-output"></a>
### Input and Output

Use the `prompt()` method to get user input. It opens a pop-up dialog box with an optional message asking the user to enter text. If the user then clicks `Ok`, `prompt()` returns the text as a string; if the user clicks `Cancel`, it returns `null`. The input is always captured as a **string**.

You can also use `alert()` to notify the user of a message. 

The `console.log()` method outputs a message to the JS console; users don't usually look at the console in the browser but they could (be sure no messages to the console are left in).

<a name="primitive-type-coercions-explicit"></a>
### Explicit Primitive Type Coercions

Since Javascript primitives are immutable values, it doesn't convert values but rather returns a new value of the proper type.

#### Strings to Numbers

* `Number()` turns a string that contains a numeric value into a number or returns `NaN` if the string cannot be converted.
* You can also use the unary + prefix operator: `num = +str;`. According to MDN, "unary plus is the fastest and preferred way of converting something into a number, because it does not perform any other operations on the number. It can convert string representations of integers and floats, as well as the non-string values true, false, and null."
```javascript
+null;      // 0
+undefined; // NaN
+'10';      // 10
+'hi';      // NaN
+true;      // 1
+false;     // 0
+'true';    // NaN
```

* `parseInt()` and `parseFloat()` turn strings to numbers, but `parseInt()` will only return an integer.
* This function stops at the first non-digit character

```javascript
parseInt('453.6', 10);  // 453
parseFloat('453.6');    // 453.6
parseInt("12em")        // 12
parseInt('08');         // 0 (assumes it is in base 8, but 8 is not a base-8 digit so it stops at 0)
parseInt('08', 10);     // 8 (always use the radix!)

// compare
+'12em'; // NaN
+'08';   // 8
```

#### Numbers to Strings

The `String()` function turns numbers into strings: `String(123); // "123"`

The `toString()` method can be called on numbers: `(123).toString(); // "123"`

* Prefer String() to toString()
* String() works with all types, including null and undefined, while toString() raises an exception in those cases.
* String() is guaranteed to return a string. This is not the case with toString() — individual objects can override toString() and they don't have to return a string.

#### Booleans to Strings

The `String()` function turns booleans to Strings: `String(true); // "true"`

The `toString()` method can be called on booleans: `true.toString(); // "true"`

#### Primitives to Booleans

* There is no direct coercion of strings to booleans.

* Compare a string representation of a boolean to `'true'` to determine whether it is `'true'` or `'false'`. 

```javascript
var a = 'true';
var b = 'false';
a === 'true';            // true
b === 'true';            // false
```

* Use the `Boolean()` function to convert any value to a boolean based on the truthy and falsy rules of Javascript. This cannot be used to coerce string representations of `true` and `false`, however, since `Boolean('false')` returns `true`. 

* The double `!` operator is a simpler way to convert truthy or falsy values to the boolean equivalents. For example, `!!(null)` returns `false`

<a name="primitive-type-coercions-implicit"></a>
### Implicit Primitive Type Coercions

When two values of different types are used as operands in expressions, Javascript attempts to convert one value to a type it can operate on. 

* Programmers should be aware of implicit type coercions but should avoid them. The intent of this kind of code can be unclear, and bugs are much more likely and difficult to detect. 
* Javascript is a loosely typed language, but + as both concatenation and addition comes from Java, which is strongly typed.

#### Arithmetic Operators

* The **unary plus** operator converts a value to a number, following the rules for `Number()`
```javascript
+('123')        // 123
+(true)         // 1
+(false)        // 0
+('')           // 0
+(' ')          // 0
+('\n')         // 0
+(null)         // 0
+(undefined)    // NaN
+('a')          // NaN
+('1a')         // NaN
```

* For the **binary plus** operator used with mixed operands that include a string, Javascript converts the non-string operand to a string. If the operands do not include a string (they are a combination of numbers, booleans, `null`, or `undefined`), they are converted to numbers and added.

```javascript
1 + true        // 2
1 + false       // 1
true + false    // 1
null + false    // 0
null + null     // 0
1 + undefined   // NaN
```
  * If one of the operands is an object, both operands are converted to strings and concatenated: 
```javascript
[1] + 2                     // "12"
[1] + '2'                   // "12"
[1, 2] + 3                  // "1,23"
[] + 5                      // "5"
[] + true                   // "true"
42 + {}                     // "42[object Object]"
(function foo() {}) + 42    // "function foo() {}42"
```

* Other arithmetic operators are only defined for numbers so Javascript converts both operands to numbers. 

```javascript
1 - true                // 0
'123' * 3               // 369 -- the string is coerced to a number
'8' - '1'               // 7
-'42'                   // -42
null - 42               // -42
false / true            // 0
true / false            // Infinity
'5' % 2                 // 1
```

* Example:
```javascript
function productOfSums(array1, array2) {
  return total(array1) * total(array2); // NaN (undefined * undefined)
}

function total(numbers) {
  var sum; // sum = undefined
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    sum += numbers[i]; // sum is never assigned a value and has value NaN here (undefined + numbers[i])
  }

  sum; // explicit return is missing, will return undefined regardless of sum's value
}

```

#### Equality Operators

* Javascript's strict operators (`===` and `!==`) never perform type coercions. With this operator, two operands are only equal if they are both the same type and have the same value. **Use these operators.**

* The non-strict equality operators (`==` and `!=`) work the same way as the strict equality operators when the operands are of the same type. When they are of different types, Javascript implicitly coerces them to the same type before comparing them.
  * When one operand is a string and the other a number, the string is converted to a number: `0 == '' // true (0 == 0)`
  * When one operand is a boolean, it is converted to a number: `'0' == false // true ('0' == 0 then 0 == 0, two conversions)`
  * When `null` is compared to `undefined` using the non-strict equality operator (`==`), it always returns `true`. It returns `false` when `null` or `undefined` is compared to any other value: `null == false // false` but `null == undefined // true`
  * `==` always returns `false` if either or both of the operands is `NaN`

Note the lack of transitivity in the following (from Douglas Crockford):
```javascript
'' == '0';         // false
0  == '' ;         // true 
0  == '0';         // true

// If 0 = '' and 0 == '0', then '' should equal '0' (it doesn't!)

false == 'false'   // false
false == '0'       // true

false == undefined // false
false == null      // false
null == undefined  // true

' \t\r\n ' == 0    // true

```

#### Relational Operators

* `<`, `>`, `<=`, `>=` are defined for numbers and strings.
* There are no strict versions of these operators. 
* **Operands are converted to numbers** before comparison **unless both operands are strings**, in which case Javascript compares the strings lexicographically: 
```javascript
true > null;  // true (1 > 0)
'2' > '10';   // true
'2' > 10;     // false
```

* Note: Items in an Array are sorted lexicographically, even if all items are numbers (i.e., they are sorted by their Unicode value):
```javascript
var array = [45, 23, 100, 5];
array.sort(); // [100, 23, 45, 5] !!
```

<a name="conditionals"></a>
### Conditionals

#### if...else

The `if` statement consists of `if`, an expression, and a block. It can be followed by an optional `else` statement.

The `if` and the expression make up the conditional statement. The expression evaluates to a boolean. If it evaluates to `true`, the block of code following the condition runs. If an `else` follows and the `if` or `else if` condition is `false`, the `else`'s block is run.

```javascript
if (score > 70) {
  console.log('Congratulations, you passed!');
} else {
  console.log('Sorry, but you need to study more!');
}
```

##### Truthiness

The following values are falsy: `null`, `NaN`, `0`, the empty string `''`, `false` and `undefined`.

All other values are truthy. 

Note: `1 || 2` returns `1`, which is truthy.

```javascript
if (1 || 2) {
  console.log('True'); // "True"
}
```

#### Switch

The `switch` statement compares an expression with `case` labels; the statement(s) following the first `case` label that matches are executed. 

However, the `switch` will continue to the next cases until it reaches `default` or a `break` statement. To force the `switch` to stop after the first match, insert a `break` statement to each `case` statement.

```javascript
var reaction = 'negative';

switch (reaction) {
  case 'positive':
    console.log('The sentiment of the market is positive');
  case 'negative':
    console.log('The sentiment of the market is negative');
  case 'undecided':
    console.log('The sentiment of the market is undecided');
  default:
    console.log('The market has not reacted enough');
}

// console output
The sentiment of the market is negative
The sentiment of the market is undecided
The market has not reacted enough
```

* A case for which the `switch` fall through is useful (though should still be avoided since it is not a well-known idiom):
```javascript
function myFunc(arg1, arg2, arg3) {
    //replace unpassed arguments with their defaults:
    switch (arguments.length) {
        case 0 : arg1 = "default1";
        case 1 : arg2 = "default2";
        case 2 : arg3 = "default3";
    }
}
```

#### Comparing values with NaN

`NaN` is a Javascript number (i.e., of type `number`) that represents an illegal operation on numbers. Comparing any value to `NaN` evaluates to `false` even if that value is `NaN` itself: `Nan == Nan // false`

You can use the `isNan()` function to determine whether a value is `NaN`. However, it checks whether a value is literally not a number and will return `true` for any value that is not numeric: `'isNan('hello'); // true`. To get around this and check for the actual `NaN` value, check both type and value:

```javascript
function isValueNaN(value) {
  return typeof value === 'number' && isNaN(value);
}
```

```javascript
function isValueNaN(value) {
  return value !== value;
}
```

<a name="looping-iteration"></a>
### Looping and Iteration

#### while

A `while` loop evaluates the condition first and then executes the block statements if the condition has a truthy value. When execution reaches the end of the block, control is passed back to the conditional expression and the process is repeated until the condition is falsy. This can result in an infinite loop if the condition is never falsy.

```javascript
// The following should log decrementing numbers from a starting count and stop at 0 (not printing 0)
var count = 1;
while (count--) {     // expression evaluates to 1 (-- returns original value)
  console.log(count); // count is actually 0
}

// logs:
// 0

count; // -1 (condition evaluated twice)

// Fixed
var count = 1;
while (count) {         // evaluates to 1
  console.log(count--); // evaluates to 1, but count is 0 for the next loop
}

// logs:
// 1

// NOTE: The above programs would not work if '-= 1' were used instead of '--'
// '-=1' returns the new value, not the original
```

#### Break and Continue

The `break` statement exits from a loop immediately. The `continue` statement skips the current iteration and returns to the top of the loop.

#### do...while

For `do..while`, Javascript evaluates the condition *after* executing the loop body. The `do...while` loop always iterates at least once, but the `while` loop won't iterate at all if the condition is falsy. 

```javascript
var counter = 0;
var limit = 0;

do {
  console.log(counter);    // 0
  counter += 1;
} while (counter < limit); // runs once

counter; // 1
```

#### for

The `for` loop consists of an initial expression, a condition, and an increment expression. You can also place the condition outside the loop, check the condition/break out of the loop or increment the iterator manually, or omit the condition component entirely (JS assumes true).

```javascript
for (initialExpression; condition; incrementExpression) {
  // statements
}
```

The flow of execution for a `for` loop: 
* Execute the initialization statement
  * Evaluate the condition; the loop terminates here if the condition is falsy
  * Execute the body of the loop
  * Execute the increment expression
  * Return to the condition and repeat the iteration

<a name="errors"></a>
### Errors

* `ReferenceError`: when you reference a variable or function that does not exist.
```javascript
a;    // Referencing a variable that doesn't exist results in a ReferenceError.
a();  // The same is true of attempting to call a function that doesn't exist.
```

* `TypeError`: when you try to access a property on a value that does not have any properties, such as `null`, or try to call something that is not a Function
```javascript
var a;
typeof(a); // "undefined"

a.name;    // TypeError: Cannot read property 'name' of undefined

a = 1;
a();       // TypeError: Property 'a' is not a function
```

* `SyntaxError`: This error is detected solely from the text of the program (whereas `ReferenceError` and `TypeError` are dependent on variables and values encountered at runtime).

```javascript
function ( {}  // SyntaxError: Unexpected token (

// This one is raised at runtime
JSON.parse('not really JSON'); // SyntaxError: Unexpected token i in JSON at position 0
```

#### Preventing Errors

* Errors are normally caused by assumptions made in the program.
```javascript
function lowerInitial(word) {
  return word[0].toLowerCase(); // assumes word is a non-empty string
}

lowerInitial('');  // TypeError: Cannot read property 'toLowerCase' of undefined
```

* This can be fixed with a guard clause when you don't trust your program to always call `lowerInitial` with a non-empty String.
```javascript
function lowerInitial(word) {
  if (word.length === 0) {       // If word contains an empty String,
    return '-';                  // return a dash instead of proceeding.
  }

  return word[0].toLowerCase();  // word is guaranteed to have at least
}                                // 1 character, so word[0] never evaluates
                                 // as undefined.
```

* Errors can be prevented by detecting edge cases.
  * Start by writing out the common use cases and see how the Function should handle each one. Write the program for the happy cases and then revisit the edge cases and address them if necessary.

```javascript
var countries = ['Australia', 'Cuba', 'Senegal'];

alphaInsert(countries, 'Brazil');

console.log(countries.join(', '));     // Logs "Australia, Brazil, Cuba, Senegal"

// Cases
alphaInsert([], 'Brazil');             // Inserting in an empty Array
alphaInsert(['Brazil'], 'Australia');  // At the beginning of an Array
alphaInsert(['Brazil'], 'Cuba');       // At the end of an Array
alphaInsert(['Brazil'], 'Brazil');     // Duplicate entry

```

* It is not necessary to check for valid data types in most cases.

#### Catching Errors

* Use `try/catch/finally` to handle errors in the following cases:
  * A built-in Javascript function or method can throw an error and you need to prevent or handle that error
  * A simple guard clause is impossible or impractical to prevent the error.
```javascript
function parseJSON(data) {
  var result;

  try {
    result = JSON.parse(data);  // Throws an Error if "data" is invalid
  } catch (e) {
    // We run this code if JSON.parse throws an Error
    // "e" contains an Error object that we can inspect and use.
    console.log('There was a', e.name, 'parsing JSON data:', e.message);
    result = null;
  } finally {
    // This code runs whether `JSON.parse` succeeds or fails.
    console.log('Finished parsing data.');
  }

  return result;
}

var data = 'not valid JSON';

parseJSON(data);    // Logs "There was a SyntaxError parsing JSON data:
                    //       Unexpected token i in JSON at position 0"
                    // Logs "Finished parsing data."
                    // Returns null
```