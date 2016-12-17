import bb.cascades 1.4
import chachkouski.models 1.0
import "../components"
import "../_javascript/Request.js" as Request;
import "../_javascript/Common.js" as Common;

Page {
    id: root
    
    signal sessionsRequested()
    
    titleBar: TitleBar {
        kind: TitleBarKind.Default
        title: _filmsService.activeFilm.name
    }
    
    ScrollView {
        scrollRole: ScrollRole.None
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
            
            Divider {}
            
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                leftPadding: ui.du(2.5)
                rightPadding: ui.du(2.5)
                bottomPadding: ui.du(2.5)
                topPadding: ui.du(2.5)
                layout: DockLayout {}
                
                Container {
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    Label {
                        text: qsTr("Comments") + Retranslate.onLocaleOrLanguageChanged
                    }
                    
                    Label {
                        text: _filmsService.activeFilm.commentsCnt
                    }
                }
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Right
                    Label {
                        text: ">"
                    }
                }
            }       
            
            Divider {}
            
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                leftPadding: ui.du(2.5)
                rightPadding: ui.du(2.5)
                bottomPadding: ui.du(2.5)
                topPadding: ui.du(2.5)
                layout: DockLayout {}
                
                Container {
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    Label {
                        text: qsTr("Sessions") + Retranslate.onLocaleOrLanguageChanged
                    }
                    
                    Label {
                        text: _filmsService.activeFilm.commentsCnt
                    }
                }
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Right
                    Label {
                        text: ">"
                    }
                }
                
                gestureHandlers: [
                    TapHandler {
                        onTapped: {
                            sessionsRequested();
                        }
                    }
                ]
            }       
            
            Divider {}
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
