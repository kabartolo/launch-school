// Variables and numbers
var numerator = 10;
var denominator = 2;
var incrementor;
var start;
var end;
var difference;
var answer;

answer = numerator / denominator;

console.log(answer); // 5

incrementor = 1;
start = incrementor;

incrementor += 1;
incrementor += 1;
incrementor += 1;

incrementor++;
incrementor++;

end = incrementor;
difference = end - start;

console.log(end); // 6
console.log(difference); // 5

answer = (11 + 31) * 3;
console.log(answer); // 126

// Primitive Types and Type Coercion

// 1.
var x = '13';
var y = 9;

console.log(Number(x) + y);

// 2.

var x = '13';
var y = 9;

console.log(x * y); // the result is a number since * is defined only for numbers.

// 3.

var npa = 212;
var nxx = 555;
var num = 1212;

console.log(npa.toString() + nxx.toString() + num.toString());

// 4.

console.log(String(npa) + String(nxx) + String(num));

// 5.

var bool = true;
var arr = [1, 2, 3];

console.log(bool.toString());
console.log(arr.toString());

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

// Operators and Conditionals

// 1.

var apples = 3;
var bananas = 5;

if (apples == bananas) {
  console.log("There is an equal number of apples and bananas.");
}

// 2.

bananas = '3';

if (apples == bananas) {
  console.log("There is an equal number of apples and bananas.");
}

// 3.

if (apples === bananas) {
  console.log("There is an equal number of apples and bananas.");
}

// A message is not output because the types do not match and no conversion occurs
// with the === operator. Since they are not strictly equal, the if condition is false.

// 4.

if (apples === bananas) {
  console.log("Strictly equal.");
} else {
  console.log("Not strictly equal.");
}

// 5.

if (apples === bananas) {
  console.log("Strictly equal.");
} else if (apples == bananas) {
  console.log("Equal but not of the same type.");
}

// 6.

if (apples === bananas) {
  console.log("Strictly equal.");
} else {
  if (apples == bananas) {
    console.log("Equal in value but not of the same type.");
  } else {
    console.log("Not equal in value.");
  }
}

// 7.

apples = 3;
bananas = 3;
var areEqual = (apples === bananas);

console.log(areEqual);

// 8.

apples = 3;
bananas = undefined;

var eitherOr = (apples || bananas);
console.log(eitherOr);

// 9.

bananas = 1;
eitherOr = (apples || bananas);
console.log(eitherOr);

eitherOr = (bananas || apples);
console.log(eitherOr);

// 10.

var lastName = 'Adair';
var familyMessage  = lastName === 'Adair' ? "You're part of the family!" : "You're not family.";