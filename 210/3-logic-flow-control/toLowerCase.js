function toLowerCase(string) {
  let result = '';

  for (let i = 0; i < string.length; i++) {
    let ascii = string.charCodeAt(i);
    if (ascii > 64 && ascii < 91) {
      result += String.fromCharCode(ascii + 32);
    } else {
      result += string[i];
    }
  };

  return result;
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"
