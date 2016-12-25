import bb.cascades 1.4

Container {
    id: root
    
    property variant film
    
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
            url: root.film.image
        }
    }
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        leftPadding: ui.du(2.5)
        Label {
            text: root.film.name
            textStyle.base: SystemDefaults.TextStyles.TitleText
            multiline: true
        }
        Label {
            text: root.film.genres
            textStyle.base: SystemDefaults.TextStyles.SubtitleText
            multiline: true
        }
        Label {
            text: root.film.country ? root.film.country + ", " + root.film.year : root.film.year
            textStyle.base: SystemDefaults.TextStyles.SubtitleText
            multiline: true
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: root.film.rateTen
                    textStyle.color: Color.Red       
                }
                ImageView {
                    maxWidth: ui.du(4.5)
                    maxHeight: ui.du(4.5)
                    imageSource: "asset:///images/ic_favorite.png"
                    filterColor: Color.Red
                }
            }
            Container {
                leftMargin: ui.du(2)
                verticalAlignment: VerticalAlignment.Center
                Label {
                    text: {
                        if (root.film.isPremiere) {
                            return '<html><div style="border: 1px solid black; border-radius: 1px;">' + qsTr("PREMIERE") + Retranslate.onLocaleOrLanguageChanged + '</div></html>';
                        }
                        return "";
                    }
                    textStyle.base: SystemDefaults.TextStyles.SmallText
                }
            }
            Container {
                leftMargin: ui.du(2)
                visible: root.film.restriction !== ""
                verticalAlignment: VerticalAlignment.Center
                Label {
                    text: '<html><div style="border: 1px solid black; border-radius: 1px;">' + root.film.restriction + '</div></html>'
                    textStyle.base: SystemDefaults.TextStyles.SmallText
                }
            }
            Container {
                leftMargin: ui.du(2)
                verticalAlignment: VerticalAlignment.Center
                Label {
                    text: {
                        if (root.film.threeD === true) {
                            return '<html><div style="border: 1px solid black; border-radius: 1px;">3D</div></html>';
                        }
                        return "";
                    }
                    textStyle.base: SystemDefaults.TextStyles.SmallText
                }
            }
        }
    }
}
