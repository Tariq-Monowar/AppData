const http = require("http");

function createApp() {
  const routes = [];

  const app = (req, res) => {
    const { url, method } = req;
    const route = routes.find(r => r.path === url && r.method === method);

    if (route) {
      route.handler(req, res);
    } else {
      res.statusCode = 404;
      res.end("Not Found");
    }
  };

  app.get = (path, handler) => {
    routes.push({ path, method: "GET", handler });
  };

  app.listen = (port, callback) => {
    const server = http.createServer(app);
    server.listen(port, callback);
  };

  return app;
}

// Usage:
const app = createApp();

app.get("/", (req, res) => {
  res.end("Hello World from my mini Express!");
});

app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
