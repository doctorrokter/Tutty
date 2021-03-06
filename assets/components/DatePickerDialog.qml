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
            background: ui.palette.background
            
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
    }
    
    attachedObjects: [
        HardwareInfo {
            id: hardware
        }
    ]
}