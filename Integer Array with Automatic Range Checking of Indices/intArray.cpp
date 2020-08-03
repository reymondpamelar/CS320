 /**
       *  Program #5
       *  A program that allows declaration of integer arrays of any size with
       *  automatic range checking of indices
       *  CS108-1
       *  November 18,2019
       *  @author  ReymondPamelar cssc0509
       */
#include <stdio.h>
#include <iostream>
#include "intArray.h"

using namespace std;
IntArray::IntArray(){
    name= new char[1];
    size=10;
    hi=size-1;
    lo=0;
    pA = new int[size];
}

IntArray::IntArray(int a){
    name=new char[1];
    pA=new int[a];
    size=a;
    hi=a-1;
    lo=0;
    
}

IntArray::IntArray(int a, int b){
    name=new char[1];
    if (a>b){
        lo=0;
        hi=0;
        size=-1;
        pA=new int[0];
    }
    else{
        lo=a;
        hi=b;
        size=(b-a)+1;
        pA=new int[hi-lo];
    }
}

IntArray::IntArray(const IntArray& o){
    size=o.size;
    pA = new int[size];
    hi=o.hi;
    lo=o.lo;
    for(int i=0; i<size; i++){
        *(pA+i)=*(o.pA+i);
    }
}

IntArray::~IntArray(){
    delete [] pA;
}


// Overloaded operators
int IntArray::operator==(const IntArray& o){
    int equal=1;
    if(this->size==o.size){
        for(int i =0; i<size; i++){
            if(*(pA+i)!=*(o.pA+i)){
                equal=0;
            }
        }
    }
    else {
        equal=0;
    }
    return equal;
}
int IntArray::operator!=(const IntArray& o){
    int notEqual=0;
    if(this->size==o.size){
        for(int i =0; i<size; i++){
            if(*(pA+i)!=*(o.pA+i)){
                notEqual=1;
            }
        }
    }
    else {
        notEqual=1;
    }
    return notEqual;
}
int& IntArray::operator[] (int i){
    int trueIndex=i-lo;
    if(trueIndex < 0 || trueIndex >= size ){
        cout << "Index out of bounds" << endl;
        cout << "...Program Halted" << endl;
        return pA[lo];
    }
    return pA[i-lo];
}                                    
IntArray& IntArray::operator=(const IntArray& o){
    if(size == o.size){
        for(int i=0; i<size; i++){
            *(pA+i)=*(o.pA+i);
        }
    }
    else{
        cout << "Illegal assignment..."<< endl;
        cout <<"Program Halted"<< endl;
    }
    return *this;
}                      
IntArray IntArray::operator+(const IntArray& o){
    IntArray sum(size);
    if(this->size==o.size){
        for(int i=0; i<size; i++){
            *(sum.pA+i)= *(pA+i) + *(o.pA+i);
        }
    }
    return sum;
}
IntArray &IntArray::operator+=(const IntArray& o){
    if(this->size==o.size){
        for(int i=0; i<=size; i++){
            *(pA+i) += *(o.pA+i);
        }
    }
    return *this;
}

ostream& operator<<(ostream& os, const IntArray& a){
    if (a.name != NULL){
        if(a.size<0){
            os << "Index error"<< endl;
        }
        else{
            for(int i=a.lo; i<=a.hi; i++){
                os << a.name << "[" << i << "] - " << a.pA[i-a.lo] << endl;
            }
        }
    }
    return os;
}


// Helper functions
void IntArray:: setName(const char *name){
    this->name=name;
}
void IntArray:: getName(){
    cout << name << endl;
}
int IntArray::  high(){
    return hi;
}
int IntArray:: low(){
    return lo;
}
