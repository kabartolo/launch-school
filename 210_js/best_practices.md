# Javascript Best Practices

In general, be explicit and clearly show your intentions.

## Basics

* Always use explicit type coercions, not implicit type coercions.
* Always use strict equality operators (`===` and `!==`)

* Avoid unneeded ternary statements:
```
// bad
var foo = a ? a : b;
var bar = c ? true : false;
var baz = c ? false : true;

// good
var foo = a || b;
var bar = !!c;
var baz = !c;
```

## Function and Variable Declaration

* Always declare variables at the top of their scope
* Always declare functions before calling them

### Functions

* Never declare a function in a non-function block (`if`, `while`, etc).

```
// bad
if (currentUser) {
  function test() {
    console.log('Nope.');
  }
}

// good
var test;
if (currentUser) {
  test = function () {
    console.log('Yup.');
  };
}
```

* Never name a parameter `arguments`. This takes precedence over the `arguments` object that is given to every function scope.

```
// bad
function nope(name, options, arguments) {
  // ...stuff...
}

// good
function yup(name, options, args) {
  // ...stuff...
}
```