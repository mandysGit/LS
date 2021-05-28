let Account = (function() {
  let userEmail;
  let userPassword;
  let userFirstName;
  let userLastName;

  function getRandomChar() {
    let randomIndex = Math.floor(Math.random() * 62);
    return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRTSUVWXYZ1234567890'[randomIndex];
  }

  function generateSequence() {
    let result = '';

    for (let i = 0; i < 16; i += 1) {
      result += getRandomChar();
    }

    return result;
  }

  return {
    init(email, password, firstName, lastName) {
      userEmail = email;
      userPassword = password;
      userFirstName = firstName;
      userLastName = lastName;
      this.displayName = generateSequence();
      return this;
    },

    email(password) {
      if (password === userPassword) return userEmail;
      return 'Invalid Password';
    },

    lastName(password) {
      if (password === userPassword) return userLastName;
      return 'Invalid Password';
    },

    firstName(password) {
      if (password === userPassword)  return userFirstName;
      return 'Invalid Password';
    },

    resetPassword(currentPassword, newPassword) {
      if (currentPassword === userPassword) {
        userPassword = newPassword;
        return true;
      }
      return 'Invalid Password';
    },

    reanonymize(password) {
      if (password === userPassword) {
        this.displayName = generateSequence();
        return true;
      }
      return 'Invalid password';
    },
  }
})();

let fooBar = Object.create(Account).init('foo@bar.com', '123456', 'foo', 'bar');
console.log(fooBar.firstName);                     // returns the firstName function
console.log(fooBar.email);                         // returns the email function
console.log(fooBar.firstName('123456'));           // logs 'foo'
console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
console.log(fooBar.displayName);                   // logs 16 character sequence
console.log(fooBar.resetPassword('123', 'abc'))    // logs 'Invalid Password';
console.log(fooBar.resetPassword('123456', 'abc')) // logs true

let displayName = fooBar.displayName;
console.log(fooBar.reanonymize('abc'));                         // returns true
console.log(displayName === fooBar.displayName);   // logs false
