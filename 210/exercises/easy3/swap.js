function swap(str) {
  let arr = str.split(' ').map(word => {
    let chars = word.split('');
    [chars[0], chars[chars.length - 1]] = [chars[chars.length - 1], chars[0]];
    return chars.join('');
  });

  return arr.join(' ');
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"
