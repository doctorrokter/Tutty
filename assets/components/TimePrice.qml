import bb.cascades 1.4

Container {
    id: root
    
    property variant timestamp
    property string price: '3.0'
    
    Container {
        leftPadding: ui.du(1.0)
        rightPadding: ui.du(1.0)
        topPadding: ui.du(1.0)
        bottomPadding: ui.du(1.0)
        horizontalAlignment: HorizontalAlignment.Fill
        minWidth: ui.du(13)
        
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text: Qt.formatTime(new Date(Number(root.timestamp)), "HH:mm")
            textStyle.base: SystemDefaults.TextStyles.PrimaryText
        }
    }
    
    Container {
        leftPadding: ui.du(1.0)
        rightPadding: ui.du(1.0)
        topPadding: ui.du(1.0)
        bottomPadding: ui.du(1.0)
        horizontalAlignment: HorizontalAlignment.Fill
        minWidth: ui.du(13)
        
        Label {
            visible: root.price !== undefined && root.price !== null && root.price !== ''
            horizontalAlignment: HorizontalAlignment.Center
            text: root.price + " p."
            textStyle.base: SystemDefaults.TextStyles.SubtitleText
        }
    }
}
