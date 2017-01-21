/*
 * Calendar.cpp
 *
 *  Created on: Jan 21, 2017
 *      Author: misha
 */

#include "Calendar.hpp"
#include <bb/pim/calendar/CalendarEvent>

Calendar::Calendar(QObject* parent) :QObject(parent) {}

Calendar::~Calendar() {
    delete m_calendarService;
    m_calendarService = NULL;
}

void Calendar::createEvent(const QString& name, const QString& body, QDateTime dateTime) {
    CalendarEvent ev;
    ev.setAccountId(1);
    ev.setFolderId(1);
    ev.setStartTime(dateTime);
    ev.setEndTime(dateTime.addSecs(7200));
    ev.setReminder(120);
    ev.setSubject(name);
    ev.setBody(body);

    m_calendarService->createEvent(ev);

    emit eventCreated();
}

