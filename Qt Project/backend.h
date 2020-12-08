#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <qqml.h>
#include <string>
#include <iostream>
#include "vidmanagement.h"
#include "player.h"

class backend : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QString userName READ userName WRITE setName NOTIFY userNameChanged)
    //QML_ELEMENT

public:
    explicit backend(QObject *parent = nullptr);
    //Function that can be called from QML file
    ///Video library
    Q_INVOKABLE QString getName(int index);
    Q_INVOKABLE int getNumberItems();
    ///Player
    Q_INVOKABLE int getStatus();
    Q_INVOKABLE QMediaPlayer* getPlayer();
    //Slots
public slots:
    ///Player
    void start_player(int index);
    void play();
    void pause();
    void back();

private:
    string link="C:\\Users\\SicSo\\Desktop\\University REPOS\\2811 User Interface\\2811v2\\Videos";
    player *p = new player();
    vidManagement *v = new vidManagement(this->link);
    string getLink(int index);
};

#endif // BACKEND_H
