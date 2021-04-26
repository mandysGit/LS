/*
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument and returns true if the word can be spelled using the set of blocks, false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

Problem
-------
Input: a word string
Output: boolean - true, false



Rules:
- letters can be case-insensitive
- return true if word can be spelled using set of blocks, otherwise false

What is a spelling block?
- two letters per block
- only use one letter from a given block
- blocks can only be used once

Data structure
--------------
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

- use an object to store the letters as keys
- the value will be false to indicate it hasn't been used yet

let blocks = {
  'bo': 'not used',
  'xk': 'not used',
  'dq': 'not used',
  'cp': 'not used',
  'na': 'not used',
  'gt': 'not used',
  're': 'not used',
  'fs': 'not used',
  'jw': 'not used',
  'hu': 'not used',
  'vi': 'not used',
  'ly': 'not used',
  'zm': 'not used',
}

Algo
----
- return 'not valid' for not string types
- return 'not valid' for empty string
- convert the letters from input word to lowercase
- initialize a look up table for blocks


- Iterate through each letter of the input word string
  - on each letter, Iterate over the `blocks` keys
    - If the block key includes the letter AND the key's value is 'not used' 
      - reassign the value to 'used'
      - continue
    - If key includes the letter AND the value is 'used'
      - return false

- return true 
*/

function isBlockWord(word) {
  if (typeof word !== 'string') return 'not valid';
  if (word.length === 0) return 'not valid';
  word = word.toLowerCase();
  
  let blocks = {
    'bo': 'not used',
    'xk': 'not used',
    'dq': 'not used',
    'cp': 'not used',
    'na': 'not used',
    'gt': 'not used',
    're': 'not used',
    'fs': 'not used',
    'jw': 'not used',
    'hu': 'not used',
    'vi': 'not used',
    'ly': 'not used',
    'zm': 'not used',
  }
  
  for (let letter of word) {    
    for (let key in blocks) {
      if (key.includes(letter) && blocks[key] === 'not used') {
        blocks[key] = 'used';
        continue;
      }
      
      if (key.includes(letter) && blocks[key] === 'used') return false;
    }
  }
  
  return true;
}


// VALID
console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('z'));         // true
console.log(isBlockWord('zB'));         // true


// INVALID
console.log(isBlockWord('BUTCH'));      // false

// use both letters from block
console.log(isBlockWord('ZM'));      // false

// use a block twice
console.log(isBlockWord('zoz'));      // false
console.log(isBlockWord('zoZ'));      // false

// DIFF INPUTS, output 'invalid'
console.log(isBlockWord([]));      
console.log(isBlockWord({}));
console.log(isBlockWord(undefined)); 
console.log(isBlockWord(null));
console.log(isBlockWord(1));
console.log(isBlockWord(true));  
console.log(isBlockWord());  

// EDGE CASE, output 'invalid'
console.log(isBlockWord('')); 


console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('floW'));       // true
console.log(isBlockWord('APPLE'));      // false
console.log(isBlockWord('apple'));      // false
console.log(isBlockWord('apPLE'));      // false
console.log(isBlockWord('Box'));        // false
