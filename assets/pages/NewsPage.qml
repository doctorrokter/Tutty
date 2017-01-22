import bb.cascades 1.4
import bb.data 1.0
import "../components"

Page {
    id: root
    
    titleBar: CustomTitleBar {
        title: qsTr("News") + Retranslate.onLocaleOrLanguageChanged
    }
    
    ListView {
        id: newsListView
        
        dataModel: ArrayDataModel {
            id: newsDataModel
        }
        
        listItemComponents: [
            ListItemComponent {
                StandardListItem {
                    title: "Dsdf"
                }
            }
        ]
        
        attachedObjects: [
            DataSource {
                id: dataSource
                source: "https://news.tut.by/rss/afisha.rss"
                type: DataSource.Xml
                
                onDataLoaded: {
                    newsDataModel.clear();
                    newsDataModel.insertList(data);
                }
            }
        ]
    }
    
    onCreationCompleted: {
        dataSource.load();
    }
}
