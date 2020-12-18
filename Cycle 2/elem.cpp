#include "elem.h"
#include <QFileInfo>
///Private
void elem::create_vid(){
    QFileInfo* info = new QFileInfo
    (QString::fromStdString(this->link));
    this->v= new vid(info);
    delete(info);
}
///Public
//Constructors
elem::elem(bool file, string link, int branch,int index_prev, elem* adress,int index){
    this->file=file;
    this->link=link;
    this->index = index;
    this->prev.index=index_prev;
    this->prev.branch=branch;
    this->prev.adress=adress;
    if(!file)
        this->create_vid();
    else{
        QFileInfo* info = new QFileInfo(QString::fromStdString(this->link));
        this->name = info->fileName().toStdString();
        this->v=NULL;
        delete(info);
    }
}
elem::elem(bool file, string link){
    this->file=file;
    this->link=link;
    this->prev.index=0;
    this->prev.adress=NULL;
    if(!file)
        this->create_vid();
    else{
        QFileInfo* info = new QFileInfo(QString::fromStdString(this->link));
        this->name = info->fileName().toStdString();
        this->v=NULL;
        delete(info);
    }
}
//Getters
int elem::get_index_prev(){
    return this->prev.index;
}
int elem::get_branch_next(){
    return this->next.branch;
}
int elem::get_branch_prev(){
    return this->prev.branch;
}
vector<elem*>* elem::get_adress_next(){
    return this->next.adress;
}
elem* elem::get_adress_prev(){
    return this->prev.adress;
}
vid* elem::get_vid(){
    return this->v;
}
string elem::get_link(){
    return this->link;
}
int elem::get_index(){
    return this->index;
}
string elem::get_name(){
    return this->name;
}
//Setters
void elem::set_branch_next(int branch){
this->next.branch=branch;
}
void elem::set_adress_next(vector<elem*>* adress){
    this->next.adress=adress;
}
void elem::set_index(int index){
    this->index = index;
}
//Checkers
bool elem::isFile(){
    return this->file;
}
