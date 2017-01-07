import bb.cascades 1.4

TitleBar {
    id: root
    
    property bool calendarEnabled: false
    property bool locationEnabled: false
    
    signal dateChanged(variant jsDate)
    
    appearance: TitleBarAppearance.Plain
    kind: TitleBarKind.FreeForm
    
    kindProperties: FreeFormTitleBarKindProperties {
        content:
        Container {
            background: Application.themeSupport.theme.colorTheme.primaryBase
            leftPadding: ui.du(2)
            rightPadding: ui.du(2)
            layout: DockLayout {}
            Label {
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Center
                
                text: qsTr(title)
                
                textStyle.base: SystemDefaults.TextStyles.TitleText
                textStyle.color: Color.White
            }
            
            Container {
                visible: root.calendarEnabled
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Center
                ImageView {
                    imageSource: "asset:///images/calendar.png"
                }
                
                gestureHandlers: [
                    TapHandler {
                        onTapped: {
                            datePickerDialog.open();
                        }
                    }
                ]
            }
            
            Container {
                visible: root.locationEnabled
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Center
                margin.rightOffset: ui.du(10)
                
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                Label {
                    text: _citiesService.currentCity.title || "Минск"
                    textStyle.color: Color.White
                    verticalAlignment: VerticalAlignment.Center
                }
                
                ImageView {
                    imageSource: "asset:///images/marker.png"
                }
                
                gestureHandlers: [
                    TapHandler {
                        onTapped: {
                            cityPicker.open();
                        }
                    }
                ]
            }
        }
    }
    
    attachedObjects: [
        DatePickerDialog {
            id: datePickerDialog
            
            onDateChanged: {
                root.dateChanged(jsDate);
            }
        },
        
        CityPickerDialog {
            id: cityPicker
        }
    ]
}
