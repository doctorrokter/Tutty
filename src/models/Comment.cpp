/*
 * Comment.cpp
 *
 *  Created on: Jan 16, 2017
 *      Author: misha
 */

#include "Comment.hpp"

Comment::Comment(QObject* parent) : QObject(parent), m_id(0), m_eventId(0), m_time(""), m_login(""), m_firstName(""),
    m_lastName(""), m_comment(""), m_commentRating(""), m_commentRatingTen("") {}

Comment::Comment(const Comment& comment) : QObject(comment.parent()) {
    if (this != &comment) {
        swap(comment);
    }
}

Comment::~Comment() {}

Comment& Comment::operator=(const Comment& comment) {
    swap(comment);
    return *this;
}

bool Comment::operator==(const Comment& comment) {
    return this->getId() == comment.getEventId() && this->getEventId() == comment.getEventId();
}

int Comment::getId() const { return m_id; }
void Comment::setId(const int id) {
    m_id = id;
    emit idChanged(m_id);
}

int Comment::getEventId() const { return m_eventId; }
void Comment::setEventId(const int eventId) {
    m_eventId = eventId;
    emit eventIdChanged(m_eventId);
}

const QString& Comment::getTime() const { return m_time; }
void Comment::setTime(const QString time) {
    m_time = time;
    emit timeChanged(m_time);
}

const QString& Comment::getLogin() const { return m_login; }
void Comment::setLogin(const QString login) {
    m_login = login;
    emit loginChanged(m_login);
}

const QString& Comment::getFirstName() const { return m_firstName; }
void Comment::setFirstName(const QString firstName) {
    m_firstName = firstName;
    emit firstNameChanged(m_firstName);
}

const QString& Comment::getLastName() const { return m_lastName; }
void Comment::setLastName(const QString lastName) {
    m_lastName = lastName;
    emit lastNameChanged(m_lastName);
}

const QString& Comment::getComment() const { return m_comment; }
void Comment::setComment(const QString comment) {
    m_comment = comment;
    emit commentChanged(m_comment);
}

const QString& Comment::getCommentRating() const { return m_commentRating; }
void Comment::setCommentRating(const QString commentRating) {
    m_commentRating = commentRating;
    emit commentRatingChanged(m_commentRating);
}

const QString& Comment::getCommentRatingTen() const { return m_commentRatingTen; }
void Comment::setCommentRatingTen(const QString commentRatingTen) {
    m_commentRatingTen = commentRatingTen;
    emit commentRatingTenChanged(m_commentRatingTen);
}

void Comment::fromMap(const QVariantMap map) {
    this->setId(map.value("id").toInt());
    this->setEventId(map.value("event_id").toInt());

    QString time = map.value("time").toString();
    this->setTime(time);

    QString login = map.value("login").toString();
    this->setLogin(login);

    QString firstName = map.value("firstname").toString();
    this->setFirstName(firstName);

    QString lastName = map.value("secondname").toString();
    this->setLastName(lastName);

    QString comment = map.value("comment").toString();
    this->setComment(comment);

    QString commentRating = map.value("comment_rating").toString();
    this->setCommentRating(commentRating);

    QString commentRatingTen = map.value("comment_rating_ten").toString();
    this->setCommentRatingTen(commentRatingTen);
}

QVariantMap Comment::toMap() const {
    QVariantMap map;
    map.insert("id", this->getId());
    map.insert("eventId", this->getEventId());
    map.insert("time", this->getTime());
    map.insert("login", this->getLogin());
    map.insert("firstName", this->getFirstName());
    map.insert("lastName", this->getLastName());
    map.insert("comment", this->getComment());
    map.insert("commentRating", this->getCommentRating());
    map.insert("commentRatingTen", this->getCommentRatingTen());
    return map;
}

void Comment::swap(const Comment& comment) {
    this->setId(comment.getId());
    this->setEventId(comment.getEventId());

    QString time = comment.getTime();
    this->setTime(time);

    QString login = comment.getLogin();
    this->setLogin(login);

    QString firstName = comment.getFirstName();
    this->setFirstName(firstName);

    QString lastName = comment.getLastName();
    this->setLastName(lastName);

    QString commentText = comment.getComment();
    this->setComment(commentText);

    QString commentRating = comment.getCommentRating();
    this->setCommentRating(commentRating);

    QString commentRatingTen = comment.getCommentRatingTen();
    this->setCommentRatingTen(commentRatingTen);
}



