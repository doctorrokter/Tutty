/*
 * FilmsService.cpp
 *
 *  Created on: Dec 7, 2016
 *      Author: misha
 */

#include "FilmsService.hpp"
#include <iostream>
#include <iterator>

using namespace std;

FilmsService::FilmsService(QObject* parent) : QObject(parent) {}

FilmsService::~FilmsService() {}

const QList<Film*> FilmsService::getFilms() const { return m_films; }
void FilmsService::setFilms(const QList<Film*> films) {
    m_films = films;
    emit filmsChanged(m_films);
}

const QList<Cinema*> FilmsService::getCinemas() const { return m_cinemas; }
void FilmsService::setCinemas(const QList<Cinema*> cinemas) {
    m_cinemas = cinemas;
    emit cinemasChanged(m_cinemas);
}

void FilmsService::fromMaps(const QVariantList filmsMaps) {
    for (int i = 0; i < filmsMaps.size(); i++) {
        Film* film = new Film(this);
        film->fromMap(filmsMaps[i].toMap());
        m_films.append(film);
    }
    emit filmsChanged(m_films);
}

QVariantList FilmsService::toMaps() const {
    QVariantList list;
    for (int i = 0; i < m_films.size(); i++) {
        Film* film = m_films.at(i);
        QVariantMap filmMap = film->toMap();
        list.append(filmMap);
    }
    return list;
}

void FilmsService::cinemasFromMaps(const QVariantList cinemasMaps) {
    for (int i = 0; i < cinemasMaps.size(); i++) {
            Cinema* cinema = new Cinema(this);
            cinema->fromMap(cinemasMaps[i].toMap());
            m_cinemas.append(cinema);
        }
        emit cinemasChanged(m_cinemas);
}

QVariantList FilmsService::cinemasToMaps() const {
    QVariantList list;
    for (int i = 0; i < m_cinemas.size(); i++) {
        Cinema* cinema = m_cinemas.at(i);
        QVariantMap cinemaMap = cinema->toMap();
        list.append(cinemaMap);
    }
    return list;
}

Film* FilmsService::getActiveFilm() const {
    return m_activeFilm;
}

void FilmsService::setActiveFilm(const int filmId) {
    QList<Film*>::iterator iter;
    for (iter = m_films.begin(); iter != m_films.end(); iter++) {
        Film* f = *iter;
        if (f->getId() == filmId) {
            m_activeFilm = f;
            emit activeFilmChanged(m_activeFilm);
        }
    }
}


