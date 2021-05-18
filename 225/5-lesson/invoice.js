function createPayment(services) {
  services = services || {};

  return {
    phone: services.phone || 0,
    internet: services.internet || 0,
    amount: services.amount || 0,

    total() {
      return (this.amount || 0) +
        (this.phone || 0) +
        (this.internet || 0);
    }
  }
}

function createInvoice(services = {}) {
  return {
    phone: services.phone || 3000,
    internet: services.internet || 5500,
    amountDue: function() {
      return this.phone + this.internet;
    },
    addPayment(payment) {
      this.phone -= payment.phone;
      this.internet -= payment.internet;

      if (this.phone < payment.amount) {
        this.internet = this.internet - (payment.amount - this.phone);
        this.phone = 0;
      }
    },
    addPayments(payments) {
      payments.forEach(payment => this.addPayment(payment));
    },
  };
}

let invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

let payment1 = createPayment({
  amount: 2000,
});

let payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

let payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
console.log(invoice.amountDue());       // this should return 0

console.log(invoice);

// function invoiceTotal(invoices) {
//   let total = 0;
//   let i;

//   for (i = 0; i < invoices.length; i += 1) {
//     total += invoices[i].total();
//   }

//   return total;
// }

// let invoices = [];
// invoices.push(createInvoice());
// invoices.push(createInvoice({
//   internet: 6500,
// }));

// invoices.push(createInvoice({
//   phone: 2000,
// }));

// invoices.push(createInvoice({
//   phone: 1000,
//   internet: 4500,
// }));

// console.log(invoiceTotal(invoices));             // => 31000


