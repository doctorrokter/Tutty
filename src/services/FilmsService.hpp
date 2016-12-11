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
#include "../models/Film.hpp"
#include "../models/Cinema.hpp"

class FilmsService : public QObject {
    Q_OBJECT
    Q_PROPERTY(QList<Film> films READ getFilms WRITE setFilms)
    Q_PROPERTY(QList<Cinema> cinemas READ getCinemas WRITE setCinemas)

public:
    FilmsService(QObject* parent = 0);
    virtual ~FilmsService();

    Q_INVOKABLE const QList<Film> getFilms() const;
    Q_INVOKABLE void setFilms(const QList<Film> films);

    Q_INVOKABLE const QList<Cinema> getCinemas() const;
    Q_INVOKABLE void setCinemas(const QList<Cinema> cinemas);

    Q_INVOKABLE void fromMaps(const QVariantList filmsMaps);
    Q_INVOKABLE QVariantList toMaps() const;

    Q_INVOKABLE void cinemasFromMaps(const QVariantList cinemasMaps);
    Q_INVOKABLE QVariantList cinemasToMaps() const;

Q_SIGNALS:
    void filmsChanged(const QList<Film>& films);
    void cinemasChanged(const QList<Cinema>& cinemas);

private:
    QList<Film> m_films;
    QList<Cinema> m_cinemas;
};

#endif /* FILMSSERVICE_HPP_ */
