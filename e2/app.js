const express = require('express');
const os = require('os');
const app = express();
require('dotenv').config();

const port = 8097;
const VERSION=process.env.VERSION || 'nothing';
app.get('/', (req, res) => {
  const ipAddress = req.ip.replace('::ffff:','');
  res.send(`Adres IP serwera: ${ipAddress}<br>
            Nazwa serwera: ${os.hostname()}<br>
            Wersja aplikacji: ${process.env.VERSION}`);
});

app.listen(port, () => {
  console.log(`Aplikacja jest dostępna pod adresem http://localhost:${port}`);
});
