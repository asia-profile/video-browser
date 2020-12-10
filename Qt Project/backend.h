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

public:
    explicit backend(QObject *parent = nullptr);
    //Function that can be called from QML file
    ///Video library
    Q_INVOKABLE QString getName(int index);
    Q_INVOKABLE int getNumberItems();
    Q_INVOKABLE bool isPlayable(int index);
    Q_INVOKABLE bool isFolder(int index);
    Q_INVOKABLE void grid_itemClick(int index);

    ///Player
    Q_INVOKABLE int getStatus();
    Q_INVOKABLE QMediaPlayer* getPlayer();
    Q_INVOKABLE void grid_playerClick(int index);
    Q_INVOKABLE QString getPlayer_link();
    //Slots
public slots:
    ///Player
    void play();
    void pause();
    void back();

private:
    //string link="C:\\Users\\SicSo\\Desktop\\University REPOS\\2811 User Interface\\2811GitlabRepo\\Videos";
    string link="/home/seanridgeon/UoL/Year 2/COMP2811 - User Interfaces/CW3/CW3 - Git Repo/Videos";
    player *p = new player();
    vidManagement *v = new vidManagement(this->link);
    string getLink(int index);
    QString player_link;
};

#endif // BACKEND_H
