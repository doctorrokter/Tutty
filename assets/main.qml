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
import "./pages"

TabbedPane {
    id: root
    showTabsOnActionBar: true
    Tab {
        title: qsTr("Films") + Retranslate.onLocaleOrLanguageChanged
        NavigationPane {
            FilmsPage {
                onFilmChosen: {
//                    var component = Qt.createComponent("./pages/FilmPage.qml");
//                    var fp = component.createObject(this, {"film": film});
//                    root.activeTab.content.push(fp);
                    _filmsService.setActiveFilm(parseInt(film.id));
//                    var f = _filmsService.activeFilm;
//                    var images = f.images;
                    var fp = filmPage.createObject(this);
                    root.activeTab.content.push(fp);
                }
            }
            
            onPopTransitionEnded: {
                page.destroy();
            }
            
            attachedObjects: [
                ComponentDefinition {
                    id: filmPage
                    FilmPage {}
                }
            ]
        }
    }
    
    Tab {
        title: qsTr("Concerts") + Retranslate.onLocaleOrLanguageChanged
        
        NavigationPane {
            ConcertsPage {}
        }
    }
}
