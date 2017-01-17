/*
 * BookmarksService.cpp
 *
 *  Created on: Jan 16, 2017
 *      Author: misha
 */

#include "BookmarksService.hpp"
#include <QDir>
#include <QVariant>
#include <QVariantMap>
#include <QFile>
#include <bb/data/JsonDataAccess>

using namespace bb::data;

BookmarksService::BookmarksService(QObject* parent) : QObject(parent) {
    restore();
}

BookmarksService::~BookmarksService() {
    for (int i = 0; i < m_bookmarks.size(); i++) {
        delete m_bookmarks.at(i);
    }
}

const QList<Film*> BookmarksService::getBookmarks() const { return m_bookmarks; }

void BookmarksService::add(Film* film) {
    if (!m_bookmarks.contains(film)) {
        m_bookmarks.append(film);
        save();
        emit bookmarksChanged(m_bookmarks);
    }
}

void BookmarksService::add(const QVariantMap filmMap) {
    Film* pFilm = new Film(this);
    pFilm->fromMap(filmMap);
    if (!m_bookmarks.contains(pFilm)) {
        m_bookmarks.append(pFilm);
        save();
        emit bookmarksChanged(m_bookmarks);
    } else {
        delete pFilm;
    }
}

void BookmarksService::remove(Film* film) {
    if (!m_bookmarks.contains(film)) {
        m_bookmarks.removeOne(film);
        save();
        emit bookmarksChanged(m_bookmarks);
    }
}

void BookmarksService::removeById(const int id) {
    for (int i = 0; i < m_bookmarks.size(); i++) {
        if (m_bookmarks.at(i)->getId() == id) {
            m_bookmarks.removeOne(m_bookmarks.at(i));
            save();
            emit bookmarksChanged(m_bookmarks);
        }
    }
}

QVariantList BookmarksService::getBookmarksMaps() {
    QVariantList list;
    for (int i = 0; i < m_bookmarks.size(); i++) {
        list.append(m_bookmarks.at(i)->toMap());
    }
    return list;
}

void BookmarksService::restore() {
    JsonDataAccess json;
    QFile file(QDir::currentPath() + "/data/bookmarks.json");
    if (file.exists()) {
        QVariant data = json.load(QDir::currentPath() + "/data/bookmarks.json");
            if (!json.hasError()) {
                QVariantList bookmarksList = data.toList();
                for (int i = 0; i < bookmarksList.size(); i++) {
                    Film* pFilm = new Film(this);
                    pFilm->fromMap(bookmarksList.at(i).toMap());
                    m_bookmarks.append(pFilm);
                }
                emit bookmarksChanged(m_bookmarks);
            }
    }
}

void BookmarksService::save() {
    QVariantList list = getBookmarksMaps();
    QFile file(QDir::currentPath() + "/data/bookmarks.json");

    QVariant dataToSave = QVariant(list);
    if (file.open(QIODevice::WriteOnly)) {
        JsonDataAccess json;
        json.save(dataToSave, &file);
    }
}

