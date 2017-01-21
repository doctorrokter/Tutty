import bb.cascades 1.4

Container {
    id: root
    
    signal placeChosen(variant place); 
    
    property variant places: []
    property int touchY: 0
    
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill
    
    ListView {
        id: rootListView
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        scrollRole: ScrollRole.Main
        topPadding: subHeader.isShown ? subHeader.height : 0
        
        dataModel: GroupDataModel {
            id: placesDataModel
            sortingKeys: ["title"]
            grouping: ItemGrouping.ByFirstChar
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
                    text: ListItemData
                }   
            },
            
            ListItemComponent {
                type: "item"
                StandardListItem {
                    title: ListItemData.title
                    description: ListItemData.address
                }
            }
        ]
        
        onTriggered: {
            var data = placesDataModel.data(indexPath);
            placeChosen(data);
        }
    }
    
    onPlacesChanged: {
        placesDataModel.clear();
        placesDataModel.insertList(root.places);
    }
    
    onTouch: {
        if (event.isDown()) {
            root.touchY = event.windowY;
        }
        
        if (event.isMove() || event.isUp()) {
            if (root.touchY > (event.windowY + 10)) { // scroll up
                subHeader.isShown = false;
            } else if (root.touchY < (event.windowY - 10)) { // scroll down
                subHeader.isShown = true;
            }
        }
    }
    
    function setPlaces(places) {
        root.places = places;
        placesChanged();
    }
}