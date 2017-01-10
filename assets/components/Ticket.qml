import bb.cascades 1.4

Container {
    id: root
    
    property variant timestamp: 0
    property string price: "8.80"
    property bool threeD: true
    
    maxWidth: ui.du(20)
    minWidth: ui.du(20)
    maxHeight: ui.du(15)
    minHeight: ui.du(15)
    
    layout: DockLayout {}
    
    Label {
        text: Qt.formatTime(new Date(Number(root.timestamp)), "HH:mm")
        textStyle.base: SystemDefaults.TextStyles.PrimaryText
        margin.topOffset: ui.du(4.25)
        margin.leftOffset: ui.du(1.5)
    }
    
    Label {
        text: "3D"
        textStyle.base: SystemDefaults.TextStyles.SubtitleText
        margin.topOffset: ui.du(5.25)
        margin.leftOffset: ui.du(14.75)
        visible: root.threeD
    }
    
    Label {
        visible: root.price !== undefined && root.price !== null && root.price !== ''
        text: root.price + " p."
        textStyle.base: SystemDefaults.TextStyles.SmallText
        margin.topOffset: ui.du(10.5)
        margin.leftOffset: ui.du(6)
        multiline: true
    }
    
    ImageView {
        imageSource: "asset:///images/ic_ticket.png"
    }
    
    onTimestampChanged: {
        if (new Date().getTime() >= (Number(root.timestamp) - 900000)) {
            root.opacity = 0.5;
        }
    }
}
