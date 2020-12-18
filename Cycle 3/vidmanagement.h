#ifndef VIDMANAGEMENT_H
#define VIDMANAGEMENT_H
#include <string>
#include <vector>
#include "elem.h"
using namespace std;
class vidManagement
{
private:
    ///Variables
    vector <vector <elem *>* > items;
    string main_link;
    int branch;
public:
    ///Functions
    //Constructor
    vidManagement(string link);
    //Tree-edit functions
    void create_branch(string link, elem* adress, int branch, int index);
    void add_branch(elem* adress);
    void remove_branch();
    //Getters
    int get_branch_size(int index);
    int get_current_branch_size();
    elem* get_elem(int index);
    string get_link();
};

#endif // VIDMANAGEMENT_H
