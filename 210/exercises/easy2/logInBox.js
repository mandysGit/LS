function logInBox(str) {
  console.log(`+-${'-'.repeat(str.length)}-+`)
  console.log(`| ${' '.repeat(str.length)} |`)
  console.log(`| ${str} |`)
  console.log(`| ${' '.repeat(str.length)} |`)
  console.log(`+-${'-'.repeat(str.length)}-+`)
}
logInBox('');
logInBox('To boldly go where no one has gone before.');
