/*
 * CitiesService.cpp
 *
 *  Created on: Jan 7, 2017
 *      Author: misha
 */

#include "CitiesService.hpp"

CitiesService::CitiesService(QObject* parent) : QObject(parent) {}

CitiesService::~CitiesService() {
    destroyCities();
    delete m_currentCity;
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
}

QVariantList CitiesService::toMaps() const {
    QVariantList cities;
    for (int i = 0; i < m_cities.size(); i++) {
        cities.append(m_cities.at(i)->toMap());
    }
    return cities;
}

City* CitiesService::getCurrentCity() const { return m_currentCity; }
void CitiesService::setCurrentCity(const int cityId) {
    for (int i = 0; i < m_cities.size(); i++) {
        if (cityId == m_cities.at(i)->getId()) {
            m_currentCity = m_cities.at(i);
            emit currentCityChanged(m_currentCity);
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


