const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 33882 });

console.log('WebSocket server started on ws://localhost:33882');

wss.on('connection', function connection(ws) {
  console.log('Client connected');

  ws.on('message', function incoming(message) {
    console.log('Received: %s', message);
  });

  // Send a test message
  ws.send('print("Hello from server")');

  ws.on('close', function() {
    console.log('Client disconnected');
  });
});