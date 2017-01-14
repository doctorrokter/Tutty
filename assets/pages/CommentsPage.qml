import bb.cascades 1.4
import "../components"
import "../actions"

Page {
    id: root
    
    property variant comments: [{"id":"164389","event_id":66072,"time":"2017-01-13 15:36:43","login":"KorNick.TUT","firstname":"","secondname":"","comment":"\u041f\u0440\u0435\u043a\u0440\u0430\u0441\u043d\u044b\u0439! \u041a\u0440\u0430\u0441\u0438\u0432\u044b\u0439! \u0420\u043e\u043c\u0430\u043d\u0442\u0438\u0447\u043d\u044b\u0439! \n\u0427\u0443\u0434\u0435\u0441\u043d\u043e\u0435 \u043c\u0443\u0437\u044b\u043a\u0430\u043b\u044c\u043d\u043e\u0435 \u043f\u0443\u0442\u0435\u0448\u0435\u0441\u0442\u0432\u0438\u0435 \u043f\u043e \u043f\u0443\u0442\u0438 \u043a \u043c\u0435\u0447\u0442\u0435. \u0418 \u0431\u0435\u0441\u043a\u043e\u043c\u043f\u0440\u043e\u043c\u0438\u0441\u0441\u043d\u043e\u0435 \u0432\u043e\u0441\u0445\u043e\u0436\u0434\u0435\u043d\u0438\u0435 \u043a \u0443\u0441\u043f\u0435\u0445\u0443, \u043a\u043e\u0442\u043e\u0440\u043e\u0435 \u043d\u0435 \u043e\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442 \u0434\u0430\u0436\u0435 \u043b\u044e\u0431\u043e\u0432\u044c. \n\u041f\u043e\u043b\u0451\u0442 \u0432 \u043c\u0435\u0447\u0442\u0435.. \u041c\u0435\u0447\u0442\u0430 \u043e \u043c\u0435\u0447\u0442\u0435...","comment_rating":5,"comment_rating_ten":10},{"id":"164374","event_id":66072,"time":"2017-01-12 21:45:35","login":"Everglades","firstname":"\u0414\u043c\u0438\u0442\u0440\u0438\u0439","secondname":"\u0422\u0438\u0445\u043e\u043d\u043e\u0432\u0438\u0447","comment":"\u041e\u0447\u0435\u043d\u044c \u0447\u0430\u0441\u0442\u043e \u043a\u0440\u0438\u0442\u0438\u043a\u0438 \u0432 \u0441\u0432\u043e\u0438\u0445 \u0440\u0435\u0446\u0435\u043d\u0437\u0438\u044f\u0445 \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u044e\u0442 \u043f\u043e\u043d\u044f\u0442\u0438\u0435 \"\u0443\u0430\u0443-\u044d\u0444\u0444\u0435\u043a\u0442\". \u0414\u043b\u044f \u043c\u0435\u043d\u044f \u0442\u0430\u043a\u0438\u043c \u044d\u0444\u0444\u0435\u043a\u0442\u043e\u043c \u0441\u0442\u0430\u043b\u043e \"\u0423\u0430\u0443! \u041c\u043d\u0435 \u043c\u043e\u0436\u0435\u0442 \u043f\u043e\u043d\u0440\u0430\u0432\u0438\u0442\u044c\u0441\u044f \u043c\u044e\u0437\u0438\u043a\u043b!\" (\u043a \u0441\u043b\u043e\u0432\u0443, \u043f\u0435\u0440\u0435\u043a\u043e\u0441\u0430 \u0432 \u0441\u0442\u043e\u0440\u043e\u043d\u0443 \u043c\u044e\u0437\u0438\u043a\u043b\u0430 \u0442\u0443\u0442 \u043d\u0435\u0442, \u0435\u0433\u043e \u0440\u043e\u0432\u043d\u043e \u0441\u0442\u043e\u043b\u044c\u043a\u043e, \u0441\u043a\u043e\u043b\u044c\u043a\u043e \u043d\u0443\u0436\u043d\u043e, \u0447\u0442\u043e\u0431\u044b \u043d\u0435 \u043d\u0430\u0434\u043e\u0435\u0441\u0442\u044c \u0437\u0440\u0438\u0442\u0435\u043b\u044e). \u0415\u0441\u043b\u0438 \u0431\u044b \u043f\u043e\u043d\u0430\u0434\u043e\u0431\u0438\u043b\u043e\u0441\u044c \u043e\u043f\u0438\u0441\u0430\u0442\u044c \u0434\u0430\u043d\u043d\u044b\u0439 \u0444\u0438\u043b\u044c\u043c \u043e\u0434\u043d\u0438\u043c \u0441\u043b\u043e\u0432\u043e\u043c, \u0438\u043c \u0431\u044b \u0441\u0442\u0430\u043b\u043e \u0441\u043b\u043e\u0432\u043e \"\u043f\u0440\u0438\u044f\u0442\u043d\u044b\u0439\". \u041c\u044f\u0433\u043a\u0430\u044f \u043a\u0430\u0440\u0442\u0438\u043d\u043a\u0430, \u0437\u0432\u0443\u043a \u043f\u0440\u0438\u044f\u0442\u043d\u043e \u0434\u043e\u043f\u043e\u043b\u043d\u044f\u0435\u0442 \u0432\u0438\u0437\u0443\u0430\u043b\u044c\u043d\u0443\u044e \u0441\u043e\u0441\u0442\u0430\u0432\u043b\u044f\u044e\u0449\u0443\u044e, \u0441\u0430\u0443\u043d\u0434\u0442\u0440\u0435\u043a\u0438 \u0433\u0440\u0430\u043c\u043e\u0442\u043d\u043e \u043f\u043e\u0434\u043e\u0431\u0440\u0430\u043d\u044b, \u0432\u044b\u0439\u0434\u044f \u0438\u0437 \u043a\u0438\u043d\u043e\u0442\u0435\u0430\u0442\u0440\u0430 \u043d\u0430\u0432\u0435\u0440\u043d\u044f\u043a\u0430 \u0431\u0443\u0434\u0435\u0442\u0435 \u043d\u0430\u0441\u0432\u0438\u0441\u0442\u044b\u0432\u0430\u0442\u044c \"City of stars...\". \u041d\u0430\u0432\u0435\u0440\u043d\u043e\u0435, \u0435\u0441\u043b\u0438 \u0431\u044b \u0444\u0438\u043b\u044c\u043c \u043c\u043e\u0436\u043d\u043e \u0431\u044b\u043b\u043e \u043f\u043e\u0442\u0440\u043e\u0433\u0430\u0442\u044c, \u043f\u043e\u043d\u044e\u0445\u0430\u0442\u044c \u0438 \u043f\u043e\u0447\u0443\u0432\u0441\u0442\u0432\u043e\u0432\u0430\u0442\u044c \u043d\u0430 \u0432\u043a\u0443\u0441, \u0442\u043e \u044d\u0442\u0438 \u043e\u0449\u0443\u0449\u0435\u043d\u0438\u044f \u0442\u043e\u0436\u0435 \u0431\u044b\u043b\u0438 \u0431\u044b \u043f\u0440\u0438\u044f\u0442\u043d\u044b\u043c\u0438. \u041f\u0440\u0438\u044f\u0442\u043d\u043e \u0443\u0434\u0438\u0432\u0438\u043b\u0430 \u042d\u043c\u043c\u0430 \u0421\u0442\u043e\u0443\u043d, \u043a\u043e\u0442\u043e\u0440\u0430\u044f \u043d\u0435 \u043e\u0442\u044b\u0433\u0440\u044b\u0432\u0430\u0435\u0442 \u0437\u0434\u0435\u0441\u044c \u0441\u0432\u043e\u044e \u0444\u0430\u043c\u0438\u043b\u0438\u044e. \u0413\u043e\u0441\u043b\u0438\u043d\u0433 \u0441\u044b\u0433\u0440\u0430\u043b \u0441\u043a\u043e\u0440\u0435\u0435 \u0442\u0438\u043f\u0438\u0447\u043d\u043e\u0433\u043e \u0441\u0435\u0431\u044f \u0441 \u043b\u0435\u0433\u043a\u0438\u043c \u043d\u0430\u043b\u0435\u0442\u043e\u043c \u0441\u0432\u043e\u0435\u0433\u043e \u043f\u0435\u0440\u0441\u043e\u043d\u0430\u0436\u0430 \u0438\u0437 \"\u0425\u043e\u0440\u043e\u0448\u0438\u0445 \u043f\u0430\u0440\u043d\u0435\u0439\" - \u044d\u0434\u0430\u043a\u0438\u0439 \u0447\u0443\u0434\u0430\u043a\u043e\u0432\u0430\u0442\u044b\u0439, \u0441\u043b\u0435\u0433\u043a\u0430 \u0443\u043a\u0443\u0440\u0435\u043d\u043d\u044b\u0439 \u0438 \u0441 \u0432\u0435\u0447\u043d\u044b\u043c \u043f\u0440\u0438\u0449\u0443\u0440\u043e\u043c \u0440\u043e\u043c\u0430\u043d\u0442\u0438\u043a. \u041e\u0431\u0430 \u043e\u0442\u043b\u0438\u0447\u043d\u043e \u043f\u043e\u043f\u0430\u043b\u0438 \u0432 \u0440\u043e\u043b\u0438. \u041d\u0435\u0437\u0430\u043c\u044b\u0441\u043b\u043e\u0432\u0430\u0442\u044b\u0439 \u0441\u044e\u0436\u0435\u0442, \u043a\u043e\u0442\u043e\u0440\u044b\u0439, \u0432 \u043f\u0440\u0438\u043d\u0446\u0438\u043f\u0435, \u0434\u043b\u044f \u043f\u043e\u0434\u043e\u0431\u043d\u044b\u0445 \u0442\u0432\u043e\u0440\u0435\u043d\u0438\u0439 \u0432\u0442\u043e\u0440\u0438\u0447\u0435\u043d, \u0443\u043c\u0443\u0434\u0440\u044f\u0435\u0442\u0441\u044f \u0434\u043e\u043d\u0435\u0441\u0442\u0438 \u0434\u043e \u043d\u0430\u0441 \u0434\u0432\u0435 \u0432\u0430\u0436\u043d\u044b\u0445 \u043c\u044b\u0441\u043b\u0438: \u0442\u044b \u043c\u043e\u0436\u0435\u0448\u044c \u043f\u0440\u043e\u0436\u0438\u0442\u044c \u0442\u043e\u043b\u044c\u043a\u043e \u043e\u0434\u043d\u0443 \u0436\u0438\u0437\u043d\u044c, \u043f\u043e\u044d\u0442\u043e\u043c\u0443 \u043e\u0447\u0435\u043d\u044c \u0432\u0430\u0436\u043d\u043e \u043d\u0435 \u0441\u0434\u0435\u043b\u0430\u0442\u044c \u0432 \u0436\u0438\u0437\u043d\u0438 \u0440\u043e\u043a\u043e\u0432\u0443\u044e \u043e\u0448\u0438\u0431\u043a\u0443... \u0412\u0442\u043e\u0440\u0430\u044f \u0435\u0449\u0435 \u043d\u0435\u043e\u0431\u044b\u0447\u043d\u0435\u0439: \u0434\u0430\u0436\u0435 \u0440\u0435\u0430\u043b\u0438\u0437\u043e\u0432\u0430\u0432 \u0441\u0432\u043e\u044e \u0437\u0430\u0432\u0435\u0442\u043d\u0443\u044e \u043c\u0435\u0447\u0442\u0443 \u0442\u044b \u043c\u043e\u0436\u0435\u0448\u044c \u043d\u0435 \u043e\u0449\u0443\u0449\u0430\u0442\u044c \u0432\u0441\u044e \u0440\u0430\u0434\u043e\u0441\u0442\u044c \u0436\u0438\u0437\u043d\u0438...","comment_rating":5,"comment_rating_ten":9}]
    
    titleBar: CustomTitleBar {
        title:qsTr("Comments") + ": " + _filmsService.activeFilm.name
    }
    
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    
    Container {
        layout: DockLayout {}
        
        Spinner {
            id: spinner
        }
        
        ListView {
            scrollRole: ScrollRole.Main
            
            dataModel: ArrayDataModel {
                id: commentsDataModel
            }
            
            listItemComponents: [
                ListItemComponent {
                    CustomListItem {
                        
                        function getDate(dateStr) {
                            var dateTimeParts = dateStr.split(" ");
                            var dateParts = dateTimeParts[0].split("-");
                            var timeParts = dateTimeParts[1].split(":");
                            var date = new Date(
                            parseInt(dateParts[0]), parseInt(dateParts[1]) - 1, parseInt(dateParts[2]),
                            parseInt(timeParts[0]), parseInt(timeParts[1]), parseInt(timeParts[2])
                            );
                            return Qt.formatDateTime(date, "dddd, d MMMM HH:mm");
                        }
                        
                        Container {
                            leftPadding: ui.du(2.5)
                            rightPadding: ui.du(2.5)
                            topPadding: ui.du(2.5)
                            bottomPadding: ui.du(2.5)
                            horizontalAlignment: HorizontalAlignment.Fill
                            
                            Container {
                                Label {
                                    text: {
                                        if (!ListItemData.firstname && !ListItemData.secondname) {
                                            return qsTr("Guest") + Retranslate.onLocaleOrLanguageChanged;
                                        }
                                        return ListItemData.firstname + " " + ListItemData.secondname;
                                    }
                                    textStyle.base: SystemDefaults.TextStyles.TitleText
                                }
                            }
                            
                            Container {
                                layout: DockLayout {}
                                horizontalAlignment: HorizontalAlignment.Fill
                                topPadding: ui.du(2)
                                
                                Container {
                                    Label {
                                        text: getDate(ListItemData.time)
                                        horizontalAlignment: HorizontalAlignment.Left
                                        textStyle.base: SystemDefaults.TextStyles.SubtitleText
                                        
                                    }
                                }
                                
                                Rating {
                                    rate: ListItemData.comment_rating_ten
                                    horizontalAlignment: HorizontalAlignment.Right
                                }
                            }
                            
                            Container {
                                Label {
                                    text: ListItemData.comment
                                    multiline: true
                                    textStyle.base: SystemDefaults.TextStyles.BodyText
                                }
                            }
                        }
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
        filmsActions.comments(function(response) {
            var commentsList = JSON.parse(response).items;
            commentsDataModel.clear();
            commentsDataModel.append(commentsList);
        });
//        commentsDataModel.append(root.comments);
    }
}
