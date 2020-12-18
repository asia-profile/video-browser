#include "backend.h"

backend::backend(QObject *parent):

    QObject(parent){
}
///Getters Main window
QString backend::getTitle_window(){
    return this->title_window;
}
///Player functionalities
QUrl backend::getPlayer_link(){
    return QUrl(this->player_link);
}
void backend::player_back(){
    this->pl->pause();
}
void backend::player_play(){
    this->pl->play();
}
void backend::player_pause(){
    this->pl->pause();
}
///Grid functionality
int backend::getNumberItems(){
    return this->v->get_current_branch_size();
}
QString backend::getName(int index){
    if(v->get_elem(index)->isFile())
       return QString::fromStdString(v->get_elem(index)->get_name());
    else
       return QString::fromStdString(v->get_elem(index)->get_vid()->get_name());
}
void backend::grid_itemClick(int index){
    if(this->isFolder(index)){
        this->v->add_branch(this->v->get_elem(index));
    }
    else{

    }
}
void backend::grid_item_select(QString standard, QString selected, int index){
    QObject* o = this->root->findChild<QObject*>("MainGrid");
    QQuickItem * k = o->property("contentItem").value<QQuickItem *>();
    auto items = k->childItems();
    for(int i =0;i<items.size()-1;i++)
        if(items.at(i)->findChild<QObject*>("RectContainer")->property("color").
                toString()==selected)
            items.at(i)->findChild<QObject*>("RectContainer")->setProperty("color",standard);
    items.at(index)->findChild<QObject*>("RectContainer")->setProperty("color",selected);
}
void backend::grid_playerClick(int index){
    this->player_link = QString::fromStdString(this->getLink(index));
    this->pl->add("file://" + this->getLink(index));
    this->pl->play();
    this->pl->pause();
    this->pl->play();
}
///General Functionality
string backend::getLink(int index){
    return v->get_elem(index)->get_vid()->get_link();
}
bool backend::isPlayable(int index){
    return !(this->v->get_elem(index)->isFile());
}
bool backend::isFolder(int index){
    return this->v->get_elem(index)->isFile();
}
void backend::setRoot(QObject* obj){
    this->root = obj;
}
void backend::setPlayer(QObject* obj){
    this->pl->setPlayer(qvariant_cast<QMediaPlayer *>(obj->findChild<QObject*>("MainPlayer")
                                                      ->property("mediaObject")));
}



