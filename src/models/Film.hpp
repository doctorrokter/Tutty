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

class Film: public QObject {
    Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId)
    Q_PROPERTY(QString name READ getName WRITE setName)
    Q_PROPERTY(QString description READ getDescription WRITE setDescription)
    Q_PROPERTY(QString actors READ getActors WRITE setActors)
    Q_PROPERTY(QString director READ getDirector WRITE setDirector)
    Q_PROPERTY(QString image READ getImage WRITE setImage)
    Q_PROPERTY(int year READ getYear WRITE setYear)
    Q_PROPERTY(QString country READ getCountry WRITE setCountry)
    Q_PROPERTY(int duration READ getDuration WRITE setDuration)
    Q_PROPERTY(bool isPremiere READ isPremiere WRITE setIsPremiere)
    Q_PROPERTY(int premiereAt READ getPremiereAt WRITE setPremiereAt)
    Q_PROPERTY(bool threeD READ isThreeD WRITE setThreeD)
    Q_PROPERTY(QString video READ getVideo WRITE setVideo)
    Q_PROPERTY(QString genres READ getGenres WRITE setGenres)
    Q_PROPERTY(QString restriction READ getRestriction WRITE setRestriction)
    Q_PROPERTY(QList<QString> images READ getImages WRITE setImages)
    Q_PROPERTY(int timeLeft READ getTimeLeft WRITE setTimeLeft)
    Q_PROPERTY(int commentCnt READ getCommentsCnt WRITE setCommentsCnt)
    Q_PROPERTY(float rate READ getRate WRITE setRate)
    Q_PROPERTY(float rateTen READ getRateTen WRITE setRateTen)
    Q_PROPERTY(float rateImdb READ getRateImdb WRITE setRateImdb)
    Q_PROPERTY(float rateKinopoisk READ getRateKinopoisk WRITE setRateKinopoisk)
    Q_PROPERTY(QString url READ getUrl WRITE setUrl)

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
    Q_INVOKABLE void setImages(const QList<QString> images);

    Q_INVOKABLE int getTimeLeft() const;
    Q_INVOKABLE void setTimeLeft(const int timeLeft);

    Q_INVOKABLE int getCommentsCnt() const;
    Q_INVOKABLE void setCommentsCnt(const int commentsCnt);

    Q_INVOKABLE float getRate() const;
    Q_INVOKABLE void setRate(const float rate);

    Q_INVOKABLE float getRateTen() const;
    Q_INVOKABLE void setRateTen(const float rateTen);

    Q_INVOKABLE float getRateImdb() const;
    Q_INVOKABLE void setRateImdb(const float rateImdb);

    Q_INVOKABLE float getRateKinopoisk() const;
    Q_INVOKABLE void setRateKinopoisk(const float rateKinopoisk);

    Q_INVOKABLE const QString& getUrl() const;
    Q_INVOKABLE void setUrl(const QString url);

    Q_INVOKABLE void fromMap(const QVariantMap map);
    Q_INVOKABLE QVariantMap toMap() const;

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
    float m_rate;
    float m_rateTen;
    float m_rateImdb;
    float m_rateKinopoisk;
    QString m_url;

    void swap(const Film& film);
};

#endif /* FILM_HPP_ */
