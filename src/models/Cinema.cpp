/*
 * Cinema.cpp
 *
 *  Created on: Dec 6, 2016
 *      Author: misha
 */

#include "Cinema.hpp"

Cinema::Cinema(QObject* parent) : QObject(parent),
    m_id(0), m_title(""), m_address(""), m_ll(0), m_sph(0),
    m_phone(""), m_placePhoto(""), m_priority(0) {
}

Cinema::~Cinema() {}

Cinema::Cinema(const Cinema& cinema) : QObject(cinema.parent()) {
    swap(cinema);
}

Cinema& Cinema::operator=(const Cinema& cinema) {
    swap(cinema);
    return *this;
}

bool Cinema::operator==(const Cinema& cinema) {
    return this->getId() == cinema.getId();
}

int Cinema::getId() const { return m_id; }
void Cinema::setId(const int id) { m_id = id; }

const QString& Cinema::getTitle() const { return m_title; }
void Cinema::setTitle(const QString title) { m_title = title; }

const QString& Cinema::getAddress() const { return m_address; }
void Cinema::setAddress(const QString address) { m_address = address; }

double Cinema::getLl() const { return m_ll; }
void Cinema::setLl(const double ll) { m_ll = ll; }

double Cinema::getSph() const { return m_sph; }
void Cinema::setSph(const double sph) { m_sph = sph; }

const QString& Cinema::getPhone() const { return m_phone; }
void Cinema::setPhone(const QString phone) { m_phone = phone; }

const QString& Cinema::getPlacePhoto() const { return m_placePhoto; }
void Cinema::setPlacePhoto(const QString placePhoto) { m_placePhoto = placePhoto; }

int Cinema::getPriority() const { return m_priority; }
void Cinema::setPriority(const int priority) { m_priority = priority; }

void Cinema::fromMap(const QVariantMap map) {
    this->setId(map.value("id").toInt());
    this->setTitle(map.value("title").toString());
    this->setAddress(map.value("address").toString());
    this->setLl(map.value("ll").toDouble());
    this->setSph(map.value("sph").toDouble());
    this->setPhone(map.value("phone").toString());
    this->setPlacePhoto(map.value("place_photo").toString());
    this->setPriority(map.value("priority").toInt());
}

QVariantMap Cinema::toMap() const {
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

void Cinema::swap(const Cinema& cinema) {
    this->setId(cinema.getId());

    QString title = cinema.getTitle();
    this->setTitle(title);

    QString address = cinema.getAddress();
    this->setAddress(address);

    this->setLl(cinema.getLl());
    this->setSph(cinema.getSph());

    QString phone = cinema.getPhone();
    this->setPhone(phone);

    QString placePhoto = cinema.getPlacePhoto();
    this->setPlacePhoto(placePhoto);

    this->setPriority(cinema.getPriority());
}
