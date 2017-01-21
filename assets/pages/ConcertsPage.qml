import bb.cascades 1.4
import "../components"
import "../actions"

Page {
    id: root
    
    signal concertHallChosen(variant concertHall);
    signal concertChosen(variant concert);
    
    property variant date: new Date()
    property int touchY: 0
    property bool firstLoaded: false
    
    function populateConcertHalls() {
        concertHallsContainer.setPlaces(_concertsService.concertHallsToMaps());
    }
    
    function populateConcerts() {
        concertsDataModel.clear();
        concertsDataModel.insertList(_concertsService.concertsToMaps());
    }
    
    function load(jsDate) {
        if (jsDate) {
            root.date = jsDate;
            subHeader.date = jsDate;
        }
        
        concertsActions.placeeventunion(Math.round(root.date.getTime() / 1000), function(response) {
            if (!root.firstLoaded) {
                root.firstLoaded = true;
            }
            var data = JSON.parse(response);
            _concertsService.processMap(data);
        });
    }
    
    titleBar: CustomTitleBar {
        title: qsTr("Concerts") + Retranslate.onLocaleOrLanguageChanged
        calendarEnabled: true
        locationEnabled: true
        
        onDateChanged: {
            root.load(jsDate);
        }
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }
            
            layout: DockLayout {}
            
            Spinner {
                id: spinner
            }
            
            PlacesContainer {
                id: concertHallsContainer
                visible: false
                
                onPlaceChosen: {
                    concertHallChosen(place);
                }
            }
            
            Container {
                id: concertsContainer
                
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                visible: true
                ListView {
                    id: concertsListView
                    
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    scrollRole: ScrollRole.Main
                    topPadding: subHeader.isShown ? subHeader.height : 0
                    
                    dataModel: GroupDataModel {
                        id: concertsDataModel
                        sortingKeys: ["date"]
                        grouping: ItemGrouping.ByFirstChar
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
                                text: Qt.formatDate(new Date(ListItemData * 1000), "dddd, d MMMM");
                            }   
                        },
                        
                        ListItemComponent {
                            type: "item"
                            ListItemConcert {
                                concert: ListItemData.concert
                                place: ListItemData.place
                                date: ListItemData.sessions[0].sessionTime
                            }
                        }
                    ]
                    
                    onTriggered: {
                        var data = concertsDataModel.data(indexPath);
                        concertChosen(data);
                    }
                    
                    onTouch: {
                        if (event.isDown()) {
                            root.touchY = event.windowY;
                        }
                        
                        if (event.isMove()) {
                            if (root.touchY > (event.windowY + 5)) { // scroll up
                                subHeader.isShown = false;
                            } else if (root.touchY < (event.windowY - 5)) { // scroll down
                                subHeader.isShown = true;
                            }
                        }
                    }
                }
            }
            
            Subheader {
                id: subHeader
                date: root.date
                dateShown: false
                
                option1: qsTr("Concerts") + Retranslate.onLocaleOrLanguageChanged
                option2: qsTr("Concert Halls") + Retranslate.onLocaleOrLanguageChanged
                
                onOption1Selected: {
                    concertsContainer.visible = true;
                    concertHallsContainer.visible = false;
                }
                
                onOption2Selected: {
                    concertsContainer.visible = false;
                    concertHallsContainer.visible = true;
                }
            }
        }
    }
    
    attachedObjects: [
        ConcertsActions {
            id: concertsActions
        }
    ]
    
    onCreationCompleted: {
        _concertsService.concertHallsChanged.connect(root.populateConcertHalls);
        _concertsService.concertsChanged.connect(root.populateConcerts);
        _citiesService.currentCityChanged.connect(root.load);
    }
}
