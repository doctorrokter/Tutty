/*
 * Film.hpp
 *
 *  Created on: Dec 6, 2016
 *      Author: misha
 */

#ifndef FILM_HPP_
#define FILM_HPP_

#include <QtCore/QObject>
#include <QList>
#include <QVariantMap>
#include <QVariantList>
#include "Comment.hpp"
#include "TuttyEvent.hpp"

class Film: public TuttyEvent {
    Q_OBJECT
    Q_PROPERTY(QString actors READ getActors WRITE setActors NOTIFY actorsChanged)
    Q_PROPERTY(QString director READ getDirector WRITE setDirector NOTIFY directorChanged)
    Q_PROPERTY(int year READ getYear WRITE setYear NOTIFY yearChanged)
    Q_PROPERTY(QString country READ getCountry WRITE setCountry NOTIFY countryChanged)
    Q_PROPERTY(int duration READ getDuration WRITE setDuration NOTIFY durationChanged)
    Q_PROPERTY(bool isPremiere READ isPremiere WRITE setIsPremiere NOTIFY isPremiereChanged)
    Q_PROPERTY(int premiereAt READ getPremiereAt WRITE setPremiereAt NOTIFY premiereAtChanged)
    Q_PROPERTY(bool threeD READ isThreeD WRITE setThreeD NOTIFY isThreeDChanged)
    Q_PROPERTY(QString video READ getVideo WRITE setVideo NOTIFY videoChanged)
    Q_PROPERTY(QString genres READ getGenres WRITE setGenres NOTIFY genresChanged)
    Q_PROPERTY(QString restriction READ getRestriction WRITE setRestriction NOTIFY restrictionChanged)
    Q_PROPERTY(int timeLeft READ getTimeLeft WRITE setTimeLeft NOTIFY timeLeftChanged)
    Q_PROPERTY(QString rate READ getRate WRITE setRate NOTIFY rateChanged)
    Q_PROPERTY(QString rateTen READ getRateTen WRITE setRateTen NOTIFY rateTenChanged)
    Q_PROPERTY(QString rateImdb READ getRateImdb WRITE setRateImdb NOTIFY rateImdbChanged)
    Q_PROPERTY(QString rateKinopoisk READ getRateKinopoisk WRITE setRateKinopoisk NOTIFY rateKinopoiskChanged)
    Q_PROPERTY(QList<Comment*> comments READ getComments WRITE setComments NOTIFY commentsChanged)

public:
    Film(QObject* parent = 0);
    Film(const Film& film);
    virtual ~Film();

    Film& operator=(const Film& film);
    bool operator==(const Film& film);

    Q_INVOKABLE const QString& getActors() const;
    Q_INVOKABLE void setActors(const QString actors);

    Q_INVOKABLE const QString& getDirector() const;
    Q_INVOKABLE void setDirector(const QString director);

    Q_INVOKABLE int getYear() const;
    Q_INVOKABLE void setYear(const int year);

    Q_INVOKABLE const QString& getCountry() const;
    Q_INVOKABLE void setCountry(const QString country);

    Q_INVOKABLE int getDuration() const;
    Q_INVOKABLE void setDuration(const int duration);

    Q_INVOKABLE bool isPremiere() const;
    Q_INVOKABLE void setIsPremiere(const bool isPremiere);

    Q_INVOKABLE int getPremiereAt() const;
    Q_INVOKABLE void setPremiereAt(const int premiereAt);

    Q_INVOKABLE bool isThreeD() const;
    Q_INVOKABLE void setThreeD(const bool threeD);

    Q_INVOKABLE const QString& getVideo() const;
    Q_INVOKABLE void setVideo(const QString video);

    Q_INVOKABLE const QString& getGenres() const;
    Q_INVOKABLE void setGenres(const QString genres);

    Q_INVOKABLE const QString& getRestriction() const;
    Q_INVOKABLE void setRestriction(const QString restriction);

    Q_INVOKABLE int getTimeLeft() const;
    Q_INVOKABLE void setTimeLeft(const int timeLeft);

    Q_INVOKABLE const QString& getRate() const;
    Q_INVOKABLE void setRate(const QString rate);

    Q_INVOKABLE const QString& getRateTen() const;
    Q_INVOKABLE void setRateTen(const QString rateTen);

    Q_INVOKABLE const QString& getRateImdb() const;
    Q_INVOKABLE void setRateImdb(const QString rateImdb);

    Q_INVOKABLE const QString& getRateKinopoisk() const;
    Q_INVOKABLE void setRateKinopoisk(const QString rateKinopoisk);

    Q_INVOKABLE QList<Comment*> getComments() const;
    Q_INVOKABLE QVariantList getCommentsMaps() const;
    Q_INVOKABLE void setComments(const QList<Comment*> comments);
    Q_INVOKABLE void appendComments(const QList<Comment*> comments);

    Q_INVOKABLE void fromMap(const QVariantMap map);
    Q_INVOKABLE QVariantMap toMap() const;

Q_SIGNALS:
    void actorsChanged(const QString& actors);
    void directorChanged(const QString& director);
    void yearChanged(const int year);
    void countryChanged(const QString& country);
    void durationChanged(const int duration);
    void isPremiereChanged(const bool isPremiere);
    void premiereAtChanged(const long premiereAt);
    void isThreeDChanged(const bool isThreeD);
    void videoChanged(const QString& video);
    void genresChanged(const QString& genres);
    void restrictionChanged(const QString& restriction);
    void timeLeftChanged(const int timeLeft);
    void rateChanged(const QString& rate);
    void rateTenChanged(const QString& rateTen);
    void rateImdbChanged(const QString& rateImdb);
    void rateKinopoiskChanged(const QString& rateKinopoisk);
    void commentsChanged(const QList<Comment*>& comments);

private:
    QString m_actors;
    QString m_director;
    int m_year;
    QString m_country;
    int m_duration;
    bool m_isPremiere;
    int m_premiereAt;
    bool m_threeD;
    QString m_video;
    QString m_genres;
    QString m_restriction;
    int m_timeLeft;
    QString m_rate;
    QString m_rateTen;
    QString m_rateImdb;
    QString m_rateKinopoisk;
    QList<Comment*> m_comments;

    void swap(const Film& film);
};

#endif /* FILM_HPP_ */
