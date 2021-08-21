// 1
let html = document.childNodes[1]; // skip doctype
let body = html.lastChild;         // skip head and text nodes
let heading = body.childNodes[1];  // skip text node
heading.style.color = 'red';
heading.style.fontSize = '48px';

// 2
count = 0;

for (let child of body.childNodes) {
  if (child.nodeName === 'P') {
    count++;
  }
}

console.log(count);

// Alternative solution
function walk(node, callback) {
  callback(node);

  for (let index = 0; index < node.childNodes.length; index += 1) {
    walk(node.childNodes[index], callback);
  }
}

let count = 0;
walk(document, node => {
  if (node.nodeName === 'P') {
    count++;
  }
});

console.log(count);                              // 5


// QUESTION 3
function walk(node, callback) {
  callback(node);

  for (let child of node.childNodes) {
    walk(child, callback)
  }
}

let words = [];

walk(document, function(node) {
  if (node.nodeName === 'P') {
    let text = node.firstChild.data.trim();
    let firstWord = text.split(' ')[0];
    words.push(firstWord);
  }
});

console.log(words)


// QUESTION 4
function walk(node, callback) {
  callback(node);

  for (let child of node.childNodes) {
    walk(child, callback)
  }
}

let paragraphs = [];

walk(document, function(node) {
  if (node.nodeName === 'P') {
    paragraphs.push(node);
  }
});

paragraphs.shift();

for (p of paragraphs) {
  p.classList.add('stanza')
}

console.log(paragraphs)

// LINK: https://d3905n0khyu9wc.cloudfront.net/the_dom/polar_bear_wiki.html

// QUESTION 5
function walk(node, callback) {
  callback(node);

  for (let child of node.childNodes) {
    walk(child, callback)
  }
}

let imageCount = 0;
let pngImagecount = 0;

walk(document, function(node) {
  if (node.nodeName === 'IMG') {
    imageCount++;
    imageLink = node.getAttribute('src')

    if (imageLink.includes('.png')) {
      pngImagecount++;
    }
  }
});

console.log(imageCount)
console.log(pngImagecount)

// QUESTION 6
function walk(node, callback) {
  callback(node);

  for (let child of node.childNodes) {
    walk(child, callback)
  }
}


walk(document, function(node) {
  if (node.nodeName === 'A') {
    node.style.color = 'red'
  }
});


// Using querySelector method
let paragraphs = document.querySelectorAll(".intro p");

for (let p of paragraphs) {
  p.classList.add("article-text");
}

