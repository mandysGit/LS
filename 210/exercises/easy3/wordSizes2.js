function wordSizes(str) {
  if (str === '') return {};

  let result = {};
  str.split(' ').forEach(word => {
    let key = size(word);
    if (key in result) {
      result[key] += 1;
    } else {
      result[key] = 1;
    }
  });

  return result;
}

function size(word) {
  let removeSymbols = word.replace(/[^a-z]/ig, '');
  return removeSymbols.length;
}
console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes("What's up doc?"));                              // { "2": 1, "4": 1, "6": 1 }
console.log(wordSizes(''));                                            // {}

