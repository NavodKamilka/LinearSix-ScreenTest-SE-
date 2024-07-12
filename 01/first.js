const readline = require('readline');

Date.prototype.daysTo = function(otherDate) {
  if (!(otherDate instanceof Date)) {
    throw new Error("Argument must be a Date object");
  }

  const differenceInMs = otherDate - this;
  const millisecondsInADay = 24 * 60 * 60 * 1000;
  const completeDays = Math.floor(differenceInMs / millisecondsInADay);
  return Math.abs(completeDays);
};

function isValidDate(dateString) {
  const regex = /^\d{4}-\d{2}-\d{2}$/;
  if (!regex.test(dateString)) {
    return false;
  }

  const date = new Date(dateString);
  if (isNaN(date.getTime())) {
    return false;
  }

  const [year, month, day] = dateString.split('-').map(Number);
  if (date.getFullYear() !== year || date.getMonth() + 1 !== month || date.getDate() !== day) {
    return false;
  }

  return true;
}

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function promptForDate(promptText, callback) {
  rl.question(promptText, (dateInput) => {
    if (!isValidDate(dateInput)) {
      console.log('Invalid date format or date. Please enter a valid date in YYYY-MM-DD format.');
      promptForDate(promptText, callback); 
    } else {
      callback(dateInput);
    }
  });
}

promptForDate('Enter the first date (YYYY-MM-DD): ', (date1Input) => {
  promptForDate('Enter the second date (YYYY-MM-DD): ', (date2Input) => {
    const d1 = new Date(date1Input);
    const d2 = new Date(date2Input);
    console.log(`The number of complete days between ${date1Input} and ${date2Input} is: ${d1.daysTo(d2)}`);
    rl.close();
  });
});
