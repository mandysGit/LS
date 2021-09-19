let request = new XMLHttpRequest();
request.open('POST', 'https://ls-230-web-store-demo.herokuapp.com/v1/products');

request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
request.setRequestHeader('Authorization', 'token AUTH_TOKEN');

request.addEventListener('load', () => {
  console.log(`Product added: ${request.responseText}`)
})

let data = { name: 'pen', sku: 3452433234, price: 1};
let json = JSON.stringify(data);

request.send(json);
