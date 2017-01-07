import bb.cascades 1.4

Dialog {
    
    id: root
    
    property variant data: [{"title": "Misnk"}, {"title": "Gomel"}]
    
    function populateCities() {
        cityDataModel.append(_citiesService.toMaps());
        if (!_citiesService.currentCity) {
            cities.select([0]);
        }
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        background: Color.create(0.0, 0.0, 0.0, 0.5)
        layout: DockLayout {}
        
        Container {
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            maxHeight: ui.du(70)
            maxWidth: ui.du(70);
            background: Color.White
            
            ListItemHeader {
                text: qsTr("Choose a city") + Retranslate.onLocaleOrLanguageChanged
            }
            
            ListView {
                id: cities
                dataModel: ArrayDataModel {
                    id: cityDataModel
                }
                
                listItemComponents: [
                    ListItemComponent {
                        CustomListItem {
                            id: listItemCustom
                            Container {
                                horizontalAlignment: HorizontalAlignment.Fill
                                verticalAlignment: VerticalAlignment.Fill
                                layout: DockLayout {}
                                background: listItemCustom.ListItem.selected ? Application.themeSupport.theme.colorTheme.primary : Color.White
                                Label {
                                    verticalAlignment: VerticalAlignment.Center
                                    horizontalAlignment: HorizontalAlignment.Left
                                    margin.leftOffset: ui.du(5)
                                    text: ListItemData.title
                                    textStyle.base: SystemDefaults.TextStyles.PrimaryText
                                    textStyle.color: listItemCustom.ListItem.selected ? Color.White : Color.Black
                                }
                            }
                        }
                    }
                ]
                
                onTriggered: {
                    var city = cityDataModel.data(indexPath);
                    cities.clearSelection();
                    cities.select(indexPath);
                    _citiesService.setCurrentCity(city.id);
                    root.close();
                }
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                Button {
                    horizontalAlignment: HorizontalAlignment.Fill
                    text: qsTr("Cancel") + Retranslate.onLocaleOrLanguageChanged
                    
                    onClicked: {
                        root.close();
                    }
                }            
            }
        } 
    }
    
    onCreationCompleted: {
        _citiesService.citiesChanged.connect(root.populateCities);
    }
}