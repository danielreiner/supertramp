function route(response, handler){
	
	handler = handler.split("/");

	switch(handler[1]){

		case "":{
			start(response);
			break;
		}

		case "start":{
			start(response);
			break;
		}

		default:{
			response.writeHead(404, {"Content-Type": "text/html"});
    		response.write("404 Not found");
    		response.end();
    		break;
		}

	}
	
}

function start(response){
	response.writeHead(200, {"Content-Type": "text/plain"});
	response.write("Hello Start");
	response.end();
}

exports.route = route;