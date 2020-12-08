#ifndef PLAYER_H
#define PLAYER_H
#include <string>
#include <QMediaPlayer>
#include <QUrl>
using namespace std;
class player
{
private:
    QMediaPlayer* q= new QMediaPlayer();
    int state;
    QUrl *url;
public:
    player();
    player(string url);
    int get_state();
    QMediaPlayer* get_player();
    void add(string url);
    void play();
    void pause();
};

#endif // PLAYER_H
