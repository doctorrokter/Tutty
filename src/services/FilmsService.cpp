/*
 * FilmsService.cpp
 *
 *  Created on: Dec 7, 2016
 *      Author: misha
 */

#include "FilmsService.hpp"
#include <iostream>

using namespace std;

FilmsService::FilmsService(QObject* parent) : QObject(parent) {}

FilmsService::~FilmsService() {}

const QList<Film> FilmsService::getFilms() const { return m_films; }
void FilmsService::setFilms(const QList<Film> films) {
    m_films = films;
    emit filmsChanged(m_films);
}

const QList<Cinema> FilmsService::getCinemas() const { return m_cinemas; }
void FilmsService::setCinemas(const QList<Cinema> cinemas) {
    m_cinemas = cinemas;
    emit cinemasChanged(m_cinemas);
}

void FilmsService::fromMaps(const QVariantList filmsMaps) {
    for (int i = 0; i < filmsMaps.size(); i++) {
        Film film(this);
        film.fromMap(filmsMaps[i].toMap());
        m_films.append(film);
    }

    cout << "Films size: " << m_films.size() << endl;
    emit filmsChanged(m_films);
}

QVariantList FilmsService::toMaps() const {
    QVariantList list;
    for (int i = 0; i < m_films.size(); i++) {
        Film film = m_films.at(i);
        QVariantMap filmMap = film.toMap();
        list.append(filmMap);
        cout << "Film added, size: " << list.size() << endl;
    }
    return list;
}

void FilmsService::cinemasFromMaps(const QVariantList cinemasMaps) {
    for (int i = 0; i < cinemasMaps.size(); i++) {
            Cinema cinema(this);
            cinema.fromMap(cinemasMaps[i].toMap());
            m_cinemas.append(cinema);
        }

        cout << "Cinemas size: " << m_cinemas.size() << endl;
        emit cinemasChanged(m_cinemas);
}

QVariantList FilmsService::cinemasToMaps() const {
    QVariantList list;
    for (int i = 0; i < m_cinemas.size(); i++) {
        Cinema cinema = m_cinemas.at(i);
        QVariantMap cinemaMap = cinema.toMap();
        list.append(cinemaMap);
        cout << "Cinema added, size: " << list.size() << endl;
    }
    return list;
}


