import bb.cascades 1.4
import "../components"

Page {
    id: root
    
    property string placeTitle
    property string address
    
    titleBar: CustomTitleBar {
        title: root.placeTitle
    }
    
    function generateUrl() {
        return "https://www.google.by/maps/place/" + root.address.replace(/ /g, "+");
    }
    
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    
    ScrollView {
        scrollRole: ScrollRole.Main
        verticalAlignment: VerticalAlignment.Fill
        horizontalAlignment: HorizontalAlignment.Fill
        implicitLayoutAnimationsEnabled: false
        scrollViewProperties.minContentScale: 1.0
        WebView {
            id: webView
            url: generateUrl()
        }
        
        attachedObjects: LayoutUpdateHandler {
            onLayoutFrameChanged: {
                webView.preferredWidth = layoutFrame.width;
                webView.preferredHeight = layoutFrame.height;
            }
        }
    }
    
    onPlaceTitleChanged: {
        root.titleBar.title = root.placeTitle;
    }
    
    onAddressChanged: {
        webView.url = generateUrl();
        webView.reload();
    }
}
