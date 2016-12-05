"use strict";

var url = "http://afisha.tut.by/export/api.php";

var methods = (function() {
	function request(httpMethod, paramsStr, onSuccess, onError) {
		console.debug('request: ' + httpMethod);
		console.debug('url: ' + url);
		console.debug('params: ' + paramsStr);
		
		var _req = new XMLHttpRequest();

		_req.open(httpMethod, url, true);
		_req.setRequestHeader('Content-Type', 'application/json');

		_req.onreadystatechange = function() {
			if (_req.readyState === 4) {
				if (_req.status === 200) {
					onSuccess(_req.responseText);
				} else {
					console.debug(_req.responseText);
				}
			}
		};

		_req.onerror = function() {
			console.debug('Network Error');
		};

		_req.send(paramsStr || null);
	}
	
	return {
		get: function get(paramsObj, onSuccess, onError) {
			request("GET", JSON.stringify(paramsObj), onSuccess, onError);
		},

		post: function post(paramsObj, onSuccess, onError) {
			request("POST", JSON.stringify(paramsObj), onSuccess, onError);
		}
	};
})();