let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

function totalSquareArea(arr) {
  let squares = arr.filter(rectangle => rectangle[0] - rectangle[1] === 0);
  let areas = squares.map(rectangle => rectangle[0] * rectangle[1]);
  return areas.reduce((acc, current) => acc + current);
}

console.log(totalSquareArea(rectangles));    // 121
