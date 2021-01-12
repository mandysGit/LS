let apples = 3;
let bananas = '5';

if (apples === bananas) {
  console.log('same value, same type');
} else {
  if (apples == bananas) {
    console.log('Same value, but different types');
  }
  else {
    console.log('Not strictly equal');
  }
}

apples = 3;
bananas = 3;
areEqual = (apples === bananas);
  
apples = 3;
bananas = undefined;
eitherOr = apples || bananas;
console.log(eitherOr);

bananas = 1;
eitherOr = apples || bananas;
console.log(eitherOr);
eitherOr = bananas || apples;
console.log(eitherOr);

let lastName = 'smith';
let familyMessage = lastName === 'smith' ? "you're part of the family" : "you're not family";

console.log(familyMessage);
