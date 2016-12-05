import bb.cascades 1.4
import "../components"
import "../_javascript/Request.js" as Request;
import "../_javascript/Common.js" as Common;

Page {
    id: root
    
    property variant film: {"id":"55376","name":"\u0417\u0432\u0435\u0440\u043e\u043f\u043e\u043b\u0438\u0441","description":"","actors":"\u0418\u0434\u0440\u0438\u0441 \u042d\u043b\u044c\u0431\u0430, \u0414\u0436\u0438\u043d\u043d\u0438\u0444\u0435\u0440 \u0413\u0443\u0434\u0432\u0438\u043d, \u0414\u0436\u0435\u0439\u0441\u043e\u043d \u0411\u0435\u0439\u0442\u043c\u0430\u043d, \u0410\u043b\u0430\u043d \u0422\u044c\u044e\u0434\u0438\u043a, \u0414\u0436.\u041a. \u0421\u0438\u043c\u043c\u043e\u043d\u0441, \u0414\u0436\u0435\u043d\u043d\u0438 \u0421\u043b\u0435\u0439\u0442, \u041e\u043a\u0442\u0430\u0432\u0438\u044f \u0421\u043f\u0435\u043d\u0441\u0435\u0440, \u0411\u043e\u043d\u043d\u0438 \u0425\u0430\u043d\u0442, \u041a\u044d\u0442\u0438 \u041b\u043e\u0443\u0441, \u0414\u0436\u043e\u043d \u0414\u0438 \u041c\u0430\u0434\u0436\u0438\u043e","director":"\u0411\u0430\u0439\u0440\u043e\u043d \u0425\u043e\u0432\u0430\u0440\u0434, \u0420\u0438\u0447 \u041c\u0443\u0440, \u0414\u0436\u0430\u0440\u0435\u0434 \u0411\u0443\u0448","image":"http:\/\/img.afisha.tut.by\/img\/176x0s\/cover\/04\/10\/zveropolis-685332.jpg","image_size":{"width":176,"height":259},"year":"2016","country":"\u0421\u0428\u0410","duration":"114","is_premiere":"0","premiere_at":"1456556400","3d":1,"video":"http:\/\/img.afisha.tut.by\/img\/trailer\/08\/10\/zveropolis-530081.mp4","genres":"\u0414\u0435\u0442\u0441\u043a\u0438\u0439\/\u0421\u0435\u043c\u0435\u0439\u043d\u044b\u0439, \u0410\u043d\u0438\u043c\u0430\u0446\u0438\u044f","restriction":"","images":["http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/0f\/d\/zveropolis-7182743.jpg","http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/07\/1\/zveropolis-278774.jpg","http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/0b\/10\/zveropolis-9316585.jpg","http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/0a\/d\/zveropolis-039803.jpg","http:\/\/img.afisha.tut.by\/img\/865x575c\/screens\/01\/9\/zveropolis-833196.jpg"],"timeleft":"114","commentsCnt":0,"rate":4.2,"rate_ten":8.4,"rate_imdb":8.1,"rate_kinopoisk":8.4,"url":"http:\/\/afisha.tut.by\/film\/zveropolis\/"}
//    property variant film
    
    titleBar: TitleBar {
        kind: TitleBarKind.Default
        title: film.name
    }
    
    ScrollView {
        scrollRole: ScrollRole.Main
        Container {
            Film { film: root.film }
            
            Divider {}
            
            Gallery { images: root.film.images }
            
            Divider {}
            
            Container {
                id: info
                leftPadding: ui.du(2.5)
                rightPadding: ui.du(2.5)           
                Container {
                    Label {
                        text: "<html><strong>" + qsTr("Director") + 
                        Retranslate.onLocaleOrLanguageChanged + ":</strong> " + root.film.director + "</html>"
                        multiline: true
                    }
                    
                    Label {
                        text: "<html><strong>" + qsTr("Actors") + 
                        Retranslate.onLocaleOrLanguageChanged + ":</strong> " + root.film.actors + "</html>"
                        multiline: true
                    }
                    
                    Label {
                        text: root.film.description
                        multiline: true
                    }
                }
            }
            
            Divider {}
            
            Container {
                leftPadding: ui.du(2.5)
                rightPadding: ui.du(2.5)
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: qsTr("Comments") + Retranslate.onLocaleOrLanguageChanged
                
                }
                
                Label {
                    text: root.film.commentsCnt
                }
            }
            
            ListView {
                dataModel: GroupDataModel {
                    
                }
            }
        }   
    }
    
    onCreationCompleted: {
        var f = root.film;
        Request.methods.post({id:[root.film.id], type: "cinema", version: 2, action: "getDescription", jsonrpc: "2.0"}, function(response) {
            var items = JSON.parse(response).items;
            var newFilm = Common.assign({}, root.film);
            newFilm.description = items[root.film.id].description_full;
            newFilm.commentsCnt = items[root.film.id].commentsCnt;
            root.film = newFilm;
        });
        Request.methods.post({action: "sessions", city: "minsk", film_id: root.film.id, "daylimit": 365}, function(response) {
            console.debug(response);
            root.sessions = JSON.parse(response);
        });
    }
}
