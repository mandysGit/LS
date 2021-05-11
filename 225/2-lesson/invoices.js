let invoices = { 
  unpaid: [],
  paid: [],
  add(name, amount) {
    this.unpaid.push({ name, amount });
  },
  totalDue() {
    let total = 0;
    for (const client of this.unpaid) {
      total += client.amount;
    }

    return total;
  },
  payInvoice(name) {
    let unpaid = []
    for (const client of this.unpaid) {
      if (client.name === name) {
        this.paid.push(client);
      } else {
        unpaid.push(client);
      }
    }

    this.unpaid = unpaid;
  },
  totalPaid() {
    let total = 0;
    for (const client of this.paid) {
      total += client.amount;
    }

    return total;
  }
}

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
console.log(invoices.totalPaid())
console.log(invoices.totalDue())
