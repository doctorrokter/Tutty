import bb.cascades 1.4
import bb.system 1.2

CustomListItem {
    id: root
    
    property variant cinema
    property variant sessions
    
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
            
            Container {
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                
                Label {
                    horizontalAlignment: HorizontalAlignment.Left
                    verticalAlignment: VerticalAlignment.Center
                    text: root.cinema.title
                    textStyle.base: SystemDefaults.TextStyles.PrimaryText
                    multiline: true
                    minWidth: ui.du(50)
                    preferredWidth: ui.du(50)
                    maxWidth: ui.du(100)
                }
                
                Button {
                    horizontalAlignment: HorizontalAlignment.Right
                    text: qsTr("Buy") + Retranslate.onLocaleOrLanguageChanged
                    maxWidth: ui.du(20.0)
                    minWidth: ui.du(20.0)
                    
                    onClicked: {
                        customDialog.sessions = root.sessions;
                        customDialog.open();
                    }
                }
            }
            
            Label {
                text: root.cinema.address
                textStyle.base: SystemDefaults.TextStyles.SubtitleText
                multiline: true
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                
                ScrollView {
                    scrollViewProperties.scrollMode: ScrollMode.Horizontal
                    Container {
                        id: regularSessions
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        
                        onCreationCompleted: {
                            var sessions = root.sessions.filter(function(session) {
                                    return session.threeD === false;
                            });
                            sessions.forEach(function(s) {
                                var timePrice = timePriceContainer.createObject(this);
                                timePrice.timestamp = s.sessionTime * 1000;
                                timePrice.price = s.price;
                                regularSessions.add(timePrice);
                            });
                        }
                    }
                }
                
                ScrollView {
                    scrollViewProperties.scrollMode: ScrollMode.Horizontal
                    Container {
                        id: threeDSessions
                        layout: StackLayout {
                            orientation: LayoutOrientation.TopToBottom
                        }
                        margin.topOffset: ui.du(1)
                        
                        Label {
                            text: qsTr("Sessions in 3D") + Retranslate.onLocaleOrLanguageChanged
                        }
                        
                        Container {
                            id: threeDSessionsSubcontainer
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                        }
                        
                        onCreationCompleted: {
                            var sessions = root.sessions.filter(function(session) {
                                    return session.threeD === true;
                            });
                            threeDSessions.visible = sessions.length > 0;
                            sessions.forEach(function(s) {
                                var timePrice = timePriceContainer.createObject(this);
                                timePrice.timestamp = s.sessionTime * 1000;
                                timePrice.price = s.price;
                                threeDSessionsSubcontainer.add(timePrice);
                            });
                        }
                    }
                }
            }
        }
        
        attachedObjects: [
            ComponentDefinition {
                id: timePriceContainer
                TimePrice {}
            },
            
            Dialog {
                id: customDialog
                
                property variant sessions
                
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
                        maxHeight: ui.du(50)
                        maxWidth: ui.du(60);
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
                                            TimePrice {
                                                timestamp: ListItemData.sessionTime * 1000
                                                price: ListItemData.price
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
                    sessionsDataModel.append(customDialog.sessions);
                }
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
}
