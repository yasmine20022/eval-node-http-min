const http = require("http");

const server = http.createServer((req, res) => {
  res.setHeader("Content-Type", "application/json");
  if (req.url === "/health") return res.end(JSON.stringify({ status: "ok" }));
  res.end(JSON.stringify({ service: "eval-node-http-min" }));
});

server.listen(8000, "0.0.0.0", () => console.log("listening on 8000"));
