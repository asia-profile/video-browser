#include "backend.h"

backend::backend(QObject *parent):

    QObject(parent){
    }
//Getters
QString backend::getName(int index){
    if(v->get_elem(index)->isFile())
       return QString::fromStdString(v->get_elem(index)->get_name());
    else
       return QString::fromStdString(v->get_elem(index)->get_vid()->get_name());
}
int backend::getStatus(){
   return this->p->get_state();
}
QMediaPlayer* backend::getPlayer(){
    return this->p->get_player();
}
int backend::getNumberItems(){
    return this->v->get_current_branch_size();
}
string backend::getLink(int index){
    return v->get_elem(index)->get_vid()->get_link();
}
bool backend::isFolder(int index){
    return this->v->get_elem(index)->isFile();
}
//Player functionality
void backend::start_player(int index){
    this->p->add(this->getLink(index));
    this->p->play();
}
void backend::play(){
    this->p->play();
}
void backend::pause(){
    this->p->pause();
}
void backend::back(){
    this->p->pause();
}


