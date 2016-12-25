/*
 * Film.cpp
 *
 *  Created on: Dec 6, 2016
 *      Author: misha
 */

#include "Film.hpp"
#include <iostream>

using namespace std;

Film::Film(QObject* parent) : QObject(parent) {
    m_id = 0;
    m_name = "";
    m_description = "";
    m_actors = "";
    m_director = "";
    m_image = "";
    m_year = 0;
    m_country = "";
    m_duration = 0;
    m_isPremiere = 0;
    m_premiereAt = 0;
    m_threeD = 0;
    m_video = "";
    m_genres = "";
    m_restriction = "";
    m_timeLeft = 0;
    m_commentsCnt = 0;
    m_rate = "";
    m_rateTen = "";
    m_rateImdb = "";
    m_rateKinopoisk = "";
    m_url = "";
}

Film::Film(const Film& film) : QObject(film.parent()) {
    if (this != &film) {
        swap(film);
    }
}

Film::~Film() {}

Film& Film::operator=(const Film& film) {
    swap(film);
    return *this;
}

bool Film::operator==(const Film& film) {
    return this->getId() == film.getId();
}

int Film::getId() const { return m_id; }
void Film::setId(const int id) {
    m_id = id;
    emit idChanged(m_id);
}

const QString& Film::getName() const { return m_name; }
void Film::setName(const QString name) {
    m_name = name;
    emit nameChanged(m_name);
}

const QString& Film::getDescription() const { return m_description; }
void Film::setDescription(const QString description) {
    m_description = description;
    emit descriptionChanged(m_description);
}

const QString& Film::getActors() const { return m_actors; }
void Film::setActors(const QString actors) {
    m_actors = actors;
    emit actorsChanged(m_actors);
}

const QString& Film::getDirector() const { return m_director; }
void Film::setDirector(const QString director) {
    m_director = director;
    emit directorChanged(m_director);
}

const QString& Film::getImage() const { return m_image; }
void Film::setImage(const QString image) {
    m_image = image;
    emit imageChanged(m_image);
}

int Film::getYear() const { return m_year; }
void Film::setYear(const int year) {
    m_year = year;
    emit yearChanged(m_year);
}

const QString& Film::getCountry() const { return m_country; }
void Film::setCountry(const QString country) {
    m_country = country;
    emit countryChanged(m_country);
}

int Film::getDuration() const { return m_duration; }
void Film::setDuration(const int duration) {
    m_duration = duration;
    emit durationChanged(m_duration);
}

bool Film::isPremiere() const { return m_isPremiere; }
void Film::setIsPremiere(const bool isPremiere) {
    m_isPremiere = isPremiere;
    emit isPremiereChanged(m_isPremiere);
}

int Film::getPremiereAt() const { return m_premiereAt; }
void Film::setPremiereAt(const int premiereAt) {
    m_premiereAt = premiereAt;
    emit premiereAtChanged(m_premiereAt);
}

bool Film::isThreeD() const { return m_threeD; }
void Film::setThreeD(const bool threeD) {
    m_threeD = threeD;
    emit isThreeDChanged(m_threeD);
}

const QString& Film::getVideo() const { return m_video; }
void Film::setVideo(const QString video) {
    m_video = video;
    emit videoChanged(m_video);
}

const QString& Film::getGenres() const { return m_genres; }
void Film::setGenres(const QString genres) {
    m_genres = genres;
    emit genresChanged(m_genres);
}

const QString& Film::getRestriction() const { return m_restriction; }
void Film::setRestriction(const QString restriction) {
    m_restriction = restriction;
    emit restrictionChanged(m_restriction);
}

const QList<QString>& Film::getImages() const { return m_images; }
void Film::setImages(const QList<QString>& images) {
    m_images = images;
    emit imagesChanged(m_images);
}

int Film::getTimeLeft() const { return m_timeLeft; }
void Film::setTimeLeft(const int timeLeft) {
    m_timeLeft = timeLeft;
    emit timeLeftChanged(m_timeLeft);
}

int Film::getCommentsCnt() const { return m_commentsCnt; }
void Film::setCommentsCnt(const int commentsCnt) {
    m_commentsCnt = commentsCnt;
    emit commentsCntChanged(m_commentsCnt);
}

const QString& Film::getRate() const { return m_rate; }
void Film::setRate(const QString rate) {
    m_rate = rate;
    emit rateChanged(m_rate);
}

const QString& Film::getRateTen() const { return m_rateTen; }
void Film::setRateTen(const QString rateTen) {
    m_rateTen = rateTen;
    emit rateTenChanged(m_rateTen);
}

const QString& Film::getRateImdb() const { return m_rateImdb; }
void Film::setRateImdb(const QString rateImdb) {
    m_rateImdb = rateImdb;
    emit rateImdbChanged(m_rateImdb);
}

