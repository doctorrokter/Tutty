/*
 * TuttyEvent.hpp
 *
 *  Created on: Jan 19, 2017
 *      Author: misha
 */

#ifndef TUTTYEVENT_HPP_
#define TUTTYEVENT_HPP_

#include <QtCore/QObject>
#include <QVariantMap>

class TuttyEvent: public QObject {
    Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString description READ getDescription WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(QString image READ getImage WRITE setImage NOTIFY imageChanged)
    Q_PROPERTY(QList<QString> images READ getImages WRITE setImages NOTIFY imagesChanged)
    Q_PROPERTY(int commentsCnt READ getCommentsCnt WRITE setCommentsCnt NOTIFY commentsCntChanged)
    Q_PROPERTY(QString url READ getUrl WRITE setUrl NOTIFY urlChanged)
public:
    TuttyEvent(QObject* parent = 0);
    TuttyEvent(const TuttyEvent& event);
    virtual ~TuttyEvent();

    TuttyEvent& operator=(const TuttyEvent& event);
    bool operator==(const TuttyEvent& event);

    Q_INVOKABLE int getId() const;
    Q_INVOKABLE void setId(const int id);

    Q_INVOKABLE const QString& getName() const;
    Q_INVOKABLE void setName(const QString name);

    Q_INVOKABLE const QString& getDescription() const;
    Q_INVOKABLE void setDescription(const QString description);

    Q_INVOKABLE const QString& getImage() const;
    Q_INVOKABLE void setImage(const QString image);

    Q_INVOKABLE const QList<QString>& getImages() const;
    Q_INVOKABLE void setImages(const QList<QString>& images);

    Q_INVOKABLE int getCommentsCnt() const;
    Q_INVOKABLE void setCommentsCnt(const int commentsCnt);

    Q_INVOKABLE const QString& getUrl() const;
    Q_INVOKABLE void setUrl(const QString url);

    Q_INVOKABLE void fromMap(const QVariantMap map);
    Q_INVOKABLE QVariantMap toMap() const;

    Q_INVOKABLE QVariantList imagesToQVList() const;

Q_SIGNALS:
    void idChanged(const int id);
    void nameChanged(const QString& name);
    void descriptionChanged(const QString& description);
    void imageChanged(const QString& image);
    void imagesChanged(const QList<QString>& images);
    void commentsCntChanged(const int commentsCnt);
    void urlChanged(const QString& url);

private:
    int m_id;
    QString m_name;
    QString m_description;
    QString m_image;
    QList<QString> m_images;
    int m_commentsCnt;
    QString m_url;

protected:
    void swap(const TuttyEvent& tuttyEvent);
};

#endif /* TUTTYEVENT_HPP_ */
