const readline = require('readline');

function isValidNumber(input) {
  const number = parseFloat(input);
  return !isNaN(number) && number > 0;
}

function promptForNumber(promptText, callback) {
  rl.question(promptText, (input) => {
    if (isValidNumber(input)) {
      callback(parseFloat(input));
    } else {
      console.log('Invalid input. Please enter a positive number.');
      promptForNumber(promptText, callback);
    }
  });
}

function promptForSalesItems(sales, index, totalItems, callback) {
  if (index < totalItems) {
    promptForNumber(`Sales item ${index + 1} amount: `, (amount) => {
      promptForNumber(`Sales item ${index + 1} quantity: `, (quantity) => {
        sales.push({ amount, quantity });
        promptForSalesItems(sales, index + 1, totalItems, callback);
      });
    });
  } else {
    callback(sales);
  }
}

function calculateAndSortSales(sales) {
  const salesWithTotal = sales.map(sale => ({
    ...sale,
    Total: sale.amount * sale.quantity
  }));
  salesWithTotal.sort((a, b) => b.Total - a.Total);
  return salesWithTotal;
}

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

promptForNumber('Enter the number of sales items: ', (totalItems) => {
  const sales = [];
  promptForSalesItems(sales, 0, totalItems, (collectedSales) => {
    const sortedSales = calculateAndSortSales(collectedSales);
    console.log('Sorted sales:', sortedSales);
    rl.close();
  });
});
