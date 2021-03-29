function octalToDecimal(numberString) {
  let arr = numberString.split('').map(n => Number(n)).reverse();
  let exp = 0;

  return arr.reduce((acc, current) => {
    exp += 1;
    return acc + (current*(8**exp))
  })
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
