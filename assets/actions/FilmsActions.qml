import bb.cascades 1.4
import "../util"

Container {
    
    function theaterfilmssessions(city, timestamp, onSuccess) {
        request.post({action: "theaterfilmssessions", city: city, date: timestamp, daylimit: 1, version: 2}, onSuccess);
    }
    
    function sessions(onSuccess) {
        request.post({action: "sessions", city: _citiesService.currentCity.code, film_id: _filmsService.activeFilm.id, "daylimit": 365}, onSuccess);
    }
    
    function getDescription(onSuccess) {
        request.post({id:[_filmsService.activeFilm.id], type: "cinema", version: 2, action: "getDescription", jsonrpc: "2.0"}, onSuccess);
    }
    
    function comments(from, to, onSuccess) {
        request.post({action: "comments", film_id: _filmsService.activeFilm.id, comments_from: from, comments_limit: to}, onSuccess);
    }
    
    attachedObjects: [
        Request {
            id: request
        }
    ]
}
