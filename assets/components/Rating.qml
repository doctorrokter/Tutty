import bb.cascades 1.4

Container {
    id: root
    
    property string rate: "8.5"
    
    visible: root.rate !== "0" && root.rate !== "0.0"
    
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    Label {
        text: root.rate
        textStyle.color: Color.Red       
    }
    ImageView {
        maxWidth: ui.du(4.5)
        maxHeight: ui.du(4.5)
        imageSource: "asset:///images/ic_favorite.png"
        filterColor: Color.Red
    }
}