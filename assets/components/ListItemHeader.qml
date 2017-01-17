import bb.cascades 1.4

CustomListItem {
    id: root
    
    property string text: 'Header'
    
    maxHeight: ui.du(6.0)
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        background: ui.palette.plain
        layout: DockLayout {}
        Container {
            verticalAlignment: VerticalAlignment.Center
            margin.leftOffset: ui.du(3.0)
            margin.rightOffset: ui.du(3.0)
            Label {
                text: root.text
                textStyle.color: ui.palette.textOnPlain
            }
        }
    }
}
