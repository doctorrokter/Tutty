/*
 * CitiesService.cpp
 *
 *  Created on: Jan 7, 2017
 *      Author: misha
 */

#include "CitiesService.hpp"
#include <QtCore/QSettings>

CitiesService::CitiesService(QObject* parent) : QObject(parent) {
    QSettings settings;
    City* pCity = new City();
    if (settings.contains("city")) {
        pCity->fromMap(settings.value("city", "").toMap());
    } else {
        pCity->setCode("minsk");
        pCity->setId(0);
    }
    m_pCurrentCity = pCity;
}

CitiesService::~CitiesService() {
    destroyCities();
    delete m_pCurrentCity;
}

const QList<City*> CitiesService::getCities() const { return m_cities; }
void CitiesService::setCities(const QList<City*> cities) {
    m_cities = cities;
    emit citiesChanged(m_cities);
}

void CitiesService::fromMaps(const QVariantList citiesMaps) {
    destroyCities();
    QList<City*> cities;

    for (int i = 0; i < citiesMaps.size(); i++) {
        City* pCity = new City();
        pCity->fromMap(citiesMaps.at(i).toMap());
        cities.append(pCity);
    }

    setCities(cities);

    if (m_pCurrentCity == 0 || m_pCurrentCity->getId() == 0) {
        delete m_pCurrentCity;
        setCurrentCity(m_cities.at(0)->getId());
    }
}

QVariantList CitiesService::toMaps() const {
    QVariantList cities;
    for (int i = 0; i < m_cities.size(); i++) {
        cities.append(m_cities.at(i)->toMap());
    }
    return cities;
}

City* CitiesService::getCurrentCity() const { return m_pCurrentCity; }
void CitiesService::setCurrentCity(const int cityId) {
    QSettings settings;
    for (int i = 0; i < m_cities.size(); i++) {
        if (cityId == m_cities.at(i)->getId()) {
            m_pCurrentCity = m_cities.at(i);
            settings.setValue("city", m_pCurrentCity->toMap());
            emit currentCityChanged(m_pCurrentCity);
            return;
        }
    }
}

void CitiesService::destroyCities() {
    if (!m_cities.empty()) {
        for (int i = 0; i < m_cities.size(); i++) {
            delete m_cities.at(i);
        }
        m_cities.clear();
    }
}


