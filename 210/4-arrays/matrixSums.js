function matrixSums(arr) {
  return arr.reduce((totals, numbers) => {
    totals.push(sum(numbers));
    return totals;
  }, []);
}

function sum(arr) {
  return arr.reduce((sum, n) => sum + n, 0);
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]
