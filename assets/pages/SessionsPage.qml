import bb.cascades 1.4
import "../components"
import "../_javascript/Request.js" as Request 

Page {
    id: root
    
    property int filmId: 55376
    property string name: "\u0417\u0432\u0435\u0440\u043e\u043f\u043e\u043b\u0438\u0441"
    property variant items: {"1480971600":{"65421":{"78617":[{"idSession":"464232","session_time":"1481025600","bycard_session_id":"309442","price":"3.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=309442","3d":"0"}]}},"1481058000":{"65421":{"78617":[{"idSession":"464235","session_time":"1481112000","bycard_session_id":"309443","price":"3.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=309443","3d":"0"}]}},"1481144400":{"65421":{"78617":[{"idSession":"464238","session_time":"1481198400","bycard_session_id":"309444","price":"3.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=309444","3d":"0"}]}},"1481230800":{"65421":{"78617":[{"idSession":"464241","session_time":"1481284800","bycard_session_id":"309445","price":"3.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=309445","3d":"0"}]}},"1481317200":{"65421":{"78617":[{"idSession":"464244","session_time":"1481371200","bycard_session_id":"309446","price":"3.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=309446","3d":"0"}]}},"1481403600":{"65421":{"78617":[{"idSession":"464248","session_time":"1481464800","bycard_session_id":"309447","price":"3.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=309447","3d":"0"},{"idSession":"464250","session_time":"1481479200","bycard_session_id":"309448","price":"3.00","tickets_available":"1","buyTicketUrl":"http:\/\/order.bycard.by\/kino?session=309448","3d":"0"}]}}}
    
    titleBar: TitleBar {
        title: qsTr("Sessions: ") + Retranslate.onLocaleOrLanguageChanged + root.name
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
                        text: Qt.formatDate(new Date(ListItemData), "dddd, d MMMM")
                    }
                },
                
                ListItemComponent {
                    type: "item"
                    CustomListItem {
                        Container {
                            layout: DockLayout {}
                            horizontalAlignment: HorizontalAlignment.Fill
                            
                            topPadding: ui.du(2.5)
                            leftPadding: ui.du(2.5)
                            rightPadding: ui.du(2.5)
                            bottomPadding: ui.du(2.5)
                            
                            Container {
                                horizontalAlignment: HorizontalAlignment.Left
                                layout: StackLayout {
                                    orientation: LayoutOrientation.TopToBottom
                                }
                                
                                Label {
                                    text: "Cinema: "
                                    textStyle.base: SystemDefaults.TextStyles.PrimaryText
                                    multiline: true
                                }
                                
                                Label {
                                    text: "Cinema Address: "
                                    textStyle.base: SystemDefaults.TextStyles.SubtitleText
                                    multiline: true
                                }
                                
                                Label {
                                    text: "Time: "
                                    textStyle.base: SystemDefaults.TextStyles.BodyText
                                }
                                
                                Label {
                                    text: "Price: "
                                    textStyle.base: SystemDefaults.TextStyles.SubtitleText
                                }
                            }
                            
                            Container {
                                horizontalAlignment: HorizontalAlignment.Right
                                verticalAlignment: VerticalAlignment.Center
                                
                                maxWidth: ui.du(20)
                                
                                Button {
                                    text: qsTr("Buy") + Retranslate.onLocaleOrLanguageChanged
                                }
                            }
                        }
                    }
                }
            ]
        }
    }
    
    onCreationCompleted: {
        Request.methods.post({action: "sessions", city: "minsk", film_id: root.filmId, "daylimit": 365}, function(response) {
            var items = JSON.parse(response).items;
            var itemsArr = Object.keys(items).map(function(key) {
                var obj = {};
                obj["date"] = parseInt(key) * 1000;
                        
                var value = items[key];
                obj["value"] = items[key];
                return obj;
            });
            groupDataModel.insertList(itemsArr);
        });
//        var itemsArr = Object.keys(root.items).map(function(key) {
//                var obj = {};
//                obj["date"] = parseInt(key) * 1000;
//                
//                var value = root.items[key];
//                obj["value"] = root.items[key];
//                return obj;
//        });
//        groupDataModel.insertList(itemsArr);
    }
}
