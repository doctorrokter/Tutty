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
                                var timePriceContainer = emptyContainer.createObject(this);    
                                
                                var timeContainer = sessionContainer.createObject(this);
                                var timestamp = Number(s.sessionTime) * 1000;
                                timeContainer.text = Qt.formatTime(new Date(timestamp), "HH:mm");
                                timeContainer.textStyle = SystemDefaults.TextStyles.PrimaryText;
                                timePriceContainer.add(timeContainer);
                                
                                if (s.price) {
                                    var priceContainer = sessionContainer.createObject(this);
                                    priceContainer.text = s.price + " p.";
                                    priceContainer.textStyle = SystemDefaults.TextStyles.SubtitleText;
                                    timePriceContainer.add(priceContainer);
                                }
                                
                                regularSessions.add(timePriceContainer);
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
                                var timePriceContainer = emptyContainer.createObject(this);    
                                
                                var timeContainer = sessionContainer.createObject(this);
                                var timestamp = Number(s.sessionTime) * 1000;
                                timeContainer.text = Qt.formatTime(new Date(timestamp), "HH:mm");
                                timeContainer.textStyle = SystemDefaults.TextStyles.PrimaryText;
                                timePriceContainer.add(timeContainer);
                                
                                if (s.price) {
                                    var priceContainer = sessionContainer.createObject(this);
                                    priceContainer.text = s.price + " p.";
                                    priceContainer.textStyle = SystemDefaults.TextStyles.SubtitleText;
                                    timePriceContainer.add(priceContainer);
                                }
                                
                                threeDSessionsSubcontainer.add(timePriceContainer);
                            });
                        }
                    }
                }
            }
        }
        
        attachedObjects: [
            ComponentDefinition {
                id: emptyContainer
                Container {}    
            },
            
            ComponentDefinition {
                id: sessionContainer
                Container {
                    id: session
                    
                    property string text
                    property variant textStyle
                    
                    leftPadding: ui.du(1.0)
                    rightPadding: ui.du(1.0)
                    topPadding: ui.du(1.0)
                    bottomPadding: ui.du(1.0)
                    horizontalAlignment: HorizontalAlignment.Fill
                    minWidth: ui.du(13)
                    
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: session.text
                        textStyle.base: session.textStyle
                    }
                }
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
                                            Container {
                                                Container {
                                                    leftPadding: ui.du(1.0)
                                                    rightPadding: ui.du(1.0)
                                                    topPadding: ui.du(1.0)
                                                    bottomPadding: ui.du(1.0)
                                                    horizontalAlignment: HorizontalAlignment.Fill
                                                    minWidth: ui.du(13)
                                                    
                                                    Label {
                                                        horizontalAlignment: HorizontalAlignment.Center
                                                        text: Qt.formatTime(new Date(ListItemData.sessionTime * 1000), "HH:mm")
                                                        textStyle.base: SystemDefaults.TextStyles.PrimaryText
                                                    }
                                                }
                                                
                                                Container {
                                                    leftPadding: ui.du(1.0)
                                                    rightPadding: ui.du(1.0)
                                                    topPadding: ui.du(1.0)
                                                    bottomPadding: ui.du(1.0)
                                                    horizontalAlignment: HorizontalAlignment.Fill
                                                    minWidth: ui.du(13)
                                                    
                                                    Label {
                                                        horizontalAlignment: HorizontalAlignment.Center
                                                        text: {
                                                            if (ListItemData.price) {
                                                                return ListItemData.price + " p.";
                                                            }
                                                            return "Privet";
                                                        }
                                                        textStyle.base: SystemDefaults.TextStyles.SubtitleText
                                                    }
                                                }
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
