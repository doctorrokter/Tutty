import bb.cascades 1.4

Sheet {
    id: sheet
    
    property string url
    property string title: 'Title Bar'
    
    Page {
        
        titleBar: TitleBar {
            title: sheet.title
        }
        
        actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
        actionBarVisibility: ChromeVisibility.Overlay
        
        Container {
            layout: DockLayout {}
            ScrollView {
                scrollRole: ScrollRole.Main
                scrollViewProperties {
                    scrollMode: ScrollMode.Both
                    pinchToZoomEnabled: true
                }
                WebView {
                    id: webView
                    
                    property double scaleFactor: 0.5
                    
                    url: sheet.url
                    
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    preferredHeight: Infinity
                    settings.viewport: {
                        "initial-scale": webView.scaleFactor,
                        "width": "device-width"
                    }
                }    
            }
        }
        
        actions: [
            ActionItem {
                title: qsTr('Cancel') + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.Signature
                onTriggered: {
                    sheet.close();
                }
            }
        ]
    }
}
