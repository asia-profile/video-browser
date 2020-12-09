#include "vidmanagement.h"
#include <QtCore/QFileInfo>
#include <QtCore/QDir>
#include <QtCore/QDirIterator>
#include "elem.h"
#include <vector>
#include <iostream>

///Public
vidManagement::vidManagement(string link){
    this->branch=0;
    this->main_link=link;
    this->create_branch(link,NULL,-1,-1);
}
void vidManagement::create_branch(string link, elem* adress, int branch, int index){
    QDir dir(QString::fromStdString(link));
    QDirIterator it(dir);
    this->items.push_back(new vector<elem*>());
    while(it.hasNext()){
        QString f = it.next();
        if (f.contains(".")){
            if (f.contains(".wmv") || f.contains(".mp4") || f.contains(".MOV" )){
                this->items[this->branch]->push_back(new elem(false, f.toStdString(), branch, index, adress, this->items[this->branch]->size()-1));
            }
        }
        else{
            this->items[this->branch]->push_back(new elem(true, f.toStdString(), branch, index, adress, this->items[this->branch]->size()-1));
        }
    }
    this->branch++;
}
void vidManagement::add_branch(elem* adress){
    this->create_branch(adress->get_link(), adress, this->branch-1, adress->get_index());
    adress->set_adress_next(this->items.at(this->branch-1));
    adress->set_branch_next(this->branch);
}

void vidManagement::remove_branch(){
    this->items.at(this->branch)->at(0)->get_adress_prev()->set_adress_next(NULL);
    this->items.at(this->branch)->at(0)->get_adress_prev()->set_branch_next(-1);
    this->items.pop_back();
    this->branch--;
}
int vidManagement::get_branch_size(int index){
    return this->items[index]->size();
}
int vidManagement::get_current_branch_size(){
    return this->get_branch_size(this->items.size()-1);
}
elem* vidManagement::get_elem(int index){
    return this->items[this->items.size()-1]->at(index);
}
string vidManagement::get_link(){
    return this->main_link;
}
