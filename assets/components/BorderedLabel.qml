import bb.cascades 1.4

Container {
    id: root
    
    property string text: "PREMIERE"
    property double maxLabelWidth: 0
    
    verticalAlignment: VerticalAlignment.Center
    WebView {
        maxWidth: ui.du(root.maxLabelWidth === 0 ? 14 : root.maxLabelWidth)
        html: "<html><body><div style=\"padding: 1px; text-align: center; border: 1px solid black; border-radius: 5px; font-size: 24px;\">" + text + "</div></body></html>"
    }
}
