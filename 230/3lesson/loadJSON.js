// Problem 1
var request = new XMLHttpRequest();
request.open('GET', 'https://api.github.com/repos/rails/rails');
request.responseType = 'json';

request.addEventListener('load', event => {
  let data = request.response;
  console.log(request.status);
  console.log(data.open_issues);
})

// Problem 2
var request = new XMLHttpRequest();
request.open('GET', 'htps://api.github.com/repos/rails/rails');
request.responseType = 'json';

request.addEventListener('load', event => {
  let data = request.response;
  console.log(request.status);
  console.log(data.open_issues);
})

request.addEventListener('error', event => {
  console.log('The request could not be completed!')
})

request.send()
