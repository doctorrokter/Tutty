import bb.cascades 1.4
import bb.device 1.4

Dialog {
    
    signal dateChanged(variant jsDate)
    
    id: root
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        background: Color.create(0.0, 0.0, 0.0, 0.5)
        layout: DockLayout {}
        
        Container {
            id: mainContainer
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            maxHeight: ui.du(70)
            maxWidth: ui.du(70);
            background: Color.White
            
            DateTimePicker {
                id: dateTimePicker
                title: qsTr("Choose a date") + Retranslate.onLocaleOrLanguageChanged
                expanded: true
                mode: DateTimePickerMode.Date
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Left
                    Button {
                        text: qsTr("Cancel") + Retranslate.onLocaleOrLanguageChanged
                        
                        onClicked: {
                            root.close();
                        }
                    }
                }
                
                Container {
                    Button {
                        text: qsTr("Ok") + Retranslate.onLocaleOrLanguageChanged
                        
                        onClicked: {
                            dateChanged(new Date(dateTimePicker.value));
                            root.close();
                        }
                    }
                }
                
            }
        } 
    }
    
    onOpened: {
        dateTimePicker.expanded = true;
        if (hardware.modelName.toLowerCase().indexOf("q10") !== -1 || 
            hardware.modelName.toLowerCase().indexOf("q5") !== -1 ||
            hardware.modelName.toLowerCase().indexOf("720x720") !== -1) {
            mainContainer.background = Color.Black;
        }
    }
    
    attachedObjects: [
        HardwareInfo {
            id: hardware
        }
    ]
}