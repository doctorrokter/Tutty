/*
 * ConcertsService.hpp
 *
 *  Created on: Jan 18, 2017
 *      Author: misha
 */

#ifndef CONCERTSSERVICE_HPP_
#define CONCERTSSERVICE_HPP_

#include <QtCore/QObject>
#include <QList>
#include <QVariantList>
#include <QVariantMap>
#include "../models/Place.hpp"
#include "../models/ConcertSession.hpp"

class ConcertsService : public QObject {
    Q_OBJECT
    Q_PROPERTY(QList<Place*> concertHalls READ getConcertHalls WRITE setConcertHalls NOTIFY concertHallsChanged)
    Q_PROPERTY(QList<ConcertSession*> concerts READ getConcerts WRITE setConcerts NOTIFY concertsChanged)
    Q_PROPERTY(ConcertSession* activeConcert READ getActiveConcert NOTIFY activeConcertChanged)
public:
    ConcertsService(QObject* parent = 0);
    virtual ~ConcertsService();

    Q_INVOKABLE const QList<Place*> getConcertHalls() const;
    Q_INVOKABLE void setConcertHalls(const QList<Place*> concertHalls);

    Q_INVOKABLE const QList<ConcertSession*> getConcerts() const;
    Q_INVOKABLE void setConcerts(const QList<ConcertSession*> concerts);

    Q_INVOKABLE void concertHallsFromMaps(const QVariantList concertHallsMaps);
    Q_INVOKABLE QVariantList concertHallsToMaps() const;

    Q_INVOKABLE ConcertSession* getActiveConcert() const;
    Q_INVOKABLE void setActiveConcert(const int id, const int date);

    Q_INVOKABLE void processMap(const QVariantMap concertsMap);
    Q_INVOKABLE QVariantList concertsToMaps() const;

    Q_INVOKABLE Place* findPlaceById(const int id) const;

Q_SIGNALS:
    void concertHallsChanged(const QList<Place*>& concertHalls);
    void concertsChanged(const QList<ConcertSession*>& concerts);
    void activeConcertChanged(ConcertSession* concert);

private:
    QList<Place*> m_concertHalls;
    QList<ConcertSession*> m_concerts;
    ConcertSession* m_p_activeConcert;

    void deleteConcertHalls();
    void deleteConcerts();
};

#endif /* CONCERTSSERVICE_HPP_ */
