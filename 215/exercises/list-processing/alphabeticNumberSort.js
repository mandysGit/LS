function alphabeticNumberSort(arr) {
  let obj = {};
  let result = [];
  let englishWords = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

  arr.forEach((n, i) => obj[englishWords[i]] = n)
  englishWords.sort();
  englishWords.forEach(word => {
    result.push(obj[word]);
  })

  return result;
}

function wordSort(n1, n2) {
  const WORDS = ['zero', 'one', 'two', 'three', 'four', 'five',
                        'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
                        'twelve', 'thirteen', 'fourteen', 'fifteen',
                        'sixteen', 'seventeen', 'eighteen', 'nineteen'];

  if (WORDS[n1] > WORDS[n2]) {
    return 1;
  } else if (WORDS[n1] < WORDS[n2]) {
    return -1
  } else {
    return 0;
  }
}

function alphabeticNumberSort(arr) {
  return arr.sort(wordSort);
}

console.log(alphabeticNumberSort(
   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
