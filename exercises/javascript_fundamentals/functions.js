// 1.

var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar); // 'This is global'

// This logs 'This is global' because someFunction() creates a new local variable myVar when it's called.
// In the global scope, the console logs the global variable myVar, which has value 'This is global', since
// the myVar declaration within the function has no effect on the global scope.

// 2.

var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction(); // 'This is local'

// The console outputs from the local scope (inside the someFunction() definition). Javascript searches
// the local scope for a variable named myVar and founds the one with value 'This is local'. This variable
// shadows the global variable with the same name. Thus, 'This is local' is what is output.

// 3.

var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar); // 'This is local'

// In the global scope, a variable myVar is assigned to the string 'This is global'.
// When someFunction() is called, Javascript searches the scope hierarchy for a variable named
// myVar. Since inner scopes have access to outer scopes, it finds a variable myVar in the global scope and reassigns 
// it to the string 'This is local'.
// In the global scope again, the console logs the value of the global variable, which is now 'This is local'.

// 4. 

var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction(); // 'This is global'

// Javascript first checks the local scope for a variable called myVar and when
// it doesn't find one, it checks the global scope and finds it. The value
// 'This is global' is then logged.

// 5.

function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar); // 

// Because there is no keyword `var` in the declaration (no variable declaration), 
// Javascript searches the outer scope for the declaration. Not finding one, it binds
// myVar to the global object (which is almost as if myVar were globally declared).

// 6.

var a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);     
console.log(a); // 7

// Since Javascript is pass by value, when `a` is passed to function myValue(b), the local variable
// b' is bound to the value of `a`, but changing `b` has no effect on `a`.

// 7.

var a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a); // 7

// The function myValue's local variable `a` shadows the global variable `a`. Since Javascript
// is also pass by value, changing local variable `a` (which initially references the same value
// as local variable `a`) has no effect on global `a`.

// 8.

var a = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(a);
console.log(a); // [1, 2, 10]

// The local variable `b` is assigned to the same value that `a` references (the array in global scope).
// When `b[2] += 7` is executed, it is executed on the array object itself, since the value of passed objects
// is the reference to the object.

// 9.

console.log(a); // undefined

var a = 1;

// Due to hoisting, this is equivalent to:

var a;
console.log(a);
a = 1;

// 10.

logValue();

function logValue() {
  console.log('Hello, world!'); // 'Hello, world!'
}

// Due to hoisting, the function is declared first and can be run on line 1.
// With function declaration, both the function and the body are hoisted.

// Further exploration:

var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue); // 'string'

// When both a function declaration and variable declaration exist, the function declaration is
// hoisted first. The function (and body) are hoisted first with variable logValue. They have
// the same name, so Javascript treats the local variable assignment as reassignment. 
