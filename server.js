var http = require('http');
var url =  require('url');
var router = require('./router');

function start(){
	function onRequest(request, response) {		
		var pathname = url.parse(request.url).pathname;
		
		router.route(response, pathname);

	}

	http.createServer(onRequest).listen(8888);

	console.log("Server has started");
}

exports.start = start;