import bb.cascades 1.4

Container {
    
    property variant film: {"id":"55376","name":"\u0417\u0432\u0435\u0440\u043e\u043f\u043e\u043b\u0438\u0441","description":"","actors":"\u0418\u0434\u0440\u0438\u0441 \u042d\u043b\u044c\u0431\u0430, \u0414\u0436\u0438\u043d\u043d\u0438\u0444\u0435\u0440 \u0413\u0443\u0434\u0432\u0438\u043d, \u0414\u0436\u0435\u0439\u0441\u043e\u043d \u0411\u0435\u0439\u0442\u043c\u0430\u043d, \u0410\u043b\u0430\u043d \u0422\u044c\u044e\u0434\u0438\u043a, \u0414\u0436.\u041a. \u0421\u0438\u043c\u043c\u043e\u043d\u0441, \u0414\u0436\u0435\u043d\u043d\u0438 \u0421\u043b\u0435\u0439\u0442, \u041e\u043a\u0442\u0430\u0432\u0438\u044f \u0421\u043f\u0435\u043d\u0441\u0435\u0440, \u0411\u043e\u043d\u043d\u0438 \u0425\u0430\u043d\u0442, \u041a\u044d\u0442\u0438 \u041b\u043e\u0443\u0441, \u0414\u0436\u043e\u043d \u0414\u0438 \u041c\u0430\u0434\u0436\u0438\u043e","director":"\u0411\u0430\u0439\u0440\u043e\u043d \u0425\u043e\u0432\u0430\u0440\u0434, \u0420\u0438\u0447 \u041c\u0443\u0440, \u0414\u0436\u0430\u0440\u0435\u0434 \u0411\u0443\u0448","image":"http:\/\/img.afisha.tut.by\/img\/176x0s\/cover\/04\/10\/zveropolis-685332.jpg","image_size":{"width":176,"height":259},"year":"2016","country":"\u0421\u0428\u0410","duration":"114","is_premiere":1,"premiere_at":"1456556400","3d":1,"video":"http:\/\/img.afisha.tut.by\/img\/trailer\/08\/10\/zveropolis-530081.mp4","genres":"\u0414\u0435\u0442\u0441\u043a\u0438\u0439\/\u0421\u0435\u043c\u0435\u0439\u043d\u044b\u0439, \u0410\u043d\u0438\u043c\u0430\u0446\u0438\u044f","restriction":"16+","images":["http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/0f\/d\/zveropolis-7182743.jpg","http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/07\/1\/zveropolis-278774.jpg","http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/0b\/10\/zveropolis-9316585.jpg","http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/0a\/d\/zveropolis-039803.jpg","http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/01\/9\/zveropolis-833196.jpg"],"timeleft":"114","commentsCnt":0,"rate":4.2,"rate_ten":8.4,"rate_imdb":8.1,"rate_kinopoisk":8.4,"url":"http:\/\/afisha.tut.by\/film\/zveropolis\/"}
    
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
            url: film.image
        }
    }
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        leftPadding: ui.du(2.5)
        Label {
            text: film.name
            textStyle.base: SystemDefaults.TextStyles.TitleText
            multiline: true
        }
        Label {
            text: film.genres
            textStyle.base: SystemDefaults.TextStyles.SubtitleText
            multiline: true
        }
        Label {
            text: film.country + ", " + film.year
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
                    text: film.rate_ten
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
                visible: parseInt(film.is_premiere) === 1
                verticalAlignment: VerticalAlignment.Center
                Label {
                    text: '<html><div style="border: 1px solid black; border-radius: 1px;">' + qsTr("PREMIERE") + 
                    Retranslate.onLocaleOrLanguageChanged + '</div></html>'
                    textStyle.base: SystemDefaults.TextStyles.SmallText
                }
            }
            Container {
                leftMargin: ui.du(2)
                visible: film.restriction !== ""
                verticalAlignment: VerticalAlignment.Center
                Label {
                    text: '<html><div style="border: 1px solid black; border-radius: 1px;">' + film.restriction + '</div></html>'
                    textStyle.base: SystemDefaults.TextStyles.SmallText
                }
            }
            Container {
                leftMargin: ui.du(2)
                visible: film["3d"] === 1
                verticalAlignment: VerticalAlignment.Center
                Label {
                    text: '<html><div style="border: 1px solid black; border-radius: 1px;">3D</div></html>'
                    textStyle.base: SystemDefaults.TextStyles.SmallText
                }
            }
        }
    }
}
