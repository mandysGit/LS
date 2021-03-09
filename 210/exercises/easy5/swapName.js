function swapName(name) {
  return name.split(' ').reverse().join(', ');
}

console.log(swapName('Joe Mandy Roberts'));    // "Roberts, Joe"
