/*
 * FilmsServiceSpec.hpp
 *
 *  Created on: Jan 11, 2017
 *      Author: misha
 */

#ifndef FILMSSERVICESPEC_HPP_
#define FILMSSERVICESPEC_HPP_

#include <QtCore/QObject>

class FilmsServiceSpec : public QObject {
    Q_OBJECT

private slots:
    void test1();
    void test2();
};

#endif /* FILMSSERVICESPEC_HPP_ */
