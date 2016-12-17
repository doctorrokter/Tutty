import bb.cascades 1.4
import bb.system 1.2
import "../components"
import "../sheets"
import "../_javascript/Request.js" as Request 

Page {
    id: root
    
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
                    CustomListItem {
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
                                        text: ListItemData.cinema.title
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
                                            sessionDialog.sessions = ListItemData.sessions;
                                            sessionDialog.cinema = ListItemData.cinema;
                                            sessionDialog.show();
                                        }
                                    }
                                }
                                
                                Label {
                                    text: ListItemData.cinema.address
                                    textStyle.base: SystemDefaults.TextStyles.SubtitleText
                                    multiline: true
                                }
                                
                                Container {
                                    layout: StackLayout {
                                        orientation: LayoutOrientation.TopToBottom
                                    }
                                
                                    Container {
                                        id: regularSessions
                                        layout: StackLayout {
                                            orientation: LayoutOrientation.LeftToRight
                                        }
                                        
                                        onCreationCompleted: {
                                            var sessions = ListItemData.sessions.filter(function(session) {
                                                return parseInt(session["3d"]) === 0;
                                            });
                                            sessions.forEach(function(s) {
                                                var timePriceContainer = emptyContainer.createObject(this);    
                                                
                                                var timeContainer = sessionContainer.createObject(this);
                                                var timestamp = Number(s.session_time) * 1000;
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
                                            var sessions = ListItemData.sessions.filter(function(session) {
                                                    return parseInt(session["3d"]) === 1;
                                            });
                                            sessions.forEach(function(s) {
                                                var timePriceContainer = emptyContainer.createObject(this);    
                                                
                                                var timeContainer = sessionContainer.createObject(this);
                                                var timestamp = Number(s.session_time) * 1000;
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
                                        
                                        Label {
                                            horizontalAlignment: HorizontalAlignment.Center
                                            text: session.text
                                            textStyle.base: session.textStyle
                                        }
                                    }
                                },
                                
                                SystemListDialog {
                                    id: sessionDialog
                                    
                                    property variant cinema
                                    property variant sessions
                                    
                                    title: qsTr("Choose a session") + Retranslate.onLocaleOrLanguageChanged
                                    
                                    onFinished: {
                                        var s = sessionDialog.sessions[value - 1];
                                        browser.query.uri = s.buyTicketUrl;
                                    }
                                    
                                    onSessionsChanged: {
                                        sessionDialog.sessions.forEach(function(s) {
                                            sessionDialog.appendItem(Qt.formatTime(new Date(Number(s.session_time) * 1000), "HH:mm"));
                                        });
                                    }
                                },
                                
                                WebSheet {
                                    id: webSheet
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
                                        // don't auto-trigger on initial setup
                                        if (browser.autoTrigger) {
                                            trigger("bb.action.OPEN");
                                        }
                                        browser.autoTrigger = true;    // allow re-arming to auto-trigger
                                    }
                                }
                            ]
                        }
                    }
                }
            ]
        }
    }
    
    onCreationCompleted: {
        Request.methods.post({action: "sessions", city: "minsk", film_id: _filmsService.activeFilm.id, "daylimit": 365}, function(response) {
            var items = JSON.parse(response).items;
            var dates = Object.keys(items);
            var data = [];
            dates.forEach(function(date) {
                var cinemasIds = items[date][_filmsService.activeFilm.id];
                
                Object.keys(cinemasIds).forEach(function(cinemaId) {
                    var sessionObj = {};
                    var cinema = _filmsService.findCinemaById(cinemaId);
                    sessionObj.cinema = cinema;
                    sessionObj.sessions = cinemasIds[cinemaId];
                    sessionObj.date = Number(date);
                    data.push(sessionObj);
                });
                
            });
            groupDataModel.insertList(data);
        });
//        var data = [];
//        data.push({
//            data: 1481835600, 
//            cinema: {address: 'Gorodetskaya 2-152', title: '3D Kino v Zamke / 3D Kino v Zamke'}, 
//            sessions: [{"idSession":"472527","session_time":"1481901600","bycard_session_id":"311152","price":"19.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311152","3d":"1"},{"idSession":"472538","session_time":"1481904000","bycard_session_id":"311143","price":"31.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311143","3d":"0"},{"idSession":"472989","session_time":"1481912400","bycard_session_id":"311153","price":"19.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311153","3d":"1"}]
//        });
//        data.push({
//            data: 1481835600, 
//            cinema: {address: 'Gorodetskaya 2-152', title: 'Salut'}, 
//            sessions: [{"idSession":"472527","session_time":"1481901600","bycard_session_id":"311152","price":"19.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311152","3d":"1"},{"idSession":"472538","session_time":"1481904000","bycard_session_id":"311143","price":"31.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311143","3d":"0"},{"idSession":"472989","session_time":"1481912400","bycard_session_id":"311153","price":"19.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=311153","3d":"1"}]
//        });
//        data.push({
//            data: 1481835600, 
//            cinema: {address: 'Gorodetskaya 2-152', title: 'Salut'}, 
//            sessions: [{"idSession":"469969","session_time":"1481901000","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236451\/","3d":"1"},{"idSession":"469230","session_time":"1481901600","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236389\/","3d":"1"},{"idSession":"469231","session_time":"1481902200","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236390\/","3d":"1"},{"idSession":"469232","session_time":"1481904000","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236391\/","3d":"0"},{"idSession":"469971","session_time":"1481910600","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236457\/","3d":"1"},{"idSession":"469233","session_time":"1481911200","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236393\/","3d":"1"},{"idSession":"469972","session_time":"1481911500","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236452\/","3d":"0"},{"idSession":"469234","session_time":"1481911800","bycard_session_id":"0","price":"","tickets_available":"1","buyTicketUrl":"http:\/\/www.silverscreen.by\/Websales\/Show\/236387\/","3d":"1"}]
//        });
//        groupDataModel.insertList(data);
    }
}