const QString& Film::getRateKinopoisk() const { return m_rateKinopoisk; }
void Film::setRateKinopoisk(const QString rateKinopoisk) {
    m_rateKinopoisk = rateKinopoisk;
    emit rateKinopoiskChanged(m_rateKinopoisk);
}

const QString& Film::getUrl() const { return m_url; }
void Film::setUrl(const QString url) {
    m_url = url;
    emit urlChanged(m_url);
}

void Film::fromMap(const QVariantMap map) {
    this->setId(map.value("id").toInt());
    this->setName(map.value("name").toString());
    this->setDescription(map.value("description").toString());
    this->setActors(map.value("actors").toString());
    this->setDirector(map.value("director").toString());
    this->setImage(map.value("image").toString());
    this->setYear(map.value("year").toInt());
    this->setCountry(map.value("country").toString());
    this->setDuration(map.value("duration").toInt());
    this->setIsPremiere(map.value("is_premiere").toInt() == 1);
    this->setPremiereAt(map.value("premiere_at").toInt());
    this->setThreeD(map.value("3d").toInt() == 1);
    this->setVideo(map.value("video").toString());
    this->setGenres(map.value("genres").toString());
    this->setRestriction(map.value("restriction").toString());

    QList<QVariant> rawImages = map.value("images").toList();
    QList<QString> images;
    for (int i = 0; i < rawImages.size(); i++) {
        images.append(rawImages[i].toString());
    }
    this->setImages(images);

    this->setTimeLeft(map.value("timeLeft").toInt());
    this->setCommentsCnt(map.value("commentsCnt").toInt());
    this->setRate(map.value("rate").toString());
    this->setRateTen(map.value("rate_ten").toString());
    this->setRateImdb(map.value("rate_imdb").toString());
    this->setRateKinopoisk(map.value("rate_kinopoisk").toString());
    this->setUrl(map.value("url").toString());
}

QVariantMap Film::toMap() const {
    QVariantMap map;
    map.insert("id", this->getId());
    map.insert("name", this->getName());
    map.insert("description", this->getDescription());
    map.insert("actors", this->getActors());
    map.insert("director", this->getDirector());
    map.insert("image", this->getImage());
    map.insert("year", this->getYear());
    map.insert("country", this->getCountry());
    map.insert("duration", this->getDuration());
    map.insert("isPremiere", this->isPremiere());
    map.insert("premiereAt", this->getPremiereAt());
    map.insert("threeD", this->isThreeD());
    map.insert("video", this->getVideo());
    map.insert("genres", this->getGenres());
    map.insert("restriction", this->getRestriction());
    map.insert("timeLeft", this->getTimeLeft());
    map.insert("commentsCnt", this->getCommentsCnt());
    map.insert("rate", this->getRate());
    map.insert("rateTen", this->getRateTen());
    map.insert("rateImdb", this->getRateImdb());
    map.insert("rateKinopoisk", this->getRateKinopoisk());
    map.insert("url", this->getUrl());

    QVariantList images;
    for (int i = 0; i < this->getImages().size(); i++) {
        images.append(this->getImages().at(i));
    }
    map.insert("images", images);
    return map;
}

void Film::swap(const Film& film) {
    this->setId(film.getId());

    QString name = film.getName();
    this->setName(name);

    QString description = film.getDescription();
    this->setDescription(description);

    QString actors = film.getActors();
    this->setActors(actors);

    QString director = film.getDirector();
    this->setDirector(director);

    QString image = film.getImage();
    this->setImage(image);

    this->setYear(film.getYear());

    QString country = film.getCountry();
    this->setCountry(country);

    this->setDuration(film.getDuration());
    this->setIsPremiere(film.isPremiere());
    this->setPremiereAt(film.getPremiereAt());
    this->setThreeD(film.isThreeD());

    QString video = film.getVideo();
    this->setVideo(video);

    QString genres = film.getGenres();
    this->setGenres(genres);

    QString restriction = film.getRestriction();
    this->setRestriction(restriction);

    this->setTimeLeft(film.getTimeLeft());
    this->setCommentsCnt(film.getCommentsCnt());
    this->setRate(film.getRate());
    this->setRateTen(film.getRateTen());
    this->setRateImdb(film.getRateImdb());
    this->setRateKinopoisk(film.getRateKinopoisk());

    QString url = film.getUrl();
    this->setUrl(url);

    for (int i = 0; i < film.getImages().size(); i++) {
        m_images.append(film.getImages().at(i));
    }
}

QVariantList Film::imagesToQVList() const {
    QVariantList images;
    for (int i = 0; i < m_images.size(); i++) {
        images.append(m_images.at(i));
    }
    return images;
}

