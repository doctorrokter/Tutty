import bb.cascades 1.4
import bb.system 1.0
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
        }, function(e) {
            console.debug(e.getMessage()); 
            toast.show();   
        });
    }
    
    attachedObjects: [
        SystemToast {
            id: toast
            body: qsTr("Network Error. Check connection") + Retranslate.onLocaleOrLanguageChanged
        }
    ]
}
