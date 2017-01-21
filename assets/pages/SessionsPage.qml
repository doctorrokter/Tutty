import bb.cascades 1.4
import bb.system 1.2
import bb.data 1.0
import "../components"
import "../actions"

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
    
    Container {
        layout: DockLayout {}
        
        Spinner {
            id: spinner
        }
        
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
    }
    
    attachedObjects: [
        FilmsActions {
            id: filmsActions
        }
    ]
    
    onCreationCompleted: {
        _filmsService.filmsSessionsChanged.connect(root.populateSessionsList);
        filmsActions.sessions(function(response) {
            _filmsService.sessionsFromMaps(JSON.parse(response).items);
        });
    }
}
