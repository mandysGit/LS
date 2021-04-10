function isValidEmail(email) {
  if (checkAtSymbol(email)) {
    let local = email.split('@')[0]
    let domain = email.split('@')[1]

    return checkDomain(domain) && checkLocal(local)
  } else {
    return false;
  }
}

function checkAtSymbol(email) {
  return email.match(/[@]/g).length === 1;
}

function checkLocal(local) {
  return /[a-z\d]/ig.test(local) && !/[^a-z\d]/ig.test(local);
}

function checkDomain(domain) {
  let domainSplit = domain.split('.')
  return domainSplit.length > 1 && domainSplit.every(word => {
    return  /[a-z]/ig.test(word) && !/[^a-z]/ig.test(word);
  })
}

function isValidEmail(email) {
  return /^[a-z0-9]+@([a-z]+\.)+[a-z]+$/i.test(email);
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false
console.log(isValidEmail('foo.bar@baz.to'));          // returns false
console.log(isValidEmail('foo@baz.'));                // returns false
console.log(isValidEmail('foo_bat@baz'));             // returns false
console.log(isValidEmail('foo@bar.a12'));             // returns false
console.log(isValidEmail('foo_bar@baz.com'));         // returns false
console.log(isValidEmail('foo@bar.....com'));         // returns false
