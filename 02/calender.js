const { google } = require('googleapis');
const { readFileSync } = require('fs');

const serviceAccountKey = JSON.parse(readFileSync('service-account-key.json'));

const auth = new google.auth.GoogleAuth({
  credentials: serviceAccountKey,
  scopes: ['https://www.googleapis.com/auth/calendar.readonly'],
});

async function getBusyIntervals(authClient, calendarId, timeMin, timeMax) {
  const calendar = google.calendar({ version: 'v3', auth: authClient });
  try {
    const response = await calendar.freebusy.query({
      requestBody: {
        timeMin,
        timeMax,
        items: [{ id: calendarId }],
      },
    });
    return response.data.calendars[calendarId].busy;
  } catch (error) {
    console.error('Error fetching busy intervals:', error);
  }
}

async function main() {
  const authClient = await auth.getClient();
  const calendarId = 'calendar_id@group.calendar.google.com';
  const timeMin = '2024-07-01T00:00:00Z';
  const timeMax = '2024-07-31T23:59:59Z';

  const busyIntervals = await getBusyIntervals(authClient, calendarId, timeMin, timeMax);
  console.log('Busy intervals:', busyIntervals);
}

main();
