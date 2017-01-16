/*
 * Comment.hpp
 *
 *  Created on: Jan 16, 2017
 *      Author: misha
 */

#ifndef COMMENT_HPP_
#define COMMENT_HPP_

#include <QtCore/QObject>
#include <QVariantMap>

class Comment : public QObject {
    Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(int eventId READ getEventId WRITE setEventId NOTIFY eventIdChanged)
    Q_PROPERTY(QString time READ getTime WRITE setTime NOTIFY timeChanged)
    Q_PROPERTY(QString login READ getLogin WRITE setLogin NOTIFY loginChanged)
    Q_PROPERTY(QString firstName READ getFirstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString lastName READ getLastName WRITE setLastName NOTIFY lastNameChanged)
    Q_PROPERTY(QString comment READ getComment WRITE setComment NOTIFY commentChanged)
    Q_PROPERTY(QString commentRating READ getCommentRating WRITE setCommentRating NOTIFY commentRatingChanged)
    Q_PROPERTY(QString commentRatingTen READ getCommentRatingTen WRITE setCommentRatingTen NOTIFY commentRatingTenChanged)

public:
    Comment(QObject* parent = 0);
    Comment(const Comment& comment);
    virtual ~Comment();

    Comment& operator=(const Comment& comment);
    bool operator==(const Comment& comment);

    Q_INVOKABLE int getId() const;
    Q_INVOKABLE void setId(const int id);

    Q_INVOKABLE int getEventId() const;
    Q_INVOKABLE void setEventId(const int eventId);

    Q_INVOKABLE const QString& getTime() const;
    Q_INVOKABLE void setTime(const QString time);

    Q_INVOKABLE const QString& getLogin() const;
    Q_INVOKABLE void setLogin(const QString login);

    Q_INVOKABLE const QString& getFirstName() const;
    Q_INVOKABLE void setFirstName(const QString firstName);

    Q_INVOKABLE const QString& getLastName() const;
    Q_INVOKABLE void setLastName(const QString lastName);

    Q_INVOKABLE const QString& getComment() const;
    Q_INVOKABLE void setComment(const QString comment);

    Q_INVOKABLE const QString& getCommentRating() const;
    Q_INVOKABLE void setCommentRating(const QString commentRating);

    Q_INVOKABLE const QString& getCommentRatingTen() const;
    Q_INVOKABLE void setCommentRatingTen(const QString commentRatingTen);

    Q_INVOKABLE void fromMap(const QVariantMap map);
    Q_INVOKABLE QVariantMap toMap() const;

Q_SIGNALS:
    void idChanged(const int id);
    void eventIdChanged(const int eventId);
    void timeChanged(const QString& time);
    void loginChanged(const QString& login);
    void firstNameChanged(const QString& firstName);
    void lastNameChanged(const QString& lastName);
    void commentChanged(const QString& comment);
    void commentRatingChanged(const QString& commentRating);
    void commentRatingTenChanged(const QString& commentRatingTen);

private:
    int m_id;
    int m_eventId;
    QString m_time;
    QString m_login;
    QString m_firstName;
    QString m_lastName;
    QString m_comment;
    QString m_commentRating;
    QString m_commentRatingTen;

    void swap(const Comment& comment);
};

#endif /* COMMENT_HPP_ */
