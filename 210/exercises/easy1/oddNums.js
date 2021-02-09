let oddNums = () => {
  let count = 1;
  while (count <= 99) {
    if (count % 2 !== 0) console.log(count);
    count++;
  }
}

oddNums();

// Further Exploration
let oddNumsFurther = (start, end) => {
  let count = start;
  do {
    if (count % 2 !== 0) console.log(count);
    count++;
  } while (count < end);
};

oddNumsFurther(1, 55);

