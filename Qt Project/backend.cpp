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
bool backend::isPlayable(int index){
    return !(this->v->get_elem(index)->isFile());
}
bool backend::isFolder(int index){
    return this->v->get_elem(index)->isFile();
}
void backend::grid_itemClick(int index){
    if(this->isFolder(index)){
        this->v->add_branch(this->v->get_elem(index));
    }
    else{

    }
}
//Player functionality
string backend::grid_playerClick(int index){
    return this->getLink(index);

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


