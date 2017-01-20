/*
 * FilmsService.hpp
 *
 *  Created on: Dec 7, 2016
 *      Author: misha
 */

#ifndef FILMSSERVICE_HPP_
#define FILMSSERVICE_HPP_

#include <QtCore/QObject>
#include <QList>
#include <QVariantList>
#include <QVariantMap>
#include "../models/FilmSession.hpp"
#include "../models/Film.hpp"
#include "../models/Place.hpp"

class FilmsService : public QObject {
    Q_OBJECT
    Q_PROPERTY(QList<Film*> films READ getFilms WRITE setFilms)
    Q_PROPERTY(QList<Place*> cinemas READ getCinemas WRITE setCinemas)
    Q_PROPERTY(Film* activeFilm READ getActiveFilm NOTIFY activeFilmChanged)
    Q_PROPERTY(QList<FilmSession*> filmsSessions READ getFilmsSessions WRITE setFilmsSessions NOTIFY filmsSessionsChanged)

public:
    FilmsService(QObject* parent = 0);
    virtual ~FilmsService();

    Q_INVOKABLE const QList<Film*> getFilms() const;
    Q_INVOKABLE void setFilms(const QList<Film*> films);

    Q_INVOKABLE const QList<Place*> getCinemas() const;
    Q_INVOKABLE void setCinemas(const QList<Place*> cinemas);

    Q_INVOKABLE void fromMaps(const QVariantList filmsMaps);
    Q_INVOKABLE QVariantList toMaps() const;

    Q_INVOKABLE void cinemasFromMaps(const QVariantList cinemasMaps);
    Q_INVOKABLE QVariantList cinemasToMaps() const;

    Q_INVOKABLE Film* getActiveFilm() const;
    Q_INVOKABLE void setActiveFilm(const int filmId);

    Q_INVOKABLE QList<FilmSession*>& getFilmsSessions();
    Q_INVOKABLE void setFilmsSessions(const QList<FilmSession*> filmsSessions);

    Q_INVOKABLE Film* findFilmById(const int id) const;
    Q_INVOKABLE Place* findCinemaById(const int id) const;

    Q_INVOKABLE bool hasSessions(const int filmId) const;
    Q_INVOKABLE QList<FilmSession*> getSessionsFor(const int filmId) const;
    Q_INVOKABLE QVariantList sessionsToMaps(const int filmId) const;
    Q_INVOKABLE void sessionsFromMaps(const QVariantMap items);

    Q_INVOKABLE QVariantList sessionsByDateAndCinemaId(const int date, const int cinemaId) const;

    Q_INVOKABLE void appendComments(const QVariantList comments);

Q_SIGNALS:
    void filmsChanged(const QList<Film*>& films);
    void cinemasChanged(const QList<Place*>& cinemas);
    void activeFilmChanged(const Film* activeFilm);
    void filmsSessionsChanged(const QList<FilmSession*> filmsSessions);

private:
    QList<Film*> m_films;
    QList<Place*> m_cinemas;
    Film* m_activeFilm;
    QList<FilmSession*> m_filmsSessions;

    void deleteCinemas();
    void deleteFilms();
};

#endif /* FILMSSERVICE_HPP_ */
