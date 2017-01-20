/*
 * Place.hpp
 *
 *  Created on: Jan 18, 2017
 *      Author: misha
 */

#ifndef PLACE_HPP_
#define PLACE_HPP_

#include <QtCore/QObject>
#include <QVariantMap>

class Place: public QObject {
    Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId)
    Q_PROPERTY(QString title READ getTitle WRITE setTitle)
    Q_PROPERTY(QString address READ getAddress WRITE setAddress)
    Q_PROPERTY(double ll READ getLl WRITE setLl)
    Q_PROPERTY(double sph READ getSph WRITE setSph)
    Q_PROPERTY(QString phone READ getPhone WRITE setPhone)
    Q_PROPERTY(QString placePhoto READ getPlacePhoto)
    Q_PROPERTY(int priority READ getPriority WRITE setPriority)

public:
    Place(QObject* parent = 0);
    Place(const Place& place);
    virtual ~Place();

    Place& operator=(const Place& place);
    bool operator==(const Place& place);

    Q_INVOKABLE int getId() const;
    Q_INVOKABLE void setId(const int id);

    Q_INVOKABLE const QString& getTitle() const;
    Q_INVOKABLE void setTitle(const QString title);

    Q_INVOKABLE const QString& getAddress() const;
    Q_INVOKABLE void setAddress(const QString address);

    Q_INVOKABLE double getLl() const;
    Q_INVOKABLE void setLl(const double ll);

    Q_INVOKABLE double getSph() const;
    Q_INVOKABLE void setSph(const double sph);

    Q_INVOKABLE const QString& getPhone() const;
    Q_INVOKABLE void setPhone(const QString phone);

    Q_INVOKABLE const QString& getPlacePhoto() const;
    Q_INVOKABLE void setPlacePhoto(const QString placePhoto);

    Q_INVOKABLE int getPriority() const;
    Q_INVOKABLE void setPriority(const int priority);

    Q_INVOKABLE void fromMap(const QVariantMap map);
    Q_INVOKABLE QVariantMap toMap() const;

private:
    int m_id;
    QString m_title;
    QString m_address;
    double m_ll;
    double m_sph;
    QString m_phone;
    QString m_placePhoto;
    int m_priority;

    void swap(const Place& place);
};

#endif /* PLACE_HPP_ */
