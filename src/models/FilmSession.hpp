/*
 * FilmSession.h
 *
 *  Created on: Dec 20, 2016
 *      Author: misha
 */

#ifndef FILMSESSION_H_
#define FILMSESSION_H_

#include <QtCore/QObject>
#include <QList>
#include <QVariantMap>
#include "Film.hpp"
#include "Place.hpp"
#include "Session.hpp"

class FilmSession: public QObject {
    Q_OBJECT
    Q_PROPERTY(int date READ getDate WRITE setDate NOTIFY dateChanged)
    Q_PROPERTY(Film* film READ getFilm WRITE setFilm NOTIFY filmChanged)
    Q_PROPERTY(Place* cinema READ getCinema WRITE setCinema NOTIFY cinemaChanged)
    Q_PROPERTY(QList<Session*> sessions READ getSessions WRITE setSessions NOTIFY sessionsChanged)
public:
    FilmSession(QObject* parent = 0);
    virtual ~FilmSession();

    Q_INVOKABLE int getDate() const;
    Q_INVOKABLE void setDate(const int date);

    Q_INVOKABLE Film* getFilm() const;
    Q_INVOKABLE void setFilm(Film* film);

    Q_INVOKABLE Place* getCinema() const;
    Q_INVOKABLE void setCinema(Place* cinema);

    Q_INVOKABLE const QList<Session*> getSessions() const;
    Q_INVOKABLE void setSessions(const QList<Session*> sessions);

    Q_INVOKABLE QVariantMap toMap() const;

Q_SIGNALS:
    void dateChanged(int date);
    void filmChanged(Film* film);
    void cinemaChanged(Place* cinema);
    void sessionsChanged(QList<Session*> sessions);

private:
    int m_date;
    Film* p_film;
    Place* p_cinema;
    QList<Session*> m_sessions;
};

#endif /* FILMSESSION_H_ */
