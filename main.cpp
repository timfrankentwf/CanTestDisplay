#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QtDebug>
#include <QCanBus>
#include <QProcess>
#include "process.h"
//#include "wiringPi.h"

void ISR(void)
{
    qDebug("ISR triggered");
    //delay(1000);
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<Process>("Process", 1, 0, "Process");


    //wiringPiSetupGpio();
    //wiringPiISR(25,INT_EDGE_FALLING,&ISR);


    if (QCanBus::instance()->plugins().contains(QStringLiteral("socketcan"))) {
        // plugin available
        qDebug() << "SocketCAN plugin available";
    }
    QString errorString;
    QCanBusDevice *device = QCanBus::instance()->createDevice(
        QStringLiteral("socketcan"), QStringLiteral("can0"), &errorString);
    if (!device) {
        // Error handling goes here
        qDebug() << errorString;
    } else {
        device->connectDevice();
        qDebug() << device;
    }




    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}


