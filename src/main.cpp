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

#include "applicationui.hpp"

#include <bb/cascades/Application>

#include <QLocale>
#include <QTranslator>

#include <Qt/qdeclarativedebug.h>

#include <QList>

#include "models/Film.hpp"
#include "models/Place.hpp"
#include "models/FilmSession.hpp"
#include "models/City.hpp"
#include "models/Comment.hpp"
#include "models/TuttyEvent.hpp"
#include "models/ConcertSession.hpp"

#include "__test__/cascadestester.hpp"
#include "__test__/services/FilmsServiceSpec.hpp"

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    qmlRegisterType<Film>("chachkouski.models", 1, 0, "Film");
    qmlRegisterType<Place>("chachkouski.models", 1, 0, "Place");
    qmlRegisterType<FilmSession>("chachkouski.models", 1, 0, "FilmSession");
    qmlRegisterType<City>("chachkouski.models", 1, 0, "City");
    qmlRegisterType<Comment>("chachkouski.models", 1, 0, "Comment");
    qmlRegisterType<TuttyEvent>("chachkouski.models", 1, 0, "TuttyEvent");
    qmlRegisterType<ConcertSession>("chachkouski.models", 1, 0, "ConcertSession");
    qRegisterMetaType<QList<Film*> >("QList<Film*>");
    qRegisterMetaType<QList<Place*> >("QList<Place*>");
    qRegisterMetaType<QList<FilmSession*> >("QList<FilmSession*>");
    qRegisterMetaType<QList<City*> >("QList<City*>");
    qRegisterMetaType<QList<Comment*> >("QList<Comment*>");
    qRegisterMetaType<QList<TuttyEvent*> >("QList<TuttyEvent*>");
    qRegisterMetaType<QList<ConcertSession*> >("QList<ConcertSession*>");
    qRegisterMetaType<City*>("City*");
    qRegisterMetaType<Comment*>("Comment*");
    qRegisterMetaType<TuttyEvent*>("TuttyEvent*");
    qRegisterMetaType<ConcertSession*>("ConcertSession*");

//    FilmsServiceSpec filmsServiceSpec;
//    CascadesTester tester(&filmsServiceSpec, argc, argv);
//    QMetaObject::invokeMethod(&tester, "startTest", Qt::QueuedConnection);

    Application app(argc, argv);

    // Create the Application UI object, this is where the main.qml file
    // is loaded and the application scene is set.
    ApplicationUI appui;

    // Enter the application main event loop.
    return Application::exec();
}
