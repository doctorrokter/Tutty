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

class Film: public QObject {
    Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString description READ getDescription WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(QString actors READ getActors WRITE setActors NOTIFY actorsChanged)
    Q_PROPERTY(QString director READ getDirector WRITE setDirector NOTIFY directorChanged)
    Q_PROPERTY(QString image READ getImage WRITE setImage NOTIFY imageChanged)
    Q_PROPERTY(int year READ getYear WRITE setYear NOTIFY yearChanged)
    Q_PROPERTY(QString country READ getCountry WRITE setCountry NOTIFY countryChanged)
    Q_PROPERTY(int duration READ getDuration WRITE setDuration NOTIFY durationChanged)
    Q_PROPERTY(bool isPremiere READ isPremiere WRITE setIsPremiere NOTIFY isPremiereChanged)
    Q_PROPERTY(int premiereAt READ getPremiereAt WRITE setPremiereAt NOTIFY premiereAtChanged)
    Q_PROPERTY(bool threeD READ isThreeD WRITE setThreeD NOTIFY isThreeDChanged)
    Q_PROPERTY(QString video READ getVideo WRITE setVideo NOTIFY videoChanged)
    Q_PROPERTY(QString genres READ getGenres WRITE setGenres NOTIFY genresChanged)
    Q_PROPERTY(QString restriction READ getRestriction WRITE setRestriction NOTIFY restrictionChanged)
    Q_PROPERTY(QList<QString> images READ getImages WRITE setImages NOTIFY imagesChanged)
    Q_PROPERTY(int timeLeft READ getTimeLeft WRITE setTimeLeft NOTIFY timeLeftChanged)
    Q_PROPERTY(int commentsCnt READ getCommentsCnt WRITE setCommentsCnt NOTIFY commentsCntChanged)
    Q_PROPERTY(QString rate READ getRate WRITE setRate NOTIFY rateChanged)
    Q_PROPERTY(QString rateTen READ getRateTen WRITE setRateTen NOTIFY rateTenChanged)
    Q_PROPERTY(QString rateImdb READ getRateImdb WRITE setRateImdb NOTIFY rateImdbChanged)
    Q_PROPERTY(QString rateKinopoisk READ getRateKinopoisk WRITE setRateKinopoisk NOTIFY rateKinopoiskChanged)
    Q_PROPERTY(QString url READ getUrl WRITE setUrl NOTIFY urlChanged)
    Q_PROPERTY(QList<Comment*> comments READ getComments WRITE setComments NOTIFY commentsChanged)

public:
    Film(QObject* parent = 0);
    Film(const Film& film);
    virtual ~Film();

    Film& operator=(const Film& film);
    bool operator==(const Film& film);

    Q_INVOKABLE int getId() const;
    Q_INVOKABLE void setId(const int id);

    Q_INVOKABLE const QString& getName() const;
    Q_INVOKABLE void setName(const QString name);

    Q_INVOKABLE const QString& getDescription() const;
    Q_INVOKABLE void setDescription(const QString description);

    Q_INVOKABLE const QString& getActors() const;
    Q_INVOKABLE void setActors(const QString actors);

    Q_INVOKABLE const QString& getDirector() const;
    Q_INVOKABLE void setDirector(const QString director);

    Q_INVOKABLE const QString& getImage() const;
    Q_INVOKABLE void setImage(const QString image);

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

    Q_INVOKABLE const QList<QString>& getImages() const;
    Q_INVOKABLE void setImages(const QList<QString>& images);

    Q_INVOKABLE int getTimeLeft() const;
    Q_INVOKABLE void setTimeLeft(const int timeLeft);

    Q_INVOKABLE int getCommentsCnt() const;
    Q_INVOKABLE void setCommentsCnt(const int commentsCnt);

    Q_INVOKABLE const QString& getRate() const;
    Q_INVOKABLE void setRate(const QString rate);

    Q_INVOKABLE const QString& getRateTen() const;
    Q_INVOKABLE void setRateTen(const QString rateTen);

    Q_INVOKABLE const QString& getRateImdb() const;
    Q_INVOKABLE void setRateImdb(const QString rateImdb);

    Q_INVOKABLE const QString& getRateKinopoisk() const;
    Q_INVOKABLE void setRateKinopoisk(const QString rateKinopoisk);

    Q_INVOKABLE const QString& getUrl() const;
    Q_INVOKABLE void setUrl(const QString url);

    Q_INVOKABLE QList<Comment*> getComments() const;
    Q_INVOKABLE QVariantList getCommentsMaps() const;
    Q_INVOKABLE void setComments(const QList<Comment*> comments);
    Q_INVOKABLE void appendComments(const QList<Comment*> comments);

    Q_INVOKABLE void fromMap(const QVariantMap map);
    Q_INVOKABLE QVariantMap toMap() const;

    Q_INVOKABLE QVariantList imagesToQVList() const;

Q_SIGNALS:
    void idChanged(const int id);
    void nameChanged(const QString& name);
    void descriptionChanged(const QString& description);
    void actorsChanged(const QString& actors);
    void directorChanged(const QString& director);
    void imageChanged(const QString& image);
    void yearChanged(const int year);
    void countryChanged(const QString& country);
    void durationChanged(const int duration);
    void isPremiereChanged(const bool isPremiere);
    void premiereAtChanged(const long premiereAt);
    void isThreeDChanged(const bool isThreeD);
    void videoChanged(const QString& video);
    void genresChanged(const QString& genres);
    void restrictionChanged(const QString& restriction);
    void imagesChanged(const QList<QString>& images);
    void timeLeftChanged(const int timeLeft);
    void commentsCntChanged(const int commentsCnt);
    void rateChanged(const QString& rate);
    void rateTenChanged(const QString& rateTen);
    void rateImdbChanged(const QString& rateImdb);
    void rateKinopoiskChanged(const QString& rateKinopoisk);
    void urlChanged(const QString& url);
    void commentsChanged(const QList<Comment*>& comments);

private:
    int m_id;
    QString m_name;
    QString m_description;
    QString m_actors;
    QString m_director;
    QString m_image;
    int m_year;
    QString m_country;
    int m_duration;
    bool m_isPremiere;
    int m_premiereAt;
    bool m_threeD;
    QString m_video;
    QString m_genres;
    QString m_restriction;
    QList<QString> m_images;
    int m_timeLeft;
    int m_commentsCnt;
    QString m_rate;
    QString m_rateTen;
    QString m_rateImdb;
    QString m_rateKinopoisk;
    QString m_url;
    QList<Comment*> m_comments;

    void swap(const Film& film);
};

#endif /* FILM_HPP_ */
