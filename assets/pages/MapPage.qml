import bb.cascades 1.4
import "../components"

Page {
    id: root
    
    property string cinema: "Moscow"
    property string address: "Минск пр-т Победителей, 65"
    
    titleBar: CustomTitleBar {
        title: root.cinema
    }
    
    function generateUrl() {
        return "https://www.google.by/maps/place/" + root.address.replace(/ /g, "+");
    }
    
    Container {
        layout: DockLayout {}
        ScrollView {
            scrollRole: ScrollRole.Main
            Container {
                WebView {
                    id: webView
                    preferredHeight: Infinity
                    url: generateUrl()
                }
            }
        }
    }
    
    onCinemaChanged: {
        root.titleBar.title = root.cinema;
    }
    
    onAddressChanged: {
        console.debug(root.address);
        webView.url = generateUrl();
        webView.reload();
    }
}
