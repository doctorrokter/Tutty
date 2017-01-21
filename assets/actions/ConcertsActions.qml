import bb.cascades 1.4
import "../util"

Container {
    
    function placeeventunion(timestamp, onSuccess) {
        request.post({action: "placeeventunion", city: _citiesService.currentCity.code, placetype: "concert", daylimit: 7, date: timestamp, version: 2}, onSuccess);
    }
    
    function getDescription(onSuccess) {
        request.post({"id":[_concertsService.activeConcert.concert.id],"type":"concert","version":2,"action":"getDescription","jsonrpc":"2.0"}, onSuccess);
    }
    
    attachedObjects: [
        Request {
            id: request
        }
    ]
}
