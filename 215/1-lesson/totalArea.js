let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

function totalArea(arr) {
  let areas = arr.map(rectangle => rectangle[0] * rectangle[1]);
  let total = areas.reduce((acc, current) => acc + current);
  return total
}

console.log(totalArea(rectangles));    // 141
