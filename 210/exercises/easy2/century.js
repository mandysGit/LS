function century(year) {
  let prefix = Math.ceil(year/100);
  return prefix.toString() + generateSuffix(prefix);
}

function generateSuffix(n) {
  let str = n.toString();
  let lastDigit = str[str.length - 1];
  let lastTwoDigits = n % 100;

  if ([11, 12, 13].includes(lastTwoDigits)) {
    return 'th';
  } else if (lastDigit === '1') {
    return 'st';
  } else if (lastDigit === '2') {
    return 'nd';
  } else if (lastDigit === '3') {
    return 'rd';
  } else {
    return 'th';
  }
}
console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"

