#include "vid.h"
///Private
/*  Creates video id for listing/sort function
 *
 *  int vid::create_id(){
}*
 */
///Public
//Constructors
vid::vid(QFileInfo* info){
    this->name=info->fileName().toStdString();
    this->link=info->absoluteFilePath().toStdString();
    //this->create_id();
}
//Getters
int vid::get_id(){
    return this->id;
}
string vid::get_link(){
    return this->link;
}
string vid::get_name(){
    return this->name;
}

