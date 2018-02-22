# Douglas Crockford Lecture: [Javascript the Good Parts](https://www.youtube.com/watch?v=hQVTIJBZook)
## With notes from the book of the same name

* Javascript is "basically Scheme with C syntax"
* Influences from:
  * Self
    * prototypal inheritance
    * dynamic objects
  * Scheme
    * lambda
    * loose typing
  * Java
    * syntax (from C)
    * conventions
  * Perl
    * regular expressions

* Testing is done in roughly the same amount with and without strict typing. Programs are simpler with loose typing.

### Bad Parts
* Global variables (global namespace)
  * enables cross-site scripting attacks
* `+` adds and concatenates
  * unpredictable without strong typing
* Semicolon insertion
  * Intended to make its C-like syntax easier for beginners by inserting semicolons for you.
  * When the compiler gets an error, it backs up to look for a line feed and turns it into a semicolon (then tries again). This does not usualyl work as expected. 
* typeof
  * `typof null` returns object (wrong)
  * `typeof [1, 2, 3]` returns object (not useful)
* `with` causes programs to be slow just by being in the language and is not useful.
* `eval` is not useful.
* phony arrays (arrays are actually objects)
  * arrays are hash tables in which keys are turned into strings and then hashed to locate the buckets. Performance penalty. Advantage is does allow you to avoid dimensioning an array.
* `==` and `!=` does type coercion, which does not follow transitivity and can act surprisingly.
* too many bottom values: `false`, `null`, `undefined`, `NaN`
  * Beginners may use `null` instead of `undefined` to check if an object has a property. Using null does not work for all cases.

```javascript
value = myObject[name];
if (value == null) {
alert(name + ' not found.');
}
// Two errors that cancel each other out
```

* Good features that interact badly:
  * Objects can inherit from other objects
  * Functions can be members of objects (methods)
  * `for..in` statement mixes inherited functions with the desired data members.
    * The designers decided to do a deep dredge (vs. shallow sweep), meaning the programmer must explicitly filter out the deep members, but they did not tell anyone about it => confusion.
* Bad heritage
  * Blockless statements allowed `if (foo) bar();`
  * expression statements (that do nothing): `foo;`
  * Floating point arithmetic `0.1 + 0.2 !== 0.3` (an issue with the chosen number type)
  * `++` and `--` operators: convenient but have been implicated in buffer overruns and other security hazards. Better to avoid them altogether.
  * `switch`
    * One case can fall through into the next case without a `break` statement. This can be useful but cause bugs.

### Good Parts

* Lambda
* Dynamic objects
* Loose typing
* Object literals

#### Inheritance

* Inheritance is object-oriented code reuse.
  * Classical (most languages)
  * Prototypal (mostly just Javascript)
* Prototypal inheritance
  * Class-free
  * Objects inherit from objects using a hidden link to another object; this is called **delegation**.
  * **Differential inheritance**
```javascript
var newObject = Object.create(oldObject);
```

* `new`
  * **required** when calling a Constructor function
  * If omitted, the global object is clobbered by the constructor
  * No compile-time or run-time warning, making `new` dangerous to use

#### The Global Namespace

```javascript
var names = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

var digit_name = function (n) {
  return names[n];
};

alert(digit_name(3)); // "three"
```

* The problem with this program is `names` is a global variable and other variables called `names` in the program or libraries, the program could fail.
* How do we deal with them?
```javascript
// The slow way 
// Defines `names` as a private variable (works due to function scope)
// The `names` array must be re-initialized each time this function is called!

var digit_name = function (n) {
  var names = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

  return names[n];
}

alert(digit_name(3)); // "three"

```javascript
// Using a closure

var digit_name = function () {
  var names = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

  return function (n) {
    return names[n];
  };
}();

alert(digit_name(3)); // "three"
```

* This can be generalized to a constructor pattern that works due to *closures* (see video).

#### Style
```javascript
return      // semicolon insertion
{           // block, unreachable statement
  ok: false // expression, semicolon insertion
};          // empty statement (from semicolon)
// silent error!

// equivalent to:
return;
{
  ok: false;
}

// better
return {
  ok: true
};
// Works well in Javascript
```

* Javascript uses semicolon insertion. It automatically inserts a semicolon after `return` in the first example because it doesn't see one there and hits the end of the line.