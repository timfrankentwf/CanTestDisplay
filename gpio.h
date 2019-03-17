#ifndef GPIO_H
    #define GPIO_H
#endif // GPIO_H

#include <QVariant>
#include "wiringPi.h"

class GPIO : public QObject {
    Q_OBJECT

    public:
        GPIO(QObject *parent = nullptr) : QObject(parent) { }

        Q_INVOKABLE QByteArray GPIOdigitalRead(const QString pin) {
    }
};
