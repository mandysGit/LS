/*
The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers Canadian Social Insurance Numbers.

The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number.
This number must pass the following test:

    Counting from the rightmost digit and moving left, double the value of every second digit
    For any digit that thus become 10 or more, subtract 9 from the result
        1111 becomes 2121
        8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
    Add all these digits together
        1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
        8763 becomes 7733, and 7 + 7 + 3 + 3 is 20

If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.

Additional feature: Write a function that can add a check digit to make the number valid per the Luhn formula and return the original number plus that digit. This should give "2323 2005 7766 3554" in response to "2323 2005 7766 355". 

"2323 2005 7766 355" -> "2323 2005 7766 3554"

Problem
-------
Luhn formula Rules:
- verifies a number against its included check digit
- check digit is appended to a partial number to generate the full number

- Number must pass these cases:
    1) From right to left, double the value of every second digit. 1111 -> 2121
      - Any digit that is > 10, minus 9 from the result
      - 8763 -> 7733 (2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
    2) Sum all the digits to get checksum
      - 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
      - 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20
      
- IF checksum's modulo 10 is 0, VALID
- otherwise invalid


Input: String that's a number value
Output: return true or false 

Algo
----
- Reverse the input string
  - Convert the string to an array of elements
  - reverse the array
  - join the array back to a string

- initialize result = []
- Iterate over the reversed string
  - On every odd index
      - coerce the element into a Number
      - multiply the value by 2
      - IF the value is > 10, minus it by 9
      - push the value to result array
  - On even index, push the coerced Number to the result

- initialize sum = 0;
- SUM the result
- Iterate over each string element
- add it to sum

- Get the remainder of sum by dividing it by 10. If it's 0, return true, otherwise false
*/
function luhnCheckDigit(str) {
  let count = 0;
  let newStr = str;

  while (!luhn(newStr)) {
    newStr = str + String(count);
    count += 1;
  }

  return newStr;
}

function luhn(str) {
  if (str.length === 0) return 'invalid';
  let clean = str.replace(/\D/g, '');
  let reverse = clean.split('').reverse().map(Number);
  let result = [];

  reverse.forEach((number, idx) => {
    if (idx % 2 !== 0) {
      number *= 2;
      if (number >= 10) number -= 9;
      result.push(number);
    } else {
      result.push(number);
    }
  })
  
  let sum = result.reduce((acc, current) => acc + current);
  return sum % 10 === 0
}

// Test Cases
// VALID
console.log(luhn("2323 2005 7766 3554")) 
console.log(luhn("8763")) 
console.log(luhn("0")) 


// INVALID
console.log(luhn("1111")) 
console.log(luhn("5000")) 
console.log(luhn("10")) 
console.log(luhn("10a")) 
console.log(luhn("a1asdfasdfs")) 
console.log(luhn("50")) 

// CHECK DIGIT
console.log(luhnCheckDigit("2323 2005 7766 355")) // 2323 2005 7766 3554
console.log(luhnCheckDigit("876")) 
console.log(luhnCheckDigit("1111")) 
console.log(luhnCheckDigit("8763")) 
