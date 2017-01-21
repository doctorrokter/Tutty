import bb.cascades 1.4
import "../components"
import "../actions"

Page {
    id: root
    
    titleBar: CustomTitleBar {
        title: _concertsService.activeConcert.concert.name
    }
    
    ScrollView {
        scrollRole: ScrollRole.Main
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
        
            leftPadding: ui.du(2.5)
            topPadding: ui.du(2.5)
            rightPadding: ui.du(2.5)
            bottomPadding: ui.du(2.5)
            
            Spinner {
                id: spinner
            }
        
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
            
                Container {
                    WebView {
                        minWidth: ui.du(25.0)
                        maxWidth: ui.du(25.0)
                        url: _concertsService.activeConcert.concert.image
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.TopToBottom
                    }
                    leftPadding: ui.du(2.5)
                    Label {
                        text: _concertsService.activeConcert.concert.name
                        textStyle.base: SystemDefaults.TextStyles.TitleText
                        multiline: true
                    }
                }
            }
        
            Container {
                topPadding: ui.du(2.5)
                bottomPadding: ui.du(2.5)
                Label {
                    text: _concertsService.activeConcert.concert.description
                    textStyle.base: SystemDefaults.TextStyles.BodyText
                    textFormat: TextFormat.Html
                    multiline: true
                }
            }
            
            ListView {
                id: sessionsListView
                
                dataModel: GroupDataModel {
                    id: sessionsDataModel
                    sortingKeys: ["date"]
                    
                    onItemAdded: {
                        sessionsListView.preferredHeight = sessionsDataModel.size() * 400
                    }
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
                            text: Qt.formatDate(new Date(ListItemData * 1000), "dddd, d MMMM");
                        }   
                    },
                    
                    ListItemComponent {
                        type: "item"
                        ListItemConcert {
                            showImage: false
                            concert: ListItemData.concert
                            place: ListItemData.place
                            date: ListItemData.date
                        }
                    }
                ]
            }
        }
    }
    
    onCreationCompleted: {
        var concert = _concertsService.activeConcert.concert;
        if (!concert.description) {
            concertActions.getDescription(function(response) {
                var items = JSON.parse(response).items;
                _concertsService.activeConcert.concert.description = items[concert.id].description_html;
                _concertsService.activeConcert.concert.commentsCnt = items[concert.id].commentsCnt;
            });
        }
        
        var concertSession = _concertsService.activeConcert.toMap();
        var data = concertSession.sessions.map(function(s) {
            return {concert: concertSession.concert, place: concertSession.place, date: s.sessionTime};
        });
        sessionsDataModel.insertList(data);
    }
    
    attachedObjects: [
        ConcertsActions {
            id: concertActions
        }
    ]
}
