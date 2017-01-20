/*
 * ConcertSession.hpp
 *
 *  Created on: Jan 19, 2017
 *      Author: misha
 */

#ifndef CONCERTSESSION_HPP_
#define CONCERTSESSION_HPP_

#include <QtCore/QObject>
#include <QList>
#include <QVariantMap>
#include "Place.hpp"
#include "TuttyEvent.hpp"
#include "Session.hpp"

class ConcertSession: public QObject {
    Q_OBJECT
    Q_PROPERTY(int date READ getDate WRITE setDate NOTIFY dateChanged)
    Q_PROPERTY(Place* place READ getPlace WRITE setPlace NOTIFY placeChanged)
    Q_PROPERTY(TuttyEvent* concert READ getConcert WRITE setConcert NOTIFY concertChanged)
    Q_PROPERTY(QList<Session*> sessions READ getSessions WRITE setSessions NOTIFY sessionsChanged)
public:
    ConcertSession(QObject* parent = 0);
    virtual ~ConcertSession();

    Q_INVOKABLE int getDate() const;
    Q_INVOKABLE void setDate(const int date);

    Q_INVOKABLE Place* getPlace() const;
    Q_INVOKABLE void setPlace(Place* place);

    Q_INVOKABLE TuttyEvent* getConcert() const;
    Q_INVOKABLE void setConcert(TuttyEvent* concert);

    Q_INVOKABLE QList<Session*> getSessions() const;
    Q_INVOKABLE void setSessions(const QList<Session*> session);

    Q_INVOKABLE QVariantMap toMap() const;

Q_SIGNALS:
    void dateChanged(const int date);
    void placeChanged(const Place* place);
    void concertChanged(const TuttyEvent* concert);
    void sessionsChanged(const QList<Session*> sessions);

private:
    int m_date;
    Place* p_place;
    TuttyEvent* p_concert;
    QList<Session*> m_sessions;
};

#endif /* CONCERTSESSION_HPP_ */
