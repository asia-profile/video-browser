#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <qqml.h>
#include <string>
#include <iostream>
#include <QQuickItem>
#include "vidmanagement.h"
#include "player.h"

class backend : public QObject
{
    Q_OBJECT

public:
    explicit backend(QObject *parent = nullptr);
    //Function that can be called from QML file
    ///Video library functionality
    Q_INVOKABLE QString getName(int index);
    Q_INVOKABLE int getNumberItems();
    Q_INVOKABLE bool isPlayable(int index);
    Q_INVOKABLE bool isFolder(int index);
    Q_INVOKABLE void grid_itemClick(int index);
    Q_INVOKABLE void grid_item_select(QString standard, QString selected, int index);
    ///Player functionality
    Q_INVOKABLE void grid_playerClick(int index);
    Q_INVOKABLE QUrl getPlayer_link();
    Q_INVOKABLE void player_play();
    Q_INVOKABLE void player_pause();
    Q_INVOKABLE void player_back();
    ///General functionality
    Q_INVOKABLE QString getTitle_window();
    void setRoot(QObject* obj);
    void setPlayer(QObject* obj);
    //Slots
public slots:
private:
    //The adress of the mian window
    QObject* root;
    //Main player object
    player* pl = new player();
    //The link to the main folder
    //string link="C:\\Users\\SicSo\\Desktop\\University REPOS\\2811 User Interface\\2811GitlabRepo\\Videos";
    string link="/home/seanridgeon/UoL/Year 2/COMP2811 - User Interfaces/CW3/CW3 - Git Repo/Videos";
    //Vidmanegemnt object
    vidManagement *v = new vidManagement(this->link);
    //The link of the slected video
    QString player_link;
    //The title of the window
    QString title_window="Ipad interface";
    //Backend functionality
    string getLink(int index);
};

#endif // BACKEND_H
