import bb.cascades 1.4
import "../components"

Page {
    id: root
    
    signal filmChosen(variant film);
    
    function populateBookmarks() {
        bookmarksDataModel.clear();
        bookmarksDataModel.append(_bookmarksService.getBookmarksMaps());
    }
    
    titleBar: CustomTitleBar {
        title: qsTr("Bookmarks") + Retranslate.onLocaleOrLanguageChanged
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        
        ListView {
            dataModel: ArrayDataModel {
                id: bookmarksDataModel
            }
            
            listItemComponents: [
                ListItemComponent {
                    ListItemFilm {
                        film: ListItemData
                        
                        contextActions: [
                            ActionSet {
                                title: qsTr("Bookmarks") + Retranslate.onLocaleOrLanguageChanged
                                ActionItem {
                                    title: qsTr("Remove from bookmarks") + Retranslate.onLocaleOrLanguageChanged
                                    
                                    onTriggered: {
                                        _bookmarksService.removeById(parseInt(ListItemData.id));
                                    }
                                }
                            }
                        ]
                    }
                }
            ]
            
            onTriggered: {
                var data = bookmarksDataModel.data(indexPath);
                filmChosen(data);
            }
        }
    }
    
    onCreationCompleted: {
        _bookmarksService.bookmarksChanged.connect(root.populateBookmarks);
        root.populateBookmarks();
    }
}
