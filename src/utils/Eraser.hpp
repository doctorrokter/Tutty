/*
 * Eraser.hpp
 *
 *  Created on: Jan 21, 2017
 *      Author: misha
 */

#ifndef ERASER_HPP_
#define ERASER_HPP_

#include <QList>
#include <QtCore/QObject>

class Eraser {
public:
    static void deleteAll(QList<QObject*>& list);
};

#endif /* ERASER_HPP_ */
