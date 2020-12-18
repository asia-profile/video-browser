#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QMediaPlayer>
#include <QObject>
#include <QQmlComponent>
#include <QQmlContext>
#include "backend.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    backend* b = new backend();
    b->setRoot(engine.rootObjects().at(0));
    b->setPlayer(engine.rootObjects().at(0));
    QQmlContext* context = engine.rootContext();
    context->setContextProperty("backend",b);

    return app.exec();
}

