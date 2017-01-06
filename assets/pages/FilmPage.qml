import bb.cascades 1.4
import chachkouski.models 1.0
import "../components"
import "../_javascript/Request.js" as Request;
import "../_javascript/Common.js" as Common;

Page {
    id: root
    
    signal sessionsRequested()
    
    titleBar: CustomTitleBar {
        title: _filmsService.activeFilm.name
    }
    
//    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
//    actionBarVisibility: ChromeVisibility.Overlay
            
    ScrollView {
        scrollRole: ScrollRole.Main
        Container {
            FilmHeader { film: _filmsService.activeFilm }
            
            Divider {}
            
            Gallery { images: _filmsService.activeFilm.imagesToQVList(); }
            
            Divider {}
            
            Container {
                id: info
                leftPadding: ui.du(2.5)
                rightPadding: ui.du(2.5)           
                Container {
                    Label {
                        text: "<html><strong>" + qsTr("Director") + 
                        Retranslate.onLocaleOrLanguageChanged + ":</strong> " + _filmsService.activeFilm.director + "</html>"
                        multiline: true
                    }
                    
                    Label {
                        text: "<html><strong>" + qsTr("Actors") + 
                        Retranslate.onLocaleOrLanguageChanged + ":</strong> " + _filmsService.activeFilm.actors + "</html>"
                        multiline: true
                    }
                    
                    Label {
                        text: _filmsService.activeFilm.description
                        multiline: true
                    }
                }
            }
            
            Header {
                title: qsTr("Comments") + Retranslate.onLocaleOrLanguageChanged + " " + _filmsService.activeFilm.commentsCnt
                subtitle: qsTr("Read comments") + Retranslate.onLocaleOrLanguageChanged
                mode: HeaderMode.Interactive
                
                onClicked: {
                    console.debug();
                }
            }
            
            Header {
                title: qsTr("Sessions") + Retranslate.onLocaleOrLanguageChanged
                subtitle: qsTr("View sessions") + Retranslate.onLocaleOrLanguageChanged
                mode: HeaderMode.Interactive
                
                onClicked: {
                    sessionsRequested();
                }
            }
            
            Container {
                id: sessionsContainer
            }
        }   
    }
    
    onCreationCompleted: {
        Request.methods.post({id:[_filmsService.activeFilm.id], type: "cinema", version: 2, action: "getDescription", jsonrpc: "2.0"}, function(response) {
            var items = JSON.parse(response).items;
            _filmsService.activeFilm.description = items[_filmsService.activeFilm.id].description_full;
            _filmsService.activeFilm.commentsCnt = items[_filmsService.activeFilm.id].commentsCnt;
        });
    }
}
