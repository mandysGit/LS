// Problem 1
function walk(node, callback) {
  callback(node);  
  
  for (let child of node.childNodes) {
    walk(child, callback)
  }
}

function findAllParagraphs() {
  let paragraphs = [];

  walk(document, function(node) {
    if (node.nodeName === 'P') {
      paragraphs.push(node)
    }
  }); 

  return paragraphs;
}

findAllParagraphs();

// Problem 2
function addArticleTextClass() {
  walk(document, function(node) {
    if (node.nodeName === 'P') {
      node.classList.add('article-text')
    }
  }); 
}

addArticleTextClass();

// Problem 3
let paragraphs = [...document.getElementsByTagName('p')];

paragraphs.forEach((p) => {
  p.classList.add("article-text")
})

console.log(paragraphs)


// Problems Group 2, #2
let intros = [...document.getElementsByClassName('intro')]

intros.forEach(div => {
  let paragraphs = [...div.getElementsByTagName('p')];
  paragraphs.forEach(p => p.classList.add('hello'))
});
