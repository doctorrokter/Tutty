import bb.cascades 1.4
import "../_javascript/Request.js" as Request;

Container {
    function post(paramsObj, onSuccess) {
        Request.methods.post(paramsObj, onSuccess, function() {
            console.debug('REQUEST FAILED');    
        });
    }
}
