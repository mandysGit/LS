/* The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase letters 'A'-'Z' are also equivalent to 0-25.

Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character. To make this more concrete, let's look at the following example:

plaintext: Pineapples don't go on pizzas!
keyword: meat

Applying the Vigenere Cipher for each alphabetic character:
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

result: Bmnxmtpeqw dhz'x gh ar pbldal!

Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').

Problem
-------
- Vigenere Cipher encrypts text using polyalphabetic substituion alphabets
  - uses several caesar ciphers based on the letters of a `keyword`
  - each letter of the `keyword` is treated as a `shift value`

- What is a `shift value`?
  - shift value is equal to the index value in alphabet
  - a-z/A-Z are equivalent to 0 - 25, case insensitive
  - `B` - shift value 1
  - `d` - shift value 3

- To apply the Vigenere Cipher
  - done on each character one at a time
  - A CAESAR CIPHER is applied on each character
  
- What is the Ceasar Cipher?
  - get the shift value for the input letter
  - add the input shift value with keyword letter shift value 
  - If it's greater than 25, minus 26

Rules: 
- only apply the ceasar cipher on alphabets, NOT on non-alpha chars
- the keyword letter isn't moved forward for no-alpha chars
- case insensitive, both inputs
- if the keyword letter is the same as the input letter, don't need to encrypt

Input: 
- a text of alpha and/or non alpha characters, case insensitive
- keyword, case insensitive

Output: encrypted String

Algo
----
- const alphabet = 'abcdefghijklmnopqrstuvwxyz'
- initialize keywordIdx = 0 
- result = ''

- Iterate over the input chars
  - IF toLowerCase letter is not an alphabetic letter
    - concat input letter to result
    - continue
  - ELSE
    - get keywordLetter, keyword[keywordIdx]
    - GET shiftvalue value. shiftValue(keywordLetter, inputLetter)
    - look up the `new letter` in the alphabet using shift value
    - IF input letter is not in apphabet, capitalize the new letter
    - concat the new letter to result
    - increment keywordIdx by 1
    - If keywordIdx is the length of keyword, reassign keywordIdx to zero

- return result


shiftValue(letter1, letter2)
- toLowercase both letter1 and letter2
- If the are the same letter, return the index of letter 1
- get the index value in alphabet of letter1
- get the index value in alphabet of letter2
- value = Add the two indexes together
- IF the value is greater than 25, minus 26 from value
- return the shift value
*/
const alphabet = 'abcdefghijklmnopqrstuvwxyz';

function cipher(text, keyword) {
  let keywordIdx = 0;
  let result = '';
  
  for (const letter of text) {
    if (!alphabet.includes(letter.toLowerCase())) {
      result += letter;
      continue;
    } else {
      let keywordLetter = keyword[keywordIdx];
      let value = shiftValue(keywordLetter, letter);
      let newLetter = alphabet[value];
      
      if (!alphabet.includes(letter)) newLetter = newLetter.toUpperCase();
      result += newLetter;
      keywordIdx += 1;
      
      if (keywordIdx === keyword.length) keywordIdx = 0;
    }
  }
  
  return result;
}

function shiftValue(letter1, letter2) {
  letter1 = letter1.toLowerCase();
  letter2 = letter2.toLowerCase();
  
  if (letter1 === letter2) return alphabet.indexOf(letter1);

  let value = alphabet.indexOf(letter1) + alphabet.indexOf(letter2);
  
  if (value > 25) value = value - 26;
  
  return value;
}


// VALID
console.log(cipher('MEat', 'meat') === 'MEat');
console.log(cipher("Pineapples don't go on pizzas!", 'meat') === "Bmnxmtpeqw dhz'x gh ar pbldal!");
console.log(cipher('', 'meat') === '');
console.log(cipher('123', 'meat') === '123');
console.log(cipher('1m', 'mEat') === '1m');
console.log(cipher('1mp', 'meat') === '1mt');

console.log(cipher("Pineapples don't go on pizzas!", 'A') === "Pineapples don't go on pizzas!");
console.log(cipher("Pineapples don't go on pizzas!", 'Aa') === "Pineapples don't go on pizzas!");
console.log(cipher("Pineapples don't go on pizzas!", 'cab') === "Riogaqrlfu dpp't hq oo riabat!");
console.log(cipher("Dog", 'Rabbit') === 'Uoh');
