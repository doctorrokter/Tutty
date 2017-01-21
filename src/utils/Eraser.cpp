/*
 * Eraser.cpp
 *
 *  Created on: Jan 21, 2017
 *      Author: misha
 */

#include "Eraser.hpp"

void Eraser::deleteAll(QList<QObject*>& list) {
    for (int i = 0; i < list.size(); i++) {
        qDeleteAll(list.begin(), list.end());
    }
    list.clear();
}

