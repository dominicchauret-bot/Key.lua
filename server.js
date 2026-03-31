

const WebSocket = require('ws');
const readline = require('readline');

const wss = new WebSocket.Server({ port: 33882 });

console.log('WebSocket server started on ws://localhost:33882');
console.log('Type Lua commands to send to connected clients. Type "exit" to quit.');

let clients = [];

wss.on('connection', function connection(
ws) {
  console.log('Client connected');
  clients.push(ws);

  ws.on('message', function incoming(message) {
    console.log('Received from client: %s', message);
  });

  ws.on('close', function() {
    console.log('Client disconnected');
    clients = clients.filter(client => client !== ws);
  });
});

// Use readline for better input handling
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  prompt: '> '
});

rl.prompt();

rl.on('line', (input) => {
  const command = input.trim();
  if (command === 'exit') {
    console.log('Exiting...');
    rl.close();
    process.exit(0);
  }
  clients.forEach(client => {
    if (client.readyState === WebSocket.OPEN) {
      client.send(command);
      console.log('Sent to client: ' + command);
    }
  });
  rl.prompt();
}).on('close', () => {
  console.log('Readline closed');
  process.exit(0);
});