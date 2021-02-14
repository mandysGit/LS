let stringy = (n) => {
  let string = '';
  let bit = '1';
  while (n > 0) {
    string += bit;
    bit = bit === '1' ? '0' : '1';
    n--;
  }

  return string;
}
console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"
