import bb.cascades 1.4
import bb.system 1.2

CustomListItem {
    id: root
    
    property variant cinema: {title: "3D Kino v Zamke", address: "Pobediteley, 5"}
    property variant sessions: [
        {sessionTime: 0, price: "5.5", threeD: true},
        {sessionTime: 0, price: "8.8", threeD: true},
        {sessionTime: 0, price: "3.5", threeD: false},
        {sessionTime: 0, price: "3.5", threeD: false},
        {sessionTime: 0, price: "3.5", threeD: false},
        {sessionTime: 0, price: "3.5", threeD: true},
        {sessionTime: 0, price: "5", threeD: true},
        {sessionTime: 0, price: "10.5", threeD: true}
    ]
    property int date: 0
    
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        
        topPadding: ui.du(2.5)
        leftPadding: ui.du(2.5)
        rightPadding: ui.du(2.5)
        bottomPadding: ui.du(2.5)
        
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            horizontalAlignment: HorizontalAlignment.Fill
            
            Label {
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Center
                text: root.cinema.title
                textStyle.base: SystemDefaults.TextStyles.PrimaryText
                minWidth: ui.du(50)
                preferredWidth: ui.du(50)
                maxWidth: ui.du(100)
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                layout: DockLayout {
                    
                }
//                Button {
//                    horizontalAlignment: HorizontalAlignment.Right
//                    text: qsTr("Buy") + Retranslate.onLocaleOrLanguageChanged
//                    maxWidth: ui.du(20.0)
//                    minWidth: ui.du(20.0)
//                    
//                    onClicked: {
//                        sessionsDialog.sessions = root.sessions;
//                        sessionsDialog.open();
//                    }
//                }
                
                Label {
                    horizontalAlignment: HorizontalAlignment.Left
                    verticalAlignment: VerticalAlignment.Center
                    text: root.cinema.address
                    textStyle.base: SystemDefaults.TextStyles.SubtitleText
                    textStyle.fontWeight: FontWeight.W100
                    multiline: true
                }
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                
                Container {
                    id: regularSessions
                    horizontalAlignment: HorizontalAlignment.Fill
                    maxHeight: ui.du(20)
                    ListView {
                        dataModel: ArrayDataModel {
                            id: regularSessionsDataModel
                        }
                        layout: StackListLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        
                        listItemComponents: [
                            ListItemComponent {
                                CustomListItem {
                                    dividerVisible: false
                                    maxWidth: ui.du(20)
                                    maxHeight: ui.du(20)
                                    Ticket {
                                        timestamp: ListItemData.sessionTime * 1000
                                        price: ListItemData.price
                                        threeD: ListItemData.threeD
                                    }
                                }
                            }
                        ]   
                        
                        onTriggered: {
                            var data = regularSessionsDataModel.data(indexPath);
                            browser.query.uri = data.buyTicketUrl;
                        }                     
                    }
                }
            }
        }
               
        attachedObjects: [
            SessionsDialog {
                id: sessionsDialog
            },
                        
            Invocation {
                id: browser
                
                property bool autoTrigger: false
                
                query {
                    uri: "http://google.com"
                    
                    onUriChanged: {
                        browser.query.updateQuery();
                    }
                }
                
                onArmed: {
                    if (browser.autoTrigger) {
                        trigger("bb.action.OPEN");
                    }
                    browser.autoTrigger = true;
                }
            }
        ]
    }
    
    onSessionsChanged: {
//        console.debug("cinema", root.cinema.title, "date", root.date, "sessions", root.sessions.length);
        regularSessionsDataModel.clear();
        regularSessionsDataModel.append(sessions);
    }
}
