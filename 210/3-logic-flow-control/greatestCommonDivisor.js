// Version 1
let gcd = (num1, num2) => {
  let divisors = [];
  let smallerNum = num1 < num2 ? num1 : num2;

  for (let i = 1; i < smallerNum; i++) {
    if (num1 % i === 0 && num2 % i === 0) divisors.push(i);
  }
  return divisors[divisors.length - 1];
}

// Version 2
let gcd2 = (num1, num2) => {
  let smallerNum = num1 < num2 ? num1 : num2;

  for (let i = smallerNum; i > 0; i--) {
    if (num1 % i === 0 && num2 % i === 0) return i;
  }
}

console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1

// Further Exploration - Recursion
let gcdRecursive = (arr) => {
  if (arr.length === 2) {
    let num1 = arr[0];
    let num2 = arr[1];
    let smallerNum = num1 < num2 ? num1 : num2;

    for (let i = smallerNum; i > 0; i--) {
      if (num1 % i === 0 && num2 % i === 0) return i;
    }
  }
  
  let nums = [arr[0], gcdRecursive(arr.slice(1))];
  return gcdRecursive(nums);
}

console.log(gcdRecursive([12, 4, 8]));   // 4
console.log(gcdRecursive([2940, 3150, 294]));   // 42
console.log(gcdRecursive([7, 10, 81]));   // 1
console.log(gcdRecursive([22, 122, 344, 480, 68, 48]));   // 2
