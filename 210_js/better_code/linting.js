// The following code snippets show violations of the Airbnb Javascript style guide
// and solutions to those problems.

// Use single quotes for strings unless the string contains single quotes
var title = "The Three-Body Problem"; // bad
var title = 'The Three-Body Problem'; // good

// Use one declaration per variable
// This makes it easier to add or rearrange variables.
// Also, use camelCase for variable names.

// bad
var title = 'The Three-Body Problem',
    author = 'Cixin Liu',
    page_count = 400;

// good
var title = 'The Three-Body Problem';
var author = 'Cixin Liu';
var pageCount = 400;

// Use ===, not ==

// bad
var completed = lastPageRead == 400;

// good
var completed = lastPageRead === 400;

// Although Javascript allows the omission of braces, they should be included
// for all multi-line blocks.

// bad
if (finishedBook())
  console.log('You have finished reading this book');

// good
if (finishedBook()) {
  console.log('You have finished reading this book');
}

// Use two spaces per indentation level
// Declare variables at the start of the program.
// Use += 1 isntead of the unary incrementor operator ++
// Insert one space on either side of every operator
// Convert variables explicitly rather than rely on implicit coercion in concatenation.

// bad
function read(pages) {
      console.log('You started reading.');
      for (var i=0; i<pages; i++) {
              var message = 'You read page '+i;
              console.log(message);
      }
}

read(400);

// Good
function read(pages) {
  var i;
  var message;

  console.log('You started reading.');
  for (i = 0; i < pages; i += 1) {
    message = 'You read page ' + String(i);
    console.log(message);
  }
}

read(400);