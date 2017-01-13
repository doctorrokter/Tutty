import bb.cascades 1.4
import "../util"

Container {
    
    function getCities(onSuccess) {
        request.post({action: "getCities"}, onSuccess);
    }
    
    attachedObjects: [
        Request {
            id: request
        }
    ]
}
