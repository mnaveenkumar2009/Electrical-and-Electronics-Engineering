#include <bits/stdc++.h>
using namespace std;

int main(){
    int i;
    for(int i=0;i<150;i++){
        int age=rand()%60+10;
        int m=rand()%4+1;
        if(age>=50&&m>=2){cout<<"yes,"<<age<<','<<m<<'\n';continue;}
        if(age>=30&&m>=3){cout<<"yes,"<<age<<','<<m<<'\n';continue;}
        if(age>=10&&m>=4){cout<<"yes,"<<age<<','<<m<<'\n';continue;}
        cout<<"no,"<<age<<','<<m<<'\n';continue;
    }
}