let isPrime = (n) => {
  if (n <= 1) return false;

  for (let i = 2; i < n; i++) {
    if (n % i === 0) return false;
  }

  return true;
}

let checkGoldbach = (num) => {
  if (num % 2 === 1 || num < 4) {
    console.log(null);
    return;
  }

  // Get primes
  let primes = [];
  for (let i = 1; i < num; i++) {
    if (isPrime(i)) primes.push(i);
  }

  // Get sums
  let sums = [];
  for (let prime1 of primes) {
    for (let prime2 of primes) {
      let sum = prime1 + prime2;

      if (sum === num && !sums.includes(prime1) && !sums.includes(prime2)) {
        sums.push(prime1, prime2); 
      }
    }
  }

  // Log the sum pairs
  for (let index = 0; index < sums.length; index += 2) {
    console.log(sums[index], sums[index + 1]);
  }
};

// Sample Solution
let checkGoldbach2 = function(expectedSum) {
  if (expectedSum < 4 || expectedSum % 2 === 1) {
    console.log(null);
    return;
  }

  let num1 = 1;
  let num2;

  do {
    num1 += 1;
    num2 = expectedSum - num1;
    if (isPrime(num1) && isPrime(num2)) {
      console.log(num1, num2);
    }
  } while (num1 !== num2);
};

checkGoldbach2(3);
// logs: null

checkGoldbach2(4);
// logs: 2 2

checkGoldbach2(12);
// logs: 5 7

checkGoldbach2(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53

