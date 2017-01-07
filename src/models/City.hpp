/*
 * City.hpp
 *
 *  Created on: Jan 7, 2017
 *      Author: misha
 */

#ifndef CITY_HPP_
#define CITY_HPP_

#include <QtCore/QObject>
#include <QVariantMap>

class City : public QObject {
    Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString code READ getCode WRITE setCode NOTIFY codeChanged)
    Q_PROPERTY(QString title READ getTitle WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(bool isCapitalCity READ isCapitalCity WRITE setCapitalCity NOTIFY capitalCityChanged)
    Q_PROPERTY(int idCapitalCity READ getIdCapitalCity WRITE setIdCapitalCity NOTIFY idCapitalCityChanged)

public:
    City(QObject* parent = 0);
    City(const City& city);
    virtual ~City();

    City& operator=(const City& city);
    bool operator==(const City& city);

    Q_INVOKABLE int getId() const;
    Q_INVOKABLE void setId(const int id);

    Q_INVOKABLE const QString& getCode() const;
    Q_INVOKABLE void setCode(const QString code);

    Q_INVOKABLE const QString& getTitle() const;
    Q_INVOKABLE void setTitle(const QString title);

    Q_INVOKABLE bool isCapitalCity() const;
    Q_INVOKABLE void setCapitalCity(const bool isCapitalCity);

    Q_INVOKABLE int getIdCapitalCity() const;
    Q_INVOKABLE void setIdCapitalCity(const int idCapitalCity);

    Q_INVOKABLE void fromMap(const QVariantMap cityMap);
    Q_INVOKABLE QVariantMap toMap() const;

Q_SIGNALS:
    void idChanged(const int id);
    void codeChanged(const QString& code);
    void titleChanged(const QString& title);
    void capitalCityChanged(const bool isCapitalCity);
    void idCapitalCityChanged(const int idCapitalCity);

private:
    int m_id;
    QString m_code;
    QString m_title;
    bool m_isCapitalCity;
    int m_idCapitalCity;

    void swap(const City& city);
};

#endif /* CITY_HPP_ */
