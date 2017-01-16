import bb.cascades 1.4
import "../components"
import "../actions"

Page {
    id: root
    
    property variant comments: []
    property int page: 1
    property int pageSize: 15
    property bool hasNext: true
    
    function populateComments() {
        if (root.comments.length === 0) {
            root.comments = _filmsService.activeFilm.getCommentsMaps();
            commentsDataModel.append(comments);
        } else {
            _filmsService.activeFilm.getCommentsMaps().forEach(function(cmt) {
                var isExists = root.comments.some(function(cmt1) {
                    return cmt1.id === cmt.id;
                });
                if (!isExists) {
                    root.comments.push(cmt);
                    commentsDataModel.append(cmt);
                }
            });
        }
    }
    
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
            
//            attachedObjects: [
//                ListScrollStateHandler {
//                    onScrollingChanged: {
//                        if (atEnd) {
//                            loadComments();
//                        }
//                    }
//                }
//            ]
            
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
                                        if (!ListItemData.firstName && !ListItemData.lastName) {
                                            return qsTr("Guest") + Retranslate.onLocaleOrLanguageChanged;
                                        }
                                        return ListItemData.firstName + " " + ListItemData.lastName;
                                    }
                                    textStyle.base: SystemDefaults.TextStyles.TitleText
                                }
                            }
                            
                            Container {
                                layout: DockLayout {}
                                horizontalAlignment: HorizontalAlignment.Fill
                                topPadding: ui.du(2)
                                bottomPadding: ui.du(1.0)
                                
                                Container {
                                    Label {
                                        text: getDate(ListItemData.time)
                                        horizontalAlignment: HorizontalAlignment.Left
                                        textStyle.base: SystemDefaults.TextStyles.SubtitleText
                                        textStyle.fontWeight: FontWeight.W100
                                    }
                                }
                                
                                Rating {
                                    rate: ListItemData.commentRatingTen
                                    horizontalAlignment: HorizontalAlignment.Right
                                }
                            }
                            
                            Container {
                                Label {
                                    text: ListItemData.comment
                                    multiline: true
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
    
    function loadComments() {
        if (!spinner.running && root.hasNext) {
            var from = 0;
            if (root.page !== 1) {
                if (root.page === 2) {
                    from = root.pageSize;
                } else {
                    from = (root.page * root.pageSize) - root.pageSize;
                }
            }
            filmsActions.comments(from, root.pageSize, function(response) {
                    var items = JSON.parse(response).items;
                    if (items.length === 0 || items.length < root.pageSize) {
                        root.hasNext = false;
                    } else {
                        root.page++;
                    }
                    _filmsService.appendComments(items);
            });
        }
    }
    
    onCreationCompleted: {
        commentsDataModel.clear();
        _filmsService.activeFilm.commentsChanged.connect(root.populateComments);
        var film = _filmsService.activeFilm;
        if (film.commentsCnt !== film.getCommentsMaps().length) {
            loadComments();
        } else {
            root.populateComments();
        }
//        commentsDataModel.append(root.comments);
    }
}
