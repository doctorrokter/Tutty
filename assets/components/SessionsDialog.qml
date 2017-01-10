import bb.cascades 1.4

Dialog {
    id: customDialog
    
    property variant sessions: [
        {sessionTime: 0, price: "5.5", threeD: true},
        {sessionTime: 0, price: "8.8", threeD: true},
        {sessionTime: 0, price: "3.5", threeD: false},
        {sessionTime: 0, price: "3.5", threeD: false},
        {sessionTime: 0, price: "3.5", threeD: false},
        {sessionTime: 0, price: "3.5", threeD: true},
        {sessionTime: 0, price: "5", threeD: true},
        {sessionTime: 0, price: "10.5", threeD: false}
    ]
    
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        background: Color.create(0.0, 0.0, 0.0, 0.5)
        layout: DockLayout {}
        
        Container {
            ListItemHeader {
                text: qsTr("Choose a session") + Retranslate.onLocaleOrLanguageChanged
            }
            
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            maxHeight: ui.du(70)
            maxWidth: ui.du(70);
            background: Color.White
            
            Container {
                leftPadding: ui.du(3)
                rightPadding: leftPadding
                horizontalAlignment: HorizontalAlignment.Fill
                ListView {
                    dataModel: ArrayDataModel {
                        id: sessionsDataModel
                    }
                    layout: GridListLayout  {}
                    
                    listItemComponents: [
                        ListItemComponent {
                            CustomListItem {
                                Ticket {
                                    timestamp: ListItemData.sessionTime * 1000
                                    price: ListItemData.price
                                    threeD: ListItemData.threeD
                                }
                            }
                        }
                    ]
                    
                    onTriggered: {
                        var data = sessionsDataModel.data(indexPath);
                        browser.query.uri = data.buyTicketUrl;
                    }
                }
            }
            
            
            Button {
                horizontalAlignment: HorizontalAlignment.Fill
                text: qsTr("Cancel") + Retranslate.onLocaleOrLanguageChanged
                
                onClicked: {
                    customDialog.close();
                }
            }
        }
    }
    
    onSessionsChanged: {
        sessionsDataModel.clear();
        sessionsDataModel.append(customDialog.sessions);
    }
    
//    onClosed: {
//        sessionsDataModel.clear();
//    }
}