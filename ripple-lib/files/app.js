'use strict';
const app = require('express')();
const bodyParser = require('body-parser');
const http = require('http').Server(app);
const rippleAPI = require('ripple-lib').RippleAPI;

const api = new rippleAPI({server: 'wss://localhost'});
const port = 80;

app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json());

// Example: curl -X POST -H 'Content-Type:application/json' http://127.0.0.1:50080/create_tx -d '{"secret": "shfXBTqLeoqDzkpDpGd9q8Q1uB4ZW", "tx_json": {"TransactionType": "Payment", "Account": "rKXCHMM9U7qeKPeNSb9e7tVtojghjQVmvh", "Destination": "rPT1Sjq2YGrBMTttX4GZHjKu9dyfzbpAYe", "Amount": "100", "Fee": "20", "Sequence": "1"}}'
app.post('/create_tx', function (req, res) {
  const params = req.body;
  const tx = api.sign(JSON.stringify(params['tx_json']), params['secret']);

  res.send(tx);
});

app.get('/heartbeat', function (_, res) {
  res.send('OK\n');
});

http.listen(port);
