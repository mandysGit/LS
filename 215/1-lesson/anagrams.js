function anagram(word, list) {
  return list.filter(w => isAnagram(w, word));
}

function isAnagram(word1, word2) {
 return word1.split('').sort().join('') === word2.split('').sort().join('');
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
