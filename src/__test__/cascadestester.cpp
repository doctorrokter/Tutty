/*
 * cascadestester.cpp
 *
 *  Created on: Jan 11, 2017
 *      Author: misha
 */

#include "cascadestester.hpp"

#include <bb/cascades/Application>

#include <QtTest/QTest>

CascadesTester::CascadesTester(QObject *object, int argc, char **argv) : m_object(object), m_argc(argc), m_argv(argv) {}

void CascadesTester::startTest()
{
    // Start the unit test
    const int result = QTest::qExec(m_object, m_argc, m_argv);

    // Terminate application
    bb::cascades::Application::exit(result);
}


