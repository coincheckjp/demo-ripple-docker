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

app.post('/create_tx', function (req, res) {
  const params = req.body;
  const tx = api.sign(JSON.stringify(params['tx_json']), params['secret']);

  res.send(tx);
});

app.get('/heartbeat', function (_, res) {
  res.send('OK\n');
});

http.listen(port);
