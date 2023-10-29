#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "veraclient.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<VeraClient> ("VeraPackage", 1, 0, "VeraClient"); // Only created when loaded on page

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Vera/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
