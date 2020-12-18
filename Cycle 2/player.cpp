#include "player.h"
#include <QUrl>
//Constructors
player::player(){
    this->url=NULL;
    this->state = 0;
}

player::player(string url){
    this->add(url);
    this->state = 0;
}

void player::setPlayer(QMediaPlayer* q){
    this->q = q;
}
int player::get_state(){
    return this->state;
}
QMediaPlayer* player::get_player(){
    return this->q;
}
void player::add(string url){
    this->url=new QUrl(QString::fromStdString(url));
    this->q->setMedia(*this->url);
}
void player::play(){
    if(this->url!=NULL){
        if(this->state!=1){
            this->state = 1;
            q->play();
        }
    }
}
void player::pause(){
    if(this->url!=NULL){
        if(this->state!=0){
            this->state = 0;
            q->pause();
        }
    }
}
