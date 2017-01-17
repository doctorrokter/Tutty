import bb.cascades 1.4
import "../components"
import "../actions"

Page {
    id: root
    
//    property variant comments: [{time: "2017-01-17 12:30", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"}]
    property variant comments: []
    property int page: 1
    property int pageSize: 15
    property bool hasNext: true
    
    function populateComments() {
        var commentsMaps = _filmsService.activeFilm.getCommentsMaps();
        if (root.comments.length === 0) {
            root.comments = commentsMaps;
            commentsDataModel.append(comments);
        } else {
            commentsMaps.forEach(function(cmt) {
                var isExists = root.comments.some(function(cmt1) {
                    return cmt1.id === cmt.id;
                });
                if (!isExists) {
                    var newComments = root.comments.slice();
                    newComments.push(cmt);
                    root.comments = newComments;
                    commentsDataModel.append(cmt);
                }
            });
        }
        if (_filmsService.activeFilm.commentsCnt === commentsMaps.length) {
            root.hasNext = false;
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
            id: listView
            
            scrollRole: ScrollRole.Main
            dataModel: ArrayDataModel {
                id: commentsDataModel
            }
            
            attachedObjects: [
                ListScrollStateHandler {
                    onScrollingChanged: {
                        if (atEnd) {
                            loadComments();
                        }
                    }
                }
            ]

            onTriggered: {
                var data = commentsDataModel.data(indexPath);
                var i = commentsDataModel.indexOf(data);
                if (data.hasOwnProperty("expanded")) {
                    data.expanded = !data.expanded;
                } else {
                    data.expanded = true;
                }
                commentsDataModel.replace(i, data);
            }

            listItemComponents: [
                ListItemComponent {
                    CustomListItem {
                        id: rootItem
                        highlightAppearance: HighlightAppearance.None
                        
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
                                maxHeight: ListItemData.hasOwnProperty("expanded") && ListItemData.expanded ? Infinity : ui.du(15)
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
            var limit = root.pageSize
            if (root.page !== 1) {
                if (root.page === 2) {
                    from = root.pageSize - 1;
                    limit = (root.pageSize * 2) - 1;
                } else {
                    from = ((root.page * root.pageSize) - root.pageSize) - (root.page - 1);
                    limit = (root.pageSize * root.page) - (root.page - 1);
                }
            }
            filmsActions.comments(from, limit, function(response) {
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
