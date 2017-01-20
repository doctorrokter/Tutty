/*
 * Place.cpp
 *
 *  Created on: Jan 18, 2017
 *      Author: misha
 */

#include "Place.hpp"

Place::Place(QObject* parent) : QObject(parent),
    m_id(0), m_title(""), m_address(""), m_ll(0), m_sph(0),
    m_phone(""), m_placePhoto(""), m_priority(0) {
}

Place::~Place() {}

Place::Place(const Place& place) : QObject(place.parent()) {
    swap(place);
}

Place& Place::operator=(const Place& place) {
    swap(place);
    return *this;
}

bool Place::operator==(const Place& place) {
    return this->getId() == place.getId();
}

int Place::getId() const { return m_id; }
void Place::setId(const int id) { m_id = id; }

const QString& Place::getTitle() const { return m_title; }
void Place::setTitle(const QString title) { m_title = title; }

const QString& Place::getAddress() const { return m_address; }
void Place::setAddress(const QString address) { m_address = address; }

double Place::getLl() const { return m_ll; }
void Place::setLl(const double ll) { m_ll = ll; }

double Place::getSph() const { return m_sph; }
void Place::setSph(const double sph) { m_sph = sph; }

const QString& Place::getPhone() const { return m_phone; }
void Place::setPhone(const QString phone) { m_phone = phone; }

const QString& Place::getPlacePhoto() const { return m_placePhoto; }
void Place::setPlacePhoto(const QString placePhoto) { m_placePhoto = placePhoto; }

int Place::getPriority() const { return m_priority; }
void Place::setPriority(const int priority) { m_priority = priority; }

void Place::fromMap(const QVariantMap map) {
    this->setId(map.value("id").toInt());
    this->setTitle(map.value("title").toString());
    this->setAddress(map.value("address").toString());
    this->setLl(map.value("ll").toDouble());
    this->setSph(map.value("sph").toDouble());
    this->setPhone(map.value("phone").toString());
    this->setPlacePhoto(map.value("place_photo").toString());
    this->setPriority(map.value("priority").toInt());
}

QVariantMap Place::toMap() const {
    QVariantMap map;
    map.insert("id", this->getId());
    map.insert("title", this->getTitle());
    map.insert("address", this->getAddress());
    map.insert("ll", this->getLl());
    map.insert("sph", this->getSph());
    map.insert("phone", this->getPhone());
    map.insert("place_photo", this->getPlacePhoto());
    map.insert("priority", this->getPriority());
    return map;
}

void Place::swap(const Place& place) {
    this->setId(place.getId());

    QString title = place.getTitle();
    this->setTitle(title);

    QString address = place.getAddress();
    this->setAddress(address);

    this->setLl(place.getLl());
    this->setSph(place.getSph());

    QString phone = place.getPhone();
    this->setPhone(phone);

    QString placePhoto = place.getPlacePhoto();
    this->setPlacePhoto(placePhoto);

    this->setPriority(place.getPriority());
}

