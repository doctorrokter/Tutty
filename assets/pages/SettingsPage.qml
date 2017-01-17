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
                    text: qsTr("Dark theme")
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
        }
    }
}