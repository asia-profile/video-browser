#ifndef VID_H
#define VID_H
#include <string>
#include <QFileInfo>
using namespace std;
class vid
{
private:
    ///Variables
    int id;
    string name;
    string link;
public:
    ///Functions
    //Constructors
    vid(QFileInfo* info);
    //Getters
    int get_id();
    string get_name();
    string get_link();
};

#endif // VID_H
