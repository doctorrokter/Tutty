/*
 * CitiesService.hpp
 *
 *  Created on: Jan 7, 2017
 *      Author: misha
 */

#ifndef CITIESSERVICE_HPP_
#define CITIESSERVICE_HPP_

#include <QtCore/QObject>
#include <QList>
#include <QVariantList>
#include "../models/City.hpp"

class CitiesService : public QObject {
    Q_OBJECT
    Q_PROPERTY(QList<City*> cities READ getCities WRITE setCities NOTIFY citiesChanged)
    Q_PROPERTY(City* currentCity READ getCurrentCity NOTIFY currentCityChanged)

public:
    CitiesService(QObject* parent = 0);
    virtual ~CitiesService();

    Q_INVOKABLE const QList<City*> getCities() const;
    Q_INVOKABLE void setCities(const QList<City*> cities);

    Q_INVOKABLE void fromMaps(const QVariantList citiesMaps);
    Q_INVOKABLE QVariantList toMaps() const;

    Q_INVOKABLE City* getCurrentCity() const;
    Q_INVOKABLE void setCurrentCity(const int cityId);

Q_SIGNALS:
    void citiesChanged(const QList<City*>& cities);
    void currentCityChanged(const City* city);

private:
    QList<City*> m_cities;
    City* m_currentCity;

    void destroyCities();
};

#endif /* CITIESSERVICE_HPP_ */
