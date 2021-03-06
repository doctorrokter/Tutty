/*
 * Copyright (c) 2011-2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.4
import bb.system 1.2
import "./pages"
import "./components"

TabbedPane {
    id: root
    
    showTabsOnActionBar: true
    
    Menu.definition: MenuDefinition {
        settingsAction: SettingsActionItem {
            onTriggered: {
                var sp = settingsPage.createObject(this);
                root.activeTab.content.push(sp);
            }
        }
    }
    
    Tab {
        title: qsTr("Films") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/films.png"
        
        NavigationPane {
            FilmsPage {
                id: filmsPage

                onFilmChosen: {
                    _filmsService.setActiveFilm(parseInt(film.id));
                    var fp = filmPage.createObject(this);
                    root.activeTab.content.push(fp);
                }
                
                onCinemaChosen: {
                    var mp = mapPage.createObject(this);
                    mp.placeTitle = cinema.title;
                    mp.address = _citiesService.currentCity.title + " " + cinema.address;
                    root.activeTab.content.push(mp);
                }
            }
            
            onPopTransitionEnded: {
                page.destroy();
            }
        }
    }
    
    Tab {
        title: qsTr("Concerts") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/concerts.png"
        
        NavigationPane {
            ConcertsPage {
                id: concertsPage
                
                onConcertHallChosen: {
                    var mp = mapPage.createObject(this);
                    mp.placeTitle = concertHall.title;
                    mp.address = _citiesService.currentCity.title + " " + concertHall.address;
                    root.activeTab.content.push(mp);
                }
                
                onConcertChosen: {
                    _concertsService.setActiveConcert(parseInt(concert.concert.id), parseInt(concert.date));
                    var cp = concertPage.createObject(this);
                    root.activeTab.content.push(cp);
                }
            }
            
            onPopTransitionEnded: {
                page.destroy();
            }
        }
        
        onTriggered: {
            if (!concertsPage.firstLoaded) {
                concertsPage.load();
            }
        }
    }
    
//    Tab {
//        title: qsTr("News") + Retranslate.onLocaleOrLanguageChanged
//        imageSource: "asset:///images/news.png"
//        
//        NavigationPane {
//            NewsPage {}
//        }
//    }
    
//    Tab {
//        title: qsTr("Bookmarks") + Retranslate.onLocaleOrLanguageChanged
//        
//        NavigationPane {
//            BookmarksPage {
//                onFilmChosen: {
//                    _filmsService.setActiveFilm(parseInt(film.id));
//                    var fp = filmPage.createObject();
//                    root.activeTab.content.push(fp);
//                }
//            }
//        }
//    }
    
    onCreationCompleted: {
        var theme = _appConfig.get("theme");
        if (theme) {
            if (theme === "DARK") {
                Application.themeSupport.setVisualStyle(VisualStyle.Dark);
            } else {
                Application.themeSupport.setVisualStyle(VisualStyle.Bright);
            }
        }
        _calendar.eventCreated.connect(toast.show);
    }
    
    attachedObjects: [
        SystemToast {
            id: toast
            body: qsTr("Event added! Calendar updated") + Retranslate.onLocaleOrLanguageChanged
        },
        
        ComponentDefinition {
            id: filmPage
            FilmPage {
                onSessionsRequested: {
                    var sp = sessionsPage.createObject(this);
                    root.activeTab.content.push(sp);
                }
                
                onCommentsRequested: {
                    var cp = commentsPage.createObject(this);
                    root.activeTab.content.push(cp);
                }
            }
        },
        
        ComponentDefinition {
            id: sessionsPage
            SessionsPage {}
        },
        
        ComponentDefinition {
            id: mapPage
            MapPage {}
        },
        
        ComponentDefinition {
            id: commentsPage
            CommentsPage {}
        },
        
        ComponentDefinition {
            id: settingsPage
            SettingsPage {}
        },
        
        ComponentDefinition {
            id: concertPage
            ConcertPage {}
        }
    ]
}
