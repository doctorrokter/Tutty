/*
 * Session.hpp
 *
 *  Created on: Dec 20, 2016
 *      Author: misha
 */

#ifndef SESSION_HPP_
#define SESSION_HPP_

#include <QtCore/QObject>
#include <QVariantMap>

class Session: public QObject {
    Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(int sessionTime READ getSessionTime WRITE setSessionTime NOTIFY sessionTimeChanged)
    Q_PROPERTY(int bycardSessionId READ getBycardSessionId WRITE setBycardSessionId NOTIFY bycardSessionIdChanged)
    Q_PROPERTY(QString price READ getPrice WRITE setPrice NOTIFY priceChanged)
    Q_PROPERTY(bool ticketsAvailable READ isTicketsAvailable WRITE setTicketsAvailable NOTIFY ticketsAvailableChanged)
    Q_PROPERTY(QString buyTicketUrl READ getBuyTicketUrl WRITE setBuyTicketUrl NOTIFY buyTicketUrlChanged)
    Q_PROPERTY(bool threeD READ isThreeD WRITE setThreeD NOTIFY threeDChanged)
    Q_PROPERTY(QString ticket READ getTicket WRITE setTicket NOTIFY ticketChanged)

public:
    Session(QObject* parent = 0);
    Session(const Session& session);
    virtual ~Session();

    Session& operator=(const Session& session);
    bool operator==(const Session& session);

    Q_INVOKABLE int getId() const;
    Q_INVOKABLE void setId(const int id);

    Q_INVOKABLE int getSessionTime() const;
    Q_INVOKABLE void setSessionTime(const int sessionTime);

    Q_INVOKABLE int getBycardSessionId() const;
    Q_INVOKABLE void setBycardSessionId(const int bycardSessionId);

    Q_INVOKABLE const QString& getPrice() const;
    Q_INVOKABLE void setPrice(const QString price);

    Q_INVOKABLE bool isTicketsAvailable() const;
    Q_INVOKABLE void setTicketsAvailable(const bool ticketsAvailable);

    Q_INVOKABLE const QString& getBuyTicketUrl() const;
    Q_INVOKABLE void setBuyTicketUrl(const QString buyTicketUrl);

    Q_INVOKABLE bool isThreeD() const;
    Q_INVOKABLE void setThreeD(const bool threeD);

    Q_INVOKABLE const QString& getTicket() const;
    Q_INVOKABLE void setTicket(const QString ticket);

    Q_INVOKABLE void fromMap(const QVariantMap map);
    Q_INVOKABLE QVariantMap toMap();

Q_SIGNALS:
    void idChanged(int id);
    void sessionTimeChanged(int sessionTime);
    void bycardSessionIdChanged(int bycardSessionId);
    void priceChanged(QString& price);
    void ticketsAvailableChanged(bool ticketsAvailable);
    void buyTicketUrlChanged(QString& buyTicketUrl);
    void threeDChanged(bool threeD);
    void ticketChanged(const QString ticket);

private:
    int m_id;
    int m_sessionTime;
    int m_bycardSessionId;
    QString m_price;
    bool m_ticketsAvailable;
    QString m_buyTicketUrl;
    bool m_threeD;
    QString m_ticket;

    void swap(const Session& session);
};

#endif /* SESSION_HPP_ */
