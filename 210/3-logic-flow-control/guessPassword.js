function guessPassword () {
  let prompt = require('readline-sync');
  let denied = 'You have been denied access.'
  let success = 'You have sucessfully logged in.'
  const password = 'hello'
  let failedAttempts = 0;

  while (failedAttempts < 3) {
    let passwordEntered = prompt.question('What is the password: ');

    if (passwordEntered === password) {
      console.log(success);
      return;
    }
    failedAttempts++;
  };

  if (failedAttempts >= 3) console.log(denied);
}

guessPassword();


