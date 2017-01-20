/*
 * FilmSession.cpp
 *
 *  Created on: Dec 20, 2016
 *      Author: misha
 */

#include "FilmSession.hpp"
#include <QVariantList>

FilmSession::FilmSession(QObject* parent) : QObject(parent), p_film(0), p_cinema(0) {}

FilmSession::~FilmSession() {
    delete p_film;
    delete p_cinema;
    for (int i = 0; i < m_sessions.size(); i++) {
        delete m_sessions.at(i);
    }
}

int FilmSession::getDate() const { return m_date; }
void FilmSession::setDate(const int date) {
    m_date = date;
    emit dateChanged(m_date);
}

Film* FilmSession::getFilm() const { return p_film; }
void FilmSession::setFilm(Film* film) {
    if (p_film != film) {
        p_film = film;
        emit filmChanged(p_film);
    }
}

Place* FilmSession::getCinema() const { return p_cinema; }
void FilmSession::setCinema(Place* cinema) {
    if (p_cinema != cinema) {
        p_cinema = cinema;
        emit cinemaChanged(p_cinema);
    }
}

const QList<Session*> FilmSession::getSessions() const { return m_sessions; }
void FilmSession::setSessions(const QList<Session*> sessions) {
    m_sessions = sessions;
    emit sessionsChanged(m_sessions);
}

QVariantMap FilmSession::toMap() const {
    QVariantMap map;
    map.insert("date", this->getDate());
    map.insert("film", this->getFilm()->toMap());
    map.insert("cinema", this->getCinema()->toMap());

    QVariantList sessions;
    for (int i = 0; i < m_sessions.size(); i++) {
        sessions.append(m_sessions.at(i)->toMap());
    }
    map.insert("sessions", sessions);
    return map;
}

