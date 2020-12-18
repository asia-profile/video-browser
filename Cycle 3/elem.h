#ifndef ELEM_H
#define ELEM_H
#include <string>
#include <vector>
#include "vid.h"

using namespace std;


class elem
{
//Struct for the prev and next branch in the tree
typedef struct{
   int branch;
   int index;
   elem*adress;
}stepP;
typedef struct{
   int branch;
   vector<elem*>* adress;
}stepN;

private:
    ///Variables
    bool file;
    string link;
    vid *v;
    stepP prev;
    stepN next;
    int index;
    string name;
    ///Functions
    void create_vid();
public:
    ///Functions
    //Constructors
    elem(bool file, string link, int branch, int index_prev, elem* adress, int index);
    elem(bool file, string link);
    //Getters and setters next and prev
    int get_branch_next();
    int get_index_prev();
    int get_branch_prev();
    vector<elem*>* get_adress_next();
    elem* get_adress_prev();
    vid* get_vid();
    string get_link();
    void set_branch_next(int branch);
    void set_adress_next(vector<elem*>* adress);
    //Checks if it is a file
    bool isFile();
    //Getters and setters index
    int get_index();
    void set_index(int index);
    //Getter name
    string get_name();

};

#endif // ELEM_H
