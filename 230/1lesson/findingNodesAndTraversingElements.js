// HTML https://d3905n0khyu9wc.cloudfront.net/the_dom/polar_bear_wiki.html

// 1) 

// SOLUTION 1
function walk(node, callback) {
  callback(node);  
  
  for (let child of node.childNodes) {
    walk(child, callback)
  }
}

let wordCounts = [];

walk(document.body, node => {
  if (node.nodeName === "H2") {
    wordCounts.push(node.textContent.trim().split(' ').length);
  }
}); 

console.log(wordCounts)

// SOlUTION 2
let hs2s = document.querySelectorAll('h2');
let h2sArray = [...h2s];
h2sArray.map(node => node.textContent.trim().split(' ').length);

console.log(h2sArray)

// 2)
document.getElementById('toc')
document.querySelectorAll('.toc')[0]
document.querySelector('#toc')


// 3)
let links = document.querySelectorAll('.toc a')
let linksArray = [...links]

linksArray.forEach((link, index) => {
  if (index % 2 !== 0) {
    link.style.color = 'green'
  }
})

// 4)
let thumbcaptionArray = [...thumbcaption]

let captions = thumbcaptionArray.map((caption) => {
  let text = caption.textContent.trim();
  return text;
})

console.log(captions)

// 5)
let keys = ['Kingdom', 'Phylum', 'Clade', 'Class', 'Order', 'Suborder', 'Family',
            'Genus', 'Species'];
            
let classification = {};

let tableData = document.querySelectorAll(".infobox td");

for (data of tableData) {
  for (key of keys) {
    if (data.textContent.includes(key)) {
      classification[key] = data.nextElementSibling.textContent
    }
  }
}

console.log(classification)
