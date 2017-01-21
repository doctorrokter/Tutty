/*
 * ConcertSession.cpp
 *
 *  Created on: Jan 19, 2017
 *      Author: misha
 */

#include "ConcertSession.hpp"
#include <QVariantList>

ConcertSession::ConcertSession(QObject* parent) : QObject(parent) {}

ConcertSession::~ConcertSession() {
    delete p_place;
    delete p_concert;
    qDeleteAll(m_sessions.begin(), m_sessions.end());
}

int ConcertSession::getDate() const { return m_date; }
void ConcertSession::setDate(const int date) {
    m_date = date;
    emit dateChanged(m_date);
}

Place* ConcertSession::getPlace() const { return p_place; }
void ConcertSession::setPlace(Place* place) {
    p_place = place;
    emit placeChanged(p_place);
}

TuttyEvent* ConcertSession::getConcert() const { return p_concert; }
void ConcertSession::setConcert(TuttyEvent* concert) {
    p_concert = concert;
    emit concertChanged(p_concert);
}

QList<Session*> ConcertSession::getSessions() const { return m_sessions; }
void ConcertSession::setSessions(const QList<Session*> sessions) {
    m_sessions = sessions;
    emit sessionsChanged(m_sessions);
}

QVariantMap ConcertSession::toMap() const {
    QVariantMap map;
    map.insert("date", m_date);
    map.insert("concert", p_concert->toMap());
    map.insert("place", p_place->toMap());

    QVariantList sessions;
    for (int i = 0; i < m_sessions.size(); i++) {
        sessions.append(m_sessions.at(i)->toMap());
    }
    map.insert("sessions", sessions);
    return map;
}

