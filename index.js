var port = process.env.PORT || process.env.OPENSHIFT_NODEJS_PORT || 8080;

var ip = process.env.OPENSHIFT_NODEJS_IP || "127.0.0.1";

const http = require('http');


const server = http.createServer(function(req, res) {
	res.writeHead(200,{'Content-Type': 'text/plain'})
	res.write('hello world');
	res.end();
});


server.listen(port,ip);



