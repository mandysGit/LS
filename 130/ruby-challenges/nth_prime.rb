=begin
Problem:
- program that tells you the nth prime

Algo for prime?:
- Obtain the square root of the number
- Start at 2 up to `squre_root`, but only smaller prime numbers
- Check if any of those numbers are factors of the given number
- If none of them are, then the given number is prime
=end

class Prime
  def self.nth(n)
    raise ArgumentError if n <= 0

    primes = [2]
    current_num = 3

    until primes.size == n
      primes << current_num if prime?(current_num, primes)
      current_num += 1
    end

    primes.last
  end

  def self.prime?(num, primes)
    square_root = Math.sqrt(num).to_i
    is_prime = true

    primes.each do |prime|
      break if prime > square_root
      is_prime = false if num % prime == 0
    end

    is_prime
  end
end
