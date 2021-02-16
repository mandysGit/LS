function triangle(n) {
  let spaces = n;
  let stars = 0;

  while (spaces >= 0) {
    console.log(' '.repeat(spaces) + '*'.repeat(stars));
    stars++;
    spaces--;
  };
}

triangle(5);
triangle(9);
