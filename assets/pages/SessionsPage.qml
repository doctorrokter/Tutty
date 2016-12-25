import bb.cascades 1.4
import bb.system 1.2
import "../components"
import "../sheets"
import "../_javascript/Request.js" as Request 

Page {
    id: root
    
    function populateSessionsList() {
        var filmSessions = _filmsService.sessionsToMaps(_filmsService.activeFilm.id);
        groupDataModel.insertList(filmSessions);
    }
    
    titleBar: TitleBar {
        title: _filmsService.activeFilm.name
    }
    
    Container {
        ListView {
            scrollRole: ScrollRole.Main
            dataModel: GroupDataModel {
                id: groupDataModel
                sortingKeys: ["date"]
            }
            
            layout: StackListLayout {
                headerMode: ListHeaderMode.Sticky
            }
            
            function itemType(data, indexPath) {
                if (indexPath.length === 1) {
                    return "header";
                } else {
                    return "item";
                }
            }
            
            listItemComponents: [
                ListItemComponent {
                    type: "header"
                    ListItemHeader {
                        text: Qt.formatDate(new Date(ListItemData * 1000), "dddd, d MMMM")
                    }
                },
                
                ListItemComponent {
                    type: "item"
                    ListItemSession {
                        cinema: ListItemData.cinema
                        sessions: ListItemData.sessions
                    }
                }
            ]
        }
    }
    
    onCreationCompleted: {
        _filmsService.filmsSessionsChanged.connect(root.populateSessionsList);
        Request.methods.post({action: "sessions", city: "minsk", film_id: _filmsService.activeFilm.id, "daylimit": 365}, function(response) {
            var items = JSON.parse(response).items;
            var dates = Object.keys(items);
//            var data = [];
//            dates.forEach(function(date) {
//                var cinemasIds = items[date][_filmsService.activeFilm.id];
//                
//                Object.keys(cinemasIds).forEach(function(cinemaId) {
//                    var sessionObj = {};
//                    var cinema = _filmsService.findCinemaById(cinemaId);
//                    sessionObj.cinema = cinema;
//                    sessionObj.sessions = cinemasIds[cinemaId];
//                    sessionObj.date = Number(date);
//                    data.push(sessionObj);
//                });
//                
//            });
//            groupDataModel.insertList(data);
            _filmsService.sessionsFromMaps(items);
        });
//        var data = [];
//        data.push({
//            date: 1481835600, 
//            cinema: {address: 'Gorodetskaya 2-152', title: '3D Kino v Zamke / 3D Kino v Zamke'}, 
//            sessions: [{"idSession":"472527","session_time":"1481901600","bycard_session_id":"311152","price":"19.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311152","3d":"1"},{"idSession":"472538","session_time":"1481904000","bycard_session_id":"311143","price":"31.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311143","3d":"0"},{"idSession":"472989","session_time":"1481912400","bycard_session_id":"311153","price":"19.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311153","3d":"1"}]
//        });
//        data.push({
//            date: 1481835600, 
//            cinema: {address: 'Gorodetskaya 2-152', title: 'Salut'}, 
//            sessions: [{"idSession":"472527","session_time":"1481901600","bycard_session_id":"311152","price":"19.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311152","3d":"1"},{"idSession":"472538","session_time":"1481904000","bycard_session_id":"311143","price":"31.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311143","3d":"0"},{"idSession":"472989","session_time":"1481912400","bycard_session_id":"311153","price":"19.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311153","3d":"1"}]
//        });
//        data.push({
//            date: 1481835900, 
//            cinema: {address: 'Gorodetskaya 2-152', title: 'Salut'}, 
//            sessions: [{"idSession":"469969","session_time":"1481901000","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236451\/","3d":"1"},{"idSession":"469230","session_time":"1481901600","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236389\/","3d":"1"},{"idSession":"469231","session_time":"1481902200","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236390\/","3d":"1"},{"idSession":"469232","session_time":"1481904000","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236391\/","3d":"0"},{"idSession":"469971","session_time":"1481910600","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236457\/","3d":"1"},{"idSession":"469233","session_time":"1481911200","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236393\/","3d":"1"},{"idSession":"469972","session_time":"1481911500","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236452\/","3d":"0"},{"idSession":"469234","session_time":"1481911800","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236387\/","3d":"1"}]
//        });
//        groupDataModel.insertList(data);
    }
}
