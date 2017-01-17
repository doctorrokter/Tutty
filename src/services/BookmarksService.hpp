/*
 * BookmarksService.hpp
 *
 *  Created on: Jan 16, 2017
 *      Author: misha
 */

#ifndef BOOKMARKSSERVICE_HPP_
#define BOOKMARKSSERVICE_HPP_

#include <QtCore/QObject>
#include <QVariantList>
#include <QList>
#include "../models/Film.hpp"

class BookmarksService: public QObject {
    Q_OBJECT
    Q_PROPERTY(QList<Film*> bookmarks READ getBookmarks NOTIFY bookmarksChanged)

public:
    BookmarksService(QObject* parent = 0);
    virtual ~BookmarksService();

    Q_INVOKABLE const QList<Film*> getBookmarks() const;

    Q_INVOKABLE void add(Film* film);
    Q_INVOKABLE void add(const QVariantMap filmMap);
    Q_INVOKABLE void remove(Film* film);

    Q_INVOKABLE void removeById(const int id);
    Q_INVOKABLE QVariantList getBookmarksMaps();

    void restore();

Q_SIGNALS:
    void bookmarksChanged(const QList<Film*>& bookmarks);

private:
    QList<Film*> m_bookmarks;

    void save();
};

#endif /* BOOKMARKSSERVICE_HPP_ */
