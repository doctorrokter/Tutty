import bb.cascades 1.4

Container {
    id: root
    
    property variant concert: {
        name: "Hot Weekend in Terra Pizza",
        image: "http://img.afisha.tut.by/img/176x0s/cover/0d/1/hot-weekend-in-terra-pizza-837041.jpg"
    }
    property variant place: {
        title: "Брисл / Bristle"
    }
    property variant date: 1484935200
    
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    leftPadding: ui.du(2.5)
    topPadding: ui.du(2.5)
    rightPadding: ui.du(2.5)
    bottomPadding: ui.du(2.5)
    
    Container {
        WebView {
            minWidth: ui.du(25.0)
            maxWidth: ui.du(25.0)
            url: root.concert.image
        }
    }
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        leftPadding: ui.du(2.5)
        Label {
            text: root.concert.name
            textStyle.base: SystemDefaults.TextStyles.TitleText
            multiline: true
        }
        Label {
            text: root.place.title
            textStyle.base: SystemDefaults.TextStyles.SubtitleText
            multiline: true
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            ImageView {
                imageSource: "asset:///images/ic_history.png"
                filterColor: Color.Red
                maxWidth: ui.du(5)
                maxHeight: ui.du(5)
                verticalAlignment: VerticalAlignment.Center
            }
            Label {
                verticalAlignment: VerticalAlignment.Center
                text: Qt.formatTime(new Date(Number(root.date * 1000)), "HH:mm")
                textStyle.color: Color.Red
            }
        }
    }
}
