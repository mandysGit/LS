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

  let primes = [];
  for (let i = 1; i < num; i++) {
    if (isPrime(i)) primes.push(i);
  }

  let result = [];
  for (let prime1 of primes) {
    for (let prime2 of primes) {
      let sum = prime1 + prime2;

      if (sum === num && !result.includes(prime1) && !result.includes(prime2)) {
        result.push(prime1, prime2); 
      }
    }
  }

  for (let index = 0; index < result.length; index += 2) {
    console.log(result[index], result[index + 1]);
  }
};

checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53

