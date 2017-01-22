# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/_javascript/Common.js) \
        $$quote($$BASEDIR/assets/_javascript/Request.js) \
        $$quote($$BASEDIR/assets/actions/AppActions.qml) \
        $$quote($$BASEDIR/assets/actions/ConcertsActions.qml) \
        $$quote($$BASEDIR/assets/actions/FilmsActions.qml) \
        $$quote($$BASEDIR/assets/components/BorderedLabel.qml) \
        $$quote($$BASEDIR/assets/components/CityPickerDialog.qml) \
        $$quote($$BASEDIR/assets/components/CustomTitleBar.qml) \
        $$quote($$BASEDIR/assets/components/DatePickerDialog.qml) \
        $$quote($$BASEDIR/assets/components/FilmHeader.qml) \
        $$quote($$BASEDIR/assets/components/Gallery.qml) \
        $$quote($$BASEDIR/assets/components/ListItemConcert.qml) \
        $$quote($$BASEDIR/assets/components/ListItemFilm.qml) \
        $$quote($$BASEDIR/assets/components/ListItemHeader.qml) \
        $$quote($$BASEDIR/assets/components/ListItemSession.qml) \
        $$quote($$BASEDIR/assets/components/PlacesContainer.qml) \
        $$quote($$BASEDIR/assets/components/Rating.qml) \
        $$quote($$BASEDIR/assets/components/SessionsDialog.qml) \
        $$quote($$BASEDIR/assets/components/Spinner.qml) \
        $$quote($$BASEDIR/assets/components/Subheader.qml) \
        $$quote($$BASEDIR/assets/components/Ticket.qml) \
        $$quote($$BASEDIR/assets/components/TimePrice.qml) \
        $$quote($$BASEDIR/assets/concerts.json) \
        $$quote($$BASEDIR/assets/images/calendar.png) \
        $$quote($$BASEDIR/assets/images/concerts.png) \
        $$quote($$BASEDIR/assets/images/films.png) \
        $$quote($$BASEDIR/assets/images/ic_add_bookmarks.png) \
        $$quote($$BASEDIR/assets/images/ic_favorite.png) \
        $$quote($$BASEDIR/assets/images/ic_history.png) \
        $$quote($$BASEDIR/assets/images/ic_location.png) \
        $$quote($$BASEDIR/assets/images/ic_notes.png) \
        $$quote($$BASEDIR/assets/images/ic_rectangle.png) \
        $$quote($$BASEDIR/assets/images/ic_ticket.png) \
        $$quote($$BASEDIR/assets/images/ic_ticket_2.png) \
        $$quote($$BASEDIR/assets/images/marker.png) \
        $$quote($$BASEDIR/assets/images/news.png) \
        $$quote($$BASEDIR/assets/main.qml) \
        $$quote($$BASEDIR/assets/pages/BookmarksPage.qml) \
        $$quote($$BASEDIR/assets/pages/CommentsPage.qml) \
        $$quote($$BASEDIR/assets/pages/ConcertPage.qml) \
        $$quote($$BASEDIR/assets/pages/ConcertsPage.qml) \
        $$quote($$BASEDIR/assets/pages/FilmPage.qml) \
        $$quote($$BASEDIR/assets/pages/FilmsPage.qml) \
        $$quote($$BASEDIR/assets/pages/MapPage.qml) \
        $$quote($$BASEDIR/assets/pages/NewsPage.qml) \
        $$quote($$BASEDIR/assets/pages/SessionsPage.qml) \
        $$quote($$BASEDIR/assets/pages/SettingsPage.qml) \
        $$quote($$BASEDIR/assets/sheets/WebSheet.qml) \
        $$quote($$BASEDIR/assets/util/Request.qml)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/__test__/cascadestester.cpp) \
        $$quote($$BASEDIR/src/__test__/services/FilmsServiceSpec.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/config/AppConfig.cpp) \
        $$quote($$BASEDIR/src/main.cpp) \
        $$quote($$BASEDIR/src/models/City.cpp) \
        $$quote($$BASEDIR/src/models/Comment.cpp) \
        $$quote($$BASEDIR/src/models/ConcertSession.cpp) \
        $$quote($$BASEDIR/src/models/Film.cpp) \
        $$quote($$BASEDIR/src/models/FilmSession.cpp) \
        $$quote($$BASEDIR/src/models/Place.cpp) \
        $$quote($$BASEDIR/src/models/Session.cpp) \
        $$quote($$BASEDIR/src/models/TuttyEvent.cpp) \
        $$quote($$BASEDIR/src/services/BookmarksService.cpp) \
        $$quote($$BASEDIR/src/services/CitiesService.cpp) \
        $$quote($$BASEDIR/src/services/ConcertsService.cpp) \
        $$quote($$BASEDIR/src/services/FilmsService.cpp) \
        $$quote($$BASEDIR/src/utils/Calendar.cpp) \
        $$quote($$BASEDIR/src/utils/Eraser.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/__test__/cascadestester.hpp) \
        $$quote($$BASEDIR/src/__test__/services/FilmsServiceSpec.hpp) \
        $$quote($$BASEDIR/src/applicationui.hpp) \
        $$quote($$BASEDIR/src/config/AppConfig.hpp) \
        $$quote($$BASEDIR/src/models/City.hpp) \
        $$quote($$BASEDIR/src/models/Comment.hpp) \
        $$quote($$BASEDIR/src/models/ConcertSession.hpp) \
        $$quote($$BASEDIR/src/models/Film.hpp) \
        $$quote($$BASEDIR/src/models/FilmSession.hpp) \
        $$quote($$BASEDIR/src/models/Place.hpp) \
        $$quote($$BASEDIR/src/models/Session.hpp) \
        $$quote($$BASEDIR/src/models/TuttyEvent.hpp) \
        $$quote($$BASEDIR/src/services/BookmarksService.hpp) \
        $$quote($$BASEDIR/src/services/CitiesService.hpp) \
        $$quote($$BASEDIR/src/services/ConcertsService.hpp) \
        $$quote($$BASEDIR/src/services/FilmsService.hpp) \
        $$quote($$BASEDIR/src/utils/Calendar.hpp) \
        $$quote($$BASEDIR/src/utils/Eraser.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../src/__test__/*.c) \
        $$quote($$BASEDIR/../src/__test__/*.c++) \
        $$quote($$BASEDIR/../src/__test__/*.cc) \
        $$quote($$BASEDIR/../src/__test__/*.cpp) \
        $$quote($$BASEDIR/../src/__test__/*.cxx) \
        $$quote($$BASEDIR/../src/__test__/services/*.c) \
        $$quote($$BASEDIR/../src/__test__/services/*.c++) \
        $$quote($$BASEDIR/../src/__test__/services/*.cc) \
        $$quote($$BASEDIR/../src/__test__/services/*.cpp) \
        $$quote($$BASEDIR/../src/__test__/services/*.cxx) \
        $$quote($$BASEDIR/../src/config/*.c) \
        $$quote($$BASEDIR/../src/config/*.c++) \
        $$quote($$BASEDIR/../src/config/*.cc) \
        $$quote($$BASEDIR/../src/config/*.cpp) \
        $$quote($$BASEDIR/../src/config/*.cxx) \
        $$quote($$BASEDIR/../src/models/*.c) \
        $$quote($$BASEDIR/../src/models/*.c++) \
        $$quote($$BASEDIR/../src/models/*.cc) \
        $$quote($$BASEDIR/../src/models/*.cpp) \
        $$quote($$BASEDIR/../src/models/*.cxx) \
        $$quote($$BASEDIR/../src/services/*.c) \
        $$quote($$BASEDIR/../src/services/*.c++) \
        $$quote($$BASEDIR/../src/services/*.cc) \
        $$quote($$BASEDIR/../src/services/*.cpp) \
        $$quote($$BASEDIR/../src/services/*.cxx) \
        $$quote($$BASEDIR/../src/utils/*.c) \
        $$quote($$BASEDIR/../src/utils/*.c++) \
        $$quote($$BASEDIR/../src/utils/*.cc) \
        $$quote($$BASEDIR/../src/utils/*.cpp) \
        $$quote($$BASEDIR/../src/utils/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/_javascript/*.qml) \
        $$quote($$BASEDIR/../assets/_javascript/*.js) \
        $$quote($$BASEDIR/../assets/_javascript/*.qs) \
        $$quote($$BASEDIR/../assets/actions/*.qml) \
        $$quote($$BASEDIR/../assets/actions/*.js) \
        $$quote($$BASEDIR/../assets/actions/*.qs) \
        $$quote($$BASEDIR/../assets/components/*.qml) \
        $$quote($$BASEDIR/../assets/components/*.js) \
        $$quote($$BASEDIR/../assets/components/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs) \
        $$quote($$BASEDIR/../assets/pages/*.qml) \
        $$quote($$BASEDIR/../assets/pages/*.js) \
        $$quote($$BASEDIR/../assets/pages/*.qs) \
        $$quote($$BASEDIR/../assets/sheets/*.qml) \
        $$quote($$BASEDIR/../assets/sheets/*.js) \
        $$quote($$BASEDIR/../assets/sheets/*.qs) \
        $$quote($$BASEDIR/../assets/util/*.qml) \
        $$quote($$BASEDIR/../assets/util/*.js) \
        $$quote($$BASEDIR/../assets/util/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}_ru.ts) \
    $$quote($${TARGET}.ts)
