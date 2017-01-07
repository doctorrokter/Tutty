/*
 * City.cpp
 *
 *  Created on: Jan 7, 2017
 *      Author: misha
 */

#include "City.hpp"

City::City(QObject* parent) : QObject(parent), m_code(""), m_title("") {}

City::City(const City& city) : QObject(city.parent()) {
    if (this != &city) {
        swap(city);
    }
}

City::~City() {}

City& City::operator=(const City& city) {
    swap(city);
    return *this;
}

bool City::operator==(const City& city) {
    return this->getId() == city.getId();
}

int City::getId() const { return m_id; }
void City::setId(const int id) {
    m_id = id;
    emit idChanged(m_id);
}

const QString& City::getCode() const { return m_code; }
void City::setCode(const QString code) {
    m_code = code;
    emit codeChanged(m_code);
}

const QString& City::getTitle() const { return m_title; }
void City::setTitle(const QString title) {
    m_title = title;
    emit titleChanged(m_title);
}

bool City::isCapitalCity() const { return m_isCapitalCity; }
void City::setCapitalCity(const bool isCapitalCity) {
    m_isCapitalCity = isCapitalCity;
    emit capitalCityChanged(m_isCapitalCity);
}

int City::getIdCapitalCity() const { return m_idCapitalCity; }
void City::setIdCapitalCity(const int idCapitalCity) {
    m_idCapitalCity = idCapitalCity;
    emit idCapitalCityChanged(m_idCapitalCity);
}

void City::fromMap(const QVariantMap cityMap) {
    this->setId(cityMap.value("id").toInt());
    this->setCode(cityMap.value("code").toString());
    this->setTitle(cityMap.value("title").toString());
    this->setCapitalCity(cityMap.value("isCapitalCity").toBool());
    this->setIdCapitalCity(cityMap.value("idCapitalCity").toInt());
}

QVariantMap City::toMap() const {
    QVariantMap map;
    map.insert("id", this->getId());
    map.insert("code", this->getCode());
    map.insert("title", this->getTitle());
    map.insert("isCapitalCity", this->isCapitalCity());
    map.insert("idCapitalCity", this->getIdCapitalCity());
    return map;
}

void City::swap(const City& city) {
    this->setId(city.getId());
    this->setCapitalCity(city.isCapitalCity());
    this->setIdCapitalCity(city.getIdCapitalCity());

    QString code = city.getCode();
    this->setCode(code);

    QString title = city.getTitle();
    this->setTitle(title);
}


