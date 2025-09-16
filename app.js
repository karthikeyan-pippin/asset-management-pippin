const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 3000;

const server = http.createServer((req, res) => {
  let filePath = path.join(__dirname, req.url === '/' ? 'Index.html' : req.url);
  const ext = path.extname(filePath).toLowerCase();
  let contentType = 'text/html';

  const mimeTypes = {
    '.html': 'text/html',
    '.css': 'text/css',
    '.js': 'application/javascript'
  };

  if (mimeTypes[ext]) contentType = mimeTypes[ext];

  fs.readFile(filePath, (err, content) => {
    if (err) {
      res.writeHead(404, { 'Content-Type': 'text/plain' });
      res.end('404 Not Found');
    } else {
      res.writeHead(200, { 'Content-Type': contentType });
      res.end(content);
    }
  });
});

server.listen(PORT, () => {
    console.log(`🚀 Server running at http:localhost:${PORT}`);
  });
