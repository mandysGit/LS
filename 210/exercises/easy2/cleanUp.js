function cleanUp (str) {
  let removeNonAlpha = str.replace(/[^a-z]/gi, ' ');
  let trimSpaces = removeNonAlpha.replace(/ +/g, ' ');
  return trimSpaces;
}

function cleanUp(text) {
  return text.replace(/[^a-z]+/gi, ' ');
}

function cleanUp(string) {
  return string.replace(/(\W)+/g, ' ');
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "
