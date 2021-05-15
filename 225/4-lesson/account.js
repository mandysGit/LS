function makeBank() {
  let accounts = [];

  function makeAccount(number) {
    let balance = 0;
    let transactions = [];

    return {
      balance() {
        return balance;
      },
      transactions() {
        return transactions;
      },
      number() {
        return number;
      },
      deposit(amount) {
        balance += amount
        transactions.push({type: "deposit", amount});
        return amount;
      },
      withdraw(amount) {
        if (balance < amount) {
          amount = balance;
        }

        balance -= amount;
        transactions.push({type: "withdraw", amount});
        return amount;
      },
    }
  }

  return {
    accountNumber: 101,
    openAccount() {
      let account = makeAccount(this.accountNumber);
      this.accountNumber += 1;
      accounts.push(account);
      return account;
    },
    transfer(source, destination, amount) {
      amount = source.withdraw(amount);
      return destination.deposit(amount);
    }
  }
}

let bank = makeBank();
let source = bank.openAccount();
console.log(source.deposit(10));
let destination = bank.openAccount();
console.log(bank.transfer(source, destination, 7));

console.log(source.balance());
console.log(destination.balance());

console.log(bank.accounts);
