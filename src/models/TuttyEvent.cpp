/*
 * TuttyEvent.cpp
 *
 *  Created on: Jan 19, 2017
 *      Author: misha
 */

#include "TuttyEvent.hpp"

TuttyEvent::TuttyEvent(QObject* parent) : QObject(parent) {
    m_id = 0;
    m_name = "";
    m_description = "";
    m_image = "";
    m_commentsCnt = 0;
    m_url = "";
}

TuttyEvent::~TuttyEvent() {}

TuttyEvent::TuttyEvent(const TuttyEvent& event) : QObject(event.parent()) {
    if (this != &event) {
        swap(event);
    }
}

bool TuttyEvent::operator==(const TuttyEvent& event) {
    return this->getId() == event.getId() && this->getName().compare(event.getName());
}

TuttyEvent& TuttyEvent::operator=(const TuttyEvent& event) {
    swap(event);
    return *this;
}

int TuttyEvent::getId() const { return m_id; }
void TuttyEvent::setId(const int id) {
    m_id = id;
    emit idChanged(m_id);
}

const QString& TuttyEvent::getName() const { return m_name; }
void TuttyEvent::setName(const QString name) {
    m_name = name;
    emit nameChanged(m_name);
}

const QString& TuttyEvent::getDescription() const { return m_description; }
void TuttyEvent::setDescription(const QString description) {
    m_description = description;
    emit descriptionChanged(m_description);
}

const QString& TuttyEvent::getImage() const { return m_image; }
void TuttyEvent::setImage(const QString image) {
    m_image = image;
    emit imageChanged(m_image);
}

const QList<QString>& TuttyEvent::getImages() const { return m_images; }
void TuttyEvent::setImages(const QList<QString>& images) {
    m_images = images;
    emit imagesChanged(m_images);
}

int TuttyEvent::getCommentsCnt() const { return m_commentsCnt; }
void TuttyEvent::setCommentsCnt(const int commentsCnt) {
    m_commentsCnt = commentsCnt;
    emit commentsCntChanged(m_commentsCnt);
}

const QString& TuttyEvent::getUrl() const { return m_url; }
void TuttyEvent::setUrl(const QString url) {
    m_url = url;
    emit urlChanged(m_url);
}

void TuttyEvent::fromMap(const QVariantMap map) {
    this->setId(map.value("id").toInt());
    this->setName(map.value("name").toString());
    this->setDescription(map.value("description").toString());
    this->setImage(map.value("image").toString());

    QList<QVariant> rawImages = map.value("images").toList();
    QList<QString> images;
    for (int i = 0; i < rawImages.size(); i++) {
        images.append(rawImages[i].toString());
    }
    this->setImages(images);
    this->setCommentsCnt(map.value("commentsCnt").toInt());
    this->setUrl(map.value("url").toString());
}

QVariantMap TuttyEvent::toMap() const {
    QVariantMap map;
    map.insert("id", this->getId());
    map.insert("name", this->getName());
    map.insert("description", this->getDescription());
    map.insert("image", this->getImage());
    map.insert("commentsCnt", this->getCommentsCnt());
    map.insert("url", this->getUrl());

    QVariantList images;
    for (int i = 0; i < this->getImages().size(); i++) {
        images.append(this->getImages().at(i));
    }
    map.insert("images", images);
    return map;
}

void TuttyEvent::swap(const TuttyEvent& event) {
    this->setId(event.getId());

    QString name = event.getName();
    this->setName(name);

    QString description = event.getDescription();
    this->setDescription(description);

    QString image = event.getImage();
    this->setImage(image);

    this->setCommentsCnt(event.getCommentsCnt());

    QString url = event.getUrl();
    this->setUrl(url);

    for (int i = 0; i < event.getImages().size(); i++) {
        m_images.append(event.getImages().at(i));
    }
}

QVariantList TuttyEvent::imagesToQVList() const {
    QVariantList images;
    for (int i = 0; i < m_images.size(); i++) {
        images.append(m_images.at(i));
    }
    return images;
}

