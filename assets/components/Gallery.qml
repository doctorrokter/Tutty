import bb.cascades 1.4

Container {
    id: root
    
    property variant images
    
    ScrollView {
        scrollViewProperties.scrollMode: ScrollMode.Horizontal
        horizontalAlignment: HorizontalAlignment.Fill
        
        Container {
            id: gallery
            leftPadding: ui.du(2.5)
            rightPadding: ui.du(2.5)
            horizontalAlignment: HorizontalAlignment.Fill
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
        }
        
        onCreationCompleted: {
            root.images.forEach(function(image) {
                var img = imageWebView.createObject();
                img.url = image;
                gallery.add(img);
            });
        }
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: imageWebView
            WebView {
                maxWidth: ui.du(15)
                minWidth: ui.du(15)
                rightMargin: ui.du(2.5)
            }
        }
    ]
}
