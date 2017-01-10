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
    
    titleBar: CustomTitleBar {
        title: _filmsService.activeFilm.name
    }
    
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    
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
                    maxHeight: ui.du(35)
                    cinema: ListItemData.cinema
                    sessions: ListItemData.sessions
                }
            }
        ]
    }
    
    onCreationCompleted: {
        _filmsService.filmsSessionsChanged.connect(root.populateSessionsList);
        Request.methods.post({action: "sessions", city: _citiesService.currentCity.code, film_id: _filmsService.activeFilm.id, "daylimit": 365}, function(response) {
            _filmsService.sessionsFromMaps(JSON.parse(response).items);
        });
//        groupDataModel.insert({
//                cinema: {title: "3D Kino v Zamke / 3D Kino v Zamke adssdfsdf", address: "Pobediteley, 5"}, 
//            sessions: [{sessionTime: 0, price: "5.5", threeD: true},
//            {sessionTime: 0, price: "8.8", threeD: true},
//                {sessionTime: 0, price: "3.5", threeD: false},
//                {sessionTime: 0, price: "3.5", threeD: false},
//                {sessionTime: 0, price: "3.5", threeD: false},
//                {sessionTime: 0, price: "3.5", threeD: true},
//                {sessionTime: 0, price: "5", threeD: true},
//                {sessionTime: 0, price: "10.5", threeD: false}]});
    }
}
