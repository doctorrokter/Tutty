import bb.cascades 1.4

TitleBar {
    
    appearance: TitleBarAppearance.Plain
    kind: TitleBarKind.FreeForm
    
    kindProperties: FreeFormTitleBarKindProperties {
        content:
        Container {
            background: Application.themeSupport.theme.colorTheme.primaryBase
            leftPadding: ui.du(2)
            rightPadding: ui.du(2)
            layout: DockLayout {}
            Label {
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Center
                
                text: qsTr(title)
                
                textStyle.base: SystemDefaults.TextStyles.TitleText
                textStyle.color: Color.White
            }
        }
    }
}
