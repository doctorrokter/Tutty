/*
 * ConcertsService.cpp
 *
 *  Created on: Jan 18, 2017
 *      Author: misha
 */

#include "ConcertsService.hpp"
#include "../models/Session.hpp"
#include "../models/TuttyEvent.hpp"

ConcertsService::ConcertsService(QObject* parent) : QObject(parent) {}

ConcertsService::~ConcertsService() {
    deleteConcertHalls();
    deleteConcerts();
}

const QList<Place*> ConcertsService::getConcertHalls() const { return m_concertHalls; }
void ConcertsService::setConcertHalls(const QList<Place*> concertHalls) {
    deleteConcertHalls();
    m_concertHalls = concertHalls;
    emit concertHallsChanged(m_concertHalls);
}

const QList<ConcertSession*> ConcertsService::getConcerts() const { return m_concerts; }
void ConcertsService::setConcerts(const QList<ConcertSession*> concerts) {
    deleteConcerts();
    m_concerts = concerts;
    emit concertsChanged(m_concerts);
}

void ConcertsService::concertHallsFromMaps(const QVariantList concertHallsMaps) {
    deleteConcertHalls();
    for (int i = 0; i < concertHallsMaps.size(); i++) {
        Place* hall = new Place(this);
        hall->fromMap(concertHallsMaps[i].toMap());
        m_concertHalls.append(hall);
    }
    emit concertHallsChanged(m_concertHalls);
}

QVariantList ConcertsService::concertHallsToMaps() const {
    QVariantList list;
    for (int i = 0; i < m_concertHalls.size(); i++) {
        Place* hall = m_concertHalls.at(i);
        QVariantMap hallMap = hall->toMap();
        list.append(hallMap);
    }
    return list;
}

ConcertSession* ConcertsService::getActiveConcert() const { return m_p_activeConcert; }
void ConcertsService::setActiveConcert(const int id, const int date) {
    QList<ConcertSession*>::iterator iter;
    for (iter = m_concerts.begin(); iter != m_concerts.end(); iter++) {
        ConcertSession* cs = *iter;
        if (cs->getDate() == date && cs->getConcert()->getId() == id) {
            m_p_activeConcert = cs;
            emit activeConcertChanged(m_p_activeConcert);
            return;
        }
    }
}

void ConcertsService::processMap(const QVariantMap concertsMap) {
    QVariantList places = concertsMap.value("places").toList();
    concertHallsFromMaps(places);

    QVariantList events = concertsMap.value("events").toList();
    QVariantMap sessions = concertsMap.value("sessions").toMap();

    QList<ConcertSession*> concertSessions;
    QList<QString> dates = sessions.keys();
    for (int i = 0; i < dates.size(); i++) {
        QString dateStr = dates.at(i);
        QVariantMap dateMap = sessions.value(dateStr).toMap();

        QList<QString> eventsIds = dateMap.keys();
        for (int j = 0; j < eventsIds.size(); j++) {
            QString eventId = eventsIds.at(j);
            QVariantMap eventMap = dateMap.value(eventId).toMap();

            QString placeIdStr = eventMap.keys()[0];
            QVariantList sessionsMaps = eventMap.value(placeIdStr).toList();

            ConcertSession* p_concertSession = new ConcertSession(this);
            QList<Session*> sessions;
            for (int i = 0; i < sessionsMaps.size(); i++) {
                Session* p_session = new Session(this);
                p_session->fromMap(sessionsMaps.at(i).toMap());
                sessions.append(p_session);
            }
            p_concertSession->setSessions(sessions);

            Place* p_place = new Place(this);
            p_place->fromMap(findPlaceById(placeIdStr.toInt())->toMap());
            p_concertSession->setPlace(p_place);

            p_concertSession->setDate(dateStr.toInt());

            for (int i = 0; i < events.size(); i++) {
                QVariantMap eventMap = events.at(i).toMap();
                if (eventMap.value("id").toInt() == eventId.toInt()) {
                    TuttyEvent* p_concert = new TuttyEvent(this);
                    p_concert->fromMap(eventMap);
                    p_concertSession->setConcert(p_concert);
                }
            }
            concertSessions.append(p_concertSession);
        }
    }
    setConcerts(concertSessions);
}

QVariantList ConcertsService::concertsToMaps() const {
    QVariantList list;
    for (int i = 0; i < m_concerts.size(); i++) {
        list.append(m_concerts.at(i)->toMap());
    }
    return list;
}

void ConcertsService::deleteConcertHalls() {
    if (!m_concertHalls.empty()) {
        qDeleteAll(m_concertHalls.begin(), m_concertHalls.end());
        m_concertHalls.clear();
    }
}

void ConcertsService::deleteConcerts() {
    if (!m_concerts.empty()) {
        qDeleteAll(m_concerts.begin(), m_concerts.end());
        m_concerts.clear();
    }
}

Place* ConcertsService::findPlaceById(const int id) const {
    for (int i = 0; i < m_concertHalls.size(); i++) {
        if (m_concertHalls.at(i)->getId() == id) {
            return m_concertHalls.at(i);
        }
    }
    return 0;
}

