# 210: Computational Thinking and Javascript Programming

## Basics

* [The Javascript Language](#javascript-language)
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

<a name="javascript-language"></a>
### The Javascript Language

Note: This section comes from [How Javascript Works](https://blog.sessionstack.com/how-does-javascript-actually-work-part-1-b0bacc073cf) and is not required Launch School material.

* A Javascript engine is a program or interpreter that executes Javascript code (e.g., V8, Rhiny, SpiderMonkey)
* V8 was built by Google and is used in Google Chrome and Node.js

* Javascript is a single-threaded programming language; it has a single call stack.
* This means it can do only one thing at a time.
* The call stack is a data structure that gives the location of the program. Stepping into a function puts it on the top of the stack; returning from a function pops it from the top of the stack.

```javascript
// When the Javascript engine starts executing, the call stack is empty.

function multiply(x, y) {    // Stack Step 2: printSquare(5), multiply(x, x)
    return x * y;
}

function printSquare(x) {    // Stack Step 1: printSquare(5)
    var s = multiply(x, x);  
    console.log(s);          // Stack Step 3: printSquare(5), console.log(s)
                             // Stack Step 4: printSquare(5)
}
               

printSquare(5);
// The call stack empties when printSquare returns

```

* Given that Javascript is single-threaded, too many tasks in the call stack can slow the browser.
* **Asynchronous callbacks** allow execution of heavier code.

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
var saveName = name; // saveName points to same string 'Bob' (but it is passed the value, not the reference)
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

#### Booleans
  `true` and `false`

#### Strings
  * Javascript strings have *no* size limit.
  * There is no functional distinction between single- and double-quoted Strings.
  * Use `+` to **concatenate** strings. You can use `\` at the end of a line (within the quotation marks) to ignore newlines and concatenate lines of strings (warning: Javascript will treat any spaces or tabs after the `\` as literal and then fail to find the closing quote mark). 
  * Strings can hold any character in the UTF-16 character set.
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

Operators tell the computer to perform operators on values (operands)

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
  * For non-boolean values, returns the first operand if it can be converted to `false`, the second operator otherwise
* Logical Or (`||`)
  * Returns `true` if at least one operand is true, `false` otherwise
  * For non-boolean values, returns the first operand if it can be converted to `true`, the second operand otherwise
* Logical Not (`!`)
  * Returns `true` if its operand can be converted to false, `false` otherwise
  * This is a unary operator (it takes only one operand).

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

#### Logical Short Circuit Evaluation in Expressions

The short-circuit rules for evaluation logical And (`&&`) and logical Or (`||`):
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
var c = (var a = 1);  // this gives an error, since a statement can't be used as part of an expression
```

```javascript
var myNumber = 3; // both a statement and an expression, but returns undefined
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

`Number()` turns a string that contains a numeric value into a number or returns `NaN` if the string cannot be converted.

`parseInt()` and `parseFloat()` turn strings to numbers, but `parseInt()` will only return an integer. 

```javascript
parseInt('453.6', 10);  // 453
parseFloat('453.6');    // 453.6
```

#### Numbers to Strings

The `String()` function turns numbers into strings: `String(123); // "123"`

The `toString()` method can be called on numbers: `(123).toString(); // "123"`

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

* Use the `Boolean()` function to convert any value to a boolean based on the truthy and falsy rules of Javascript. This cannot be used to coerse string representations of `true` and `false`, however, since `Boolean('false')` returns `true`. 

* The double `!` operator is a simpler way to convert truthy or falsy values to the boolean equivalents. For example, `!!(null)` returns `false`

<a name="primitive-type-coercions-implicit"></a>
### Implicit Primitive Type Coercions

When two values of different types are used as operands in expressions, Javascript attempts to convert one value to a type it can operate on. 

Programmers should be aware of implicit type coercion but should avoid them. The intent of this kind of code can be unclear, and bugs are much more likely and difficult to detect. 

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

#### Equality Operators

* Javascript's strict operators (`===` and `!==`) never perform type coercions. With this operator, two operands are only equal if they are both the same type and have the same value.

* The non-strict equality operators (`==` and `!=`) work the same way as the strict equality operators when the operands are of the same type. When they are of different types, Javascript implicitly coerces them to the same type before comparing them.
  * When one operand is a string and the other a number, the string is converted to a number: `0 == '' // true (0 == 0)`
  * When one operand is a boolean, it is converted to a number: `'0' == false // true ('0' == 0 then 0 == 0, two conversions)`
  * When `null` is compared to `undefined` using the non-strict equality operator (`==`), it always returns `true`. It returns `false` when `null` or `undefined` is compared to any other value: `null == false // false` but `null == undefined // true`
  * `==` always returns `false` if either or both of the operands is `NaN`

#### Relational Operators

* `<`, `>`, `<=`, `>=` are defined for numbers and strings.
* There are no strict versions of these operators. 
* Operands are converted to numbers before comparison unless both operands are strings, in which case Javascript compares the strings lexicographically: `true > null // true (1 > 0)`

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

However, the `switch` will continue to the next cases until it reaches `default` or a `break` statement. To force the `switch` to stop after the first one match, insert a `break` statement to each `case` statement.

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

A `while` loop evaluates the condition first and then executes the block statements if the condition has a truthy value. When execution reaches the end of the block, control is passed back to the conditional expression and the process is repeated until the condition is falsy. This can result in an infinite loop of the condition is never falsy.

#### Break and Continue

The `break` statement exits from a loop immediately. The `continue` statement skips the current iteration and returns to the top of the loop.

### do...while

For `do..while`, Javascript evaluates the condition *after* executing the loop body. The `do...while` loop always iterates at least once, but the `while` loop won't iterate at all if the condition is falsy. 

```javascript
var counter = 0;
var limit = 0;

do {
  console.log(counter);
  counter += 1;
} while (counter < limit);
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