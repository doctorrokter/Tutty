/*
 * FilmsService.cpp
 *
 *  Created on: Dec 7, 2016
 *      Author: misha
 */

#include "FilmsService.hpp"
#include "../models/Session.hpp"
#include <iostream>
#include <iterator>

using namespace std;

FilmsService::FilmsService(QObject* parent) : QObject(parent) {}

FilmsService::~FilmsService() {
    deleteFilms();
    deleteCinemas();
}

const QList<Film*> FilmsService::getFilms() const { return m_films; }
void FilmsService::setFilms(const QList<Film*> films) {
    deleteFilms();
    m_films = films;
    emit filmsChanged(m_films);
}

const QList<Place*> FilmsService::getCinemas() const { return m_cinemas; }
void FilmsService::setCinemas(const QList<Place*> cinemas) {
    deleteCinemas();
    m_cinemas = cinemas;
    emit cinemasChanged(m_cinemas);
}

void FilmsService::fromMaps(const QVariantList filmsMaps) {
    deleteFilms();
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
    deleteCinemas();
    for (int i = 0; i < cinemasMaps.size(); i++) {
        Place* cinema = new Place(this);
        cinema->fromMap(cinemasMaps[i].toMap());
        m_cinemas.append(cinema);
    }
    emit cinemasChanged(m_cinemas);
}

QVariantList FilmsService::cinemasToMaps() const {
    QVariantList list;
    for (int i = 0; i < m_cinemas.size(); i++) {
        Place* cinema = m_cinemas.at(i);
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

QList<FilmSession*>& FilmsService::getFilmsSessions() { return m_filmsSessions; }
void FilmsService::setFilmsSessions(const QList<FilmSession*> filmsSessions) {
    m_filmsSessions = filmsSessions;
    emit filmsSessionsChanged(m_filmsSessions);
}

Film* FilmsService::findFilmById(const int id) const {
    for (int i = 0; i < m_films.size(); i++) {
        Film* film = m_films.at(i);
        if (film->getId() == id) {
            return film;
        }
    }
    return NULL;
}

Place* FilmsService::findCinemaById(const int id) const {
    for (int i = 0; i < m_cinemas.size(); i++) {
        Place* cinema = m_cinemas.at(i);
        if (cinema->getId() == id) {
            return cinema;
        }
    }
    return NULL;
}

bool FilmsService::hasSessions(const int filmId) const {
    for (int i = 0; i < m_filmsSessions.size(); i++) {
        if (filmId == m_filmsSessions.at(i)->getFilm()->getId()) {
            return true;
        }
    }
    return false;
}

QList<FilmSession*> FilmsService::getSessionsFor(const int filmId) const {
    QList<FilmSession*> filmsSessions;
    for (int i = 0; i < m_filmsSessions.size(); i++) {
        if (filmId == m_filmsSessions.at(i)->getFilm()->getId()) {
            filmsSessions.append(m_filmsSessions.at(i));
        }
    }
    return filmsSessions;
}

QVariantList FilmsService::sessionsToMaps(const int filmId) const {
    QVariantList list;
    QList<FilmSession*> filmsSessions = getSessionsFor(filmId);
    for (int i = 0; i < filmsSessions.size(); i++) {
        list.append(filmsSessions.at(i)->toMap());
    }
    return list;
}

void FilmsService::sessionsFromMaps(const QVariantMap items) {
    QList<QString> datesStr = items.keys();
    QList<FilmSession*> filmsSessions;
    for (int i = 0; i < datesStr.size(); i++) {
        QString date = datesStr.at(i);
        QVariantMap map = items.value(date).toMap();
        QString id = map.keys().at(0);
        QVariantMap filmMap = map.value(id).toMap();

        QList<QString> cinemasIds = filmMap.keys();
        for (int j = 0; j < cinemasIds.size(); j++) {
            QString cinemaId = cinemasIds.at(j);

            FilmSession* filmSession = new FilmSession(this);
            filmSession->setFilm(getActiveFilm());
            filmSession->setDate(date.toInt());
            filmSession->setCinema(findCinemaById(cinemaId.toInt()));

            QList<Session*> sessions;
//            for (int k = 0; k < cinemasIds.size(); k++) {
                QVariantList sessionsArray = filmMap.value(cinemaId).toList();
                for (int z = 0; z < sessionsArray.size(); z++) {
                    Session* session = new Session();
                    session->fromMap(sessionsArray.at(z).toMap());
                    sessions.append(session);
                }
//            }

            filmSession->setSessions(sessions);
            filmsSessions.append(filmSession);
        }
    }
    setFilmsSessions(filmsSessions);
}

QVariantList FilmsService::sessionsByDateAndCinemaId(const int date, const int cinemaId) const {
    QVariantList list;
    QList<FilmSession*> filmsSessions = getSessionsFor(m_activeFilm->getId());
    for (int i = 0; i < filmsSessions.size(); i++) {
        FilmSession* p_fs = filmsSessions.at(i);
        if (p_fs->getDate() == date && p_fs->getCinema()->getId() == cinemaId) {
            QList<Session*> sessions = p_fs->getSessions();
            for (int j = 0; j < sessions.size(); j++) {
                list.append(sessions.at(j)->toMap());
            }
            return list;
        }
    }
    return list;
}

void FilmsService::appendComments(const QVariantList comments) {
    QList<Comment*> commentsList;
    for (int i = 0; i < comments.size(); i++) {
        QVariantMap cMap = comments.at(i).toMap();
        Comment* p_comment = new Comment(m_activeFilm);
        p_comment->fromMap(cMap);
        commentsList.append(p_comment);
    }
    m_activeFilm->setComments(commentsList);
}

void FilmsService::deleteCinemas() {
    if (!m_cinemas.empty()) {
        qDeleteAll(m_cinemas.begin(), m_cinemas.end());
        m_cinemas.clear();
    }
}

void FilmsService::deleteFilms() {
    if (!m_films.empty()) {
        qDeleteAll(m_films.begin(), m_films.end());
        m_films.clear();
    }
}
