import bb.cascades 1.4
import "../components"

Page {
    
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    actionBarVisibility: ChromeVisibility.Overlay
    
    titleBar: CustomTitleBar {
        title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
    }
    
    ScrollView {
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            Container {
                layout: DockLayout {}
                topPadding: ui.du(2)
                bottomPadding: ui.du(0.5)
                leftPadding: ui.du(2.5)
                rightPadding: ui.du(2.5)
                horizontalAlignment: HorizontalAlignment.Fill
                Label {
                    text: qsTr("Dark theme") + Retranslate.onLocaleOrLanguageChanged
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                }
                
                ToggleButton {
                    horizontalAlignment: HorizontalAlignment.Right
                    checked: {
                        var theme = _appConfig.get("theme");
                        return theme && theme === "DARK";
                    }
                    
                    onCheckedChanged: {
                        if (checked) {
                            Application.themeSupport.setVisualStyle(VisualStyle.Dark);
                            _appConfig.set("theme", "DARK");
                        } else {
                            Application.themeSupport.setVisualStyle(VisualStyle.Bright);
                            _appConfig.set("theme", "BRIGHT");
                        }
                    }
                }
            }
            Divider {}
            
//            Container {
//                layout: DockLayout {}
//                topPadding: ui.du(2)
//                bottomPadding: ui.du(0.5)
//                leftPadding: ui.du(2.5)
//                rightPadding: ui.du(2.5)
//                horizontalAlignment: HorizontalAlignment.Fill
//                Label {
//                    text: qsTr("Create events in Calendar") + Retranslate.onLocaleOrLanguageChanged
//                    verticalAlignment: VerticalAlignment.Center
//                    horizontalAlignment: HorizontalAlignment.Left
//                }
//                
//                ToggleButton {
//                    horizontalAlignment: HorizontalAlignment.Right
//                    checked: {
//                        var shouldCreateEvents = _appConfig.get("create_event_on_buy_ticket");
//                        return shouldCreateEvents && shouldCreateEvents === "true";
//                    }
//                    
//                    onCheckedChanged: {
//                        if (checked) {
//                            _appConfig.set("create_event_on_buy_ticket", "true");
//                        } else {
//                            _appConfig.set("create_event_on_buy_ticket", "false");
//                        }
//                    }
//                }
//            }
//            Divider {}
        }
    }
}