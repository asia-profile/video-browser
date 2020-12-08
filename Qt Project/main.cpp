#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlComponent>
#include "backend.h"
/*

void create_library(backend* b, QObject *obj){
    for(int i=0;i<b->getNumberItems();i++){
        QObject *rect = obj->findChild<QObject*>("vid"+to_string(i));
        b->getName(i);
    }
}
*/
void signal_slots(backend* b, QObject *obj){



    ///Signals and slots
    int index;

    QObject *item = NULL;
   /*
    QObject::connect(item, SIGNAL(qmlSignal(QString)),
                        b, SLOT(start_playing(index)));
    QObject::connect(item, SIGNAL(qmlSignal(QString))),
                        b, SLOT(play()));
    QObject::connect(item, SIGNAL(qmlSignal(QString))),
                        b, SLOT(pause());
    QObject::connect(item, SIGNAL(qmlSignal(QString))),
                        b, SLOT(back());
                        */
}


int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //Backend instance
    backend* b = new backend();
    //QML Instance
    QQmlEngine engine2;
    QQmlComponent component(&engine2, QUrl::fromLocalFile("qrc:/main.qml"));
    QObject *object = component.create();

    //Include c++ backend in QML
    qmlRegisterType<backend>("io.qt.examples.BackEnd", 1, 0, "BackEnd");

    //??????
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    //Create library
    //create_library(b,object);
    //Signals and slots
    //signal_slots(b,object);


    return app.exec();
}
