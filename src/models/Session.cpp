/*
 * Session.cpp
 *
 *  Created on: Dec 20, 2016
 *      Author: misha
 */

#include "Session.hpp"

Session::Session(QObject* parent) : QObject(parent) {}

Session::Session(const Session& session) : QObject(session.parent()) {
    swap(session);
}

Session::~Session() {}

Session& Session::operator=(const Session& session) {
    swap(session);
    return *this;
}

bool Session::operator==(const Session& session) {
    return session.getId() == this->getId();
}

int Session::getId() const { return m_id; }
void Session::setId(const int id) {
    m_id = id;
    emit idChanged(m_id);
}

int Session::getSessionTime() const { return m_sessionTime; }
void Session::setSessionTime(const int sessionTime) {
    m_sessionTime = sessionTime;
    emit sessionTimeChanged(m_sessionTime);
}

int Session::getBycardSessionId() const { return m_bycardSessionId; }
void Session::setBycardSessionId(const int bycardSessionId) {
    m_bycardSessionId = bycardSessionId;
    emit bycardSessionIdChanged(m_bycardSessionId);
}

const QString& Session::getPrice() const { return m_price; }
void Session::setPrice(const QString price) {
    m_price = price;
    emit priceChanged(m_price);
}

bool Session::isTicketsAvailable() const { return m_ticketsAvailable; }
void Session::setTicketsAvailable(const bool ticketsAvailable) {
    m_ticketsAvailable = ticketsAvailable;
    emit ticketsAvailableChanged(m_ticketsAvailable);
}

const QString& Session::getBuyTicketUrl() const { return m_buyTicketUrl; }
void Session::setBuyTicketUrl(const QString buyTicketUrl) {
    m_buyTicketUrl = buyTicketUrl;
    emit buyTicketUrlChanged(m_buyTicketUrl);
}

bool Session::isThreeD() const { return m_threeD; }
void Session::setThreeD(const bool threeD) {
    m_threeD = threeD;
    emit threeDChanged(m_threeD);
}

void Session::fromMap(const QVariantMap map) {
    this->setId(map.value("idSession").toInt());
    this->setSessionTime(map.value("session_time").toInt());
    this->setBycardSessionId(map.value("bycard_session_id").toInt());
    this->setPrice(map.value("price").toString());
    this->setTicketsAvailable(map.value("tickets_available").toBool());
    this->setBuyTicketUrl(map.value("buyTicketUrl").toString());
    this->setThreeD(map.value("3d").toBool());
}

QVariantMap Session::toMap() {
    QVariantMap map;
    map.insert("id", this->getId());
    map.insert("sessionTime", this->getSessionTime());
    map.insert("buycardSessionId", this->getBycardSessionId());
    map.insert("price", this->getPrice());
    map.insert("ticketsAvailable", this->isTicketsAvailable());
    map.insert("buyTicketUrl", this->getBuyTicketUrl());
    map.insert("threeD", this->isThreeD());
    return map;
}

void Session::swap(const Session& session) {
    if (this != &session) {
        this->setId(session.getId());
        this->setBycardSessionId(session.getBycardSessionId());
        this->setSessionTime(session.getSessionTime());

        QString price = session.getPrice();
        this->setPrice(price);
        this->setTicketsAvailable(session.isTicketsAvailable());

        QString buyTicketUrl = session.getBuyTicketUrl();
        this->setBuyTicketUrl(buyTicketUrl);
        this->setThreeD(session.isThreeD());
    }
}




