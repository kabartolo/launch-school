// Functions

// 1.

function average(a, b, c) {
  return (a + b + c) / 3;
}

console.log(average(1, 2, 3));

// 2. 

function sum(a, b, c) {
  return a + b + c;
}

function average(a, b, c) {
  return sum(a, b, c) / 3;
}

console.log(average(1, 2, 3));

// 3.

function average(number_array) {
  var total = 0;
  var num_digits = number_array.length

  for (var i = 0; i < num_digits; i++) {
    total += number_array[i];
  }

  return total / num_digits;
}

console.log(average([1, 2, 3, 4, 5]));

// 4.

function sum(number_array) {
  var total = 0;

  for (var i = 0; i < number_array.length; i++) {
    total += number_array[i];
  }

  return total;
}

function average(number_array) {
  return sum(number_array) / number_array.length
}

console.log(average([1, 2, 3, 4, 5]));

// 5.

var temperatures = [31, 0, 21, 15, 18];
console.log(average(temperatures));

// Variable Scopes 1

// 1.

var a = 'outer';

function testScope() {
  var a = 'inner';
  console.log(a);
}

console.log(a); // 'outer'
testScope();    // 'inner'
console.log(a); // 'outer'

// The first `console.log(a)` resolves `a` from the global variable defined in the outer scope. 
// The `a` defined inside the function is not available to the global scope as it is a new
// definition (not a reassignment of the global variable `a`). Therefore, `testScope()` 
// returns the value of local variable `a`, and the second `console.log(a)`
// resolves the global variable `a` with value 'outer'.

// 2.
var a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a); // 'outer'
testScope();    // 'inner'
console.log(a); // 'inner'

// The console first logs global variable `a` which has value 'outer' at this point.
// When testScope() is invoked, global variable `a` is reassigned to 'inner', and the console logs
// this value from the inner scope and again from the outer scope.

// 3.

var basket = 'empty';            // global `basket` assigned to string 'empty'

function goShopping() {
  function shop1() {
    basket = 'tv';               // global `basket` assigned to string 'tv'
  }

  console.log(basket);           // `basket` resolves to the global variable with value 'empty'

  function shop2() {
    basket = 'computer';         // global `basket` assigned to string 'computer' 
  }

  function shop3() {
    var basket = 'play station'; // local variable `basket` assigned to string 'play station'
    console.log(basket);         // `basket` resolves to the local variable with value 'play station'
  }

  shop1();                       // global `basket` assigned to string 'tv'
  shop2();                       // global `basket` assigned to string 'computer'
  shop3();                       // local `basket` assigned to string `play station`, console ouputs `play station`

  console.log(basket);           // `basket` resolves to global variable with value 'computer'
}

goShopping();

// 'empty'
// 'play station'
// 'computer'

// 4.

function hello() {
  a = 'hello';
}

hello();        // 
console.log(a); // 'hello'

// The hello() function defines a global variable `a` when it is invoked on line 5. 
// Being global, this variable is available everywhere, and 
// the console logs this value on line 6.

// NOTE: This is similar to the following: 

var a;

function hello() {
  a = 'hello';
}

hello();
console.log(a);

// 5.

function hello() {
  var a = 'hello';
}

hello();
console.log(a);   // Throws error, variable a not defined

// 6.

console.log(a);

var a = 1;        // undefined

// Due to hoisting, var a is declared before the remaining program is run. The console
// logs the value of a before it is assigned a value, so it has value undefined and the consol
// logs undefined.

// 7.

console.log(a);     // Uncaught ReferenceError: thing is not defined

function hello() {
  a = 1;
}

// hello() is defined but is never invoked so global variable a is never initialized.



// Variable Scopes 2

// 1.

function say() {
  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a);
}

say(); // undefined

// The declaration of a is hoisted to the top of the function body, but the if
// statement is never reached as its condition is false.
// This code is equivalent to:

function say() {
  var a;
  if (false) {
    a = 'hello from inside a block';
  }

  console.log(a);
}

say();

// 2.

function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

hello();        // 'hello'
console.log(a); // Uncaught ReferenceError

// 3. 
var a = 'hello';

for (var i = 0; i < 5; i += 1) {
  var a = i;
}

console.log(a); // 4

// The variable declaration is hoisted to the top of the program, but since a global variable
// `a` already exists, there is no effect on operation. 

// 4.

var a = 1;

function foo() {
  a = 2;
  function bar() {
    a = 3;
    return 4;
  }

  return bar();
}

console.log(foo()); // 4
console.log(a);     // 3

// foo() returns the return value of bar(), which is 4, so the console logs 4.
// Since both foo() and bar() have run, variable a has been reassigned to 2 and
// then 3, its final value, which is output on the last line.

// 5.

var a = 'global';

function checkScope() {
  var a = 'local';
  function nested() {
    var a = 'nested';
    function superNested() {
      a = 'superNested';
      return a;
    }

    return superNested();
  }

  return nested();
}

console.log(checkScope());    // 'superNested'
console.log(a);               // 'global'

// 6.

var a = 'outer';
var b = 'outer';

console.log(a); // 'outer'
console.log(b); // 'outer'
setScope(a);    
console.log(a); // 'outer'
console.log(b); // 'inner'

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}

// The function argument `foo` is a new local variable assigned to the value of `a` and
// then reassied to 'inner', but `a` remains assigned to 'outer'.

// 7.

var total = 50;
var increment = 15;

function incrementBy(increment) {
  total += increment;
}

console.log(total);     // 50
incrementBy(10);       
console.log(total);     // 60
console.log(increment); // 15 

// 8.

var a = 'outer';

console.log(a);         // 'outer'
setScope();           
console.log(a);         // Uncaught TypeError: setScopes is not a function at <anonymous>:4:1

var setScope = function () {
  a = 'inner';
};

// With hoisting, this is equivalent to:

var a;
var setScope;

a = 'outer';

console.log(a);
setScope();
console.log(a);

setScope = function() {
  a = 'inner';
};