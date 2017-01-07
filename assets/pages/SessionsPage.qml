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
    
    ListView {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
            
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
    
    onCreationCompleted: {
        _filmsService.filmsSessionsChanged.connect(root.populateSessionsList);
        Request.methods.post({action: "sessions", city: "minsk", film_id: _filmsService.activeFilm.id, "daylimit": 365}, function(response) {
            _filmsService.sessionsFromMaps(JSON.parse(response).items);
        });
    }
}
