import bb.cascades 1.4
import "../_javascript/Request.js" as Request;

Container {
    function post(paramsObj, onSuccess) {
        if (spinner) {
            spinner.start();
        }
        Request.methods.post(paramsObj, function(response) {
            if (spinner) {
                spinner.stop();
            }
            onSuccess(response);
        }, function() {
            console.debug('REQUEST FAILED');    
        });
    }
}
