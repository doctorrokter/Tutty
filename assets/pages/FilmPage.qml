import bb.cascades 1.4
import chachkouski.models 1.0
import "../components"
import "../actions"

Page {
    id: root
    
    signal sessionsRequested()
    signal commentsRequested()
    
    titleBar: CustomTitleBar {
        title: _filmsService.activeFilm.name
    }
    
    ScrollView {
        scrollRole: ScrollRole.Main
        
        Container {
            layout: DockLayout {}
            
            Spinner {
                id: spinner
            }
            
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
                            textFormat: TextFormat.Html
                            multiline: true
                        }
                    }
                }
                
                Header {
                    title: qsTr("Comments") + Retranslate.onLocaleOrLanguageChanged + " " + _filmsService.activeFilm.commentsCnt
                    subtitle: qsTr("Read comments") + Retranslate.onLocaleOrLanguageChanged
                    mode: HeaderMode.Interactive
                    
                    onClicked: {
                        commentsRequested();
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
    }
    
    onCreationCompleted: {
        if (!_filmsService.activeFilm.description) {
            filmsActions.getDescription(function(response) {
                var items = JSON.parse(response).items;
                _filmsService.activeFilm.description = items[_filmsService.activeFilm.id].description_html;
                _filmsService.activeFilm.commentsCnt = items[_filmsService.activeFilm.id].commentsCnt;
            });
        }
    }
    
    attachedObjects: [
        FilmsActions {
            id: filmsActions
        }
    ]
}
