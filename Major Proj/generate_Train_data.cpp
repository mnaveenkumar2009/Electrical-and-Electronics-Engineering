#include <bits/stdc++.h>
using namespace std;

int main(){
    srand(1234);
    int data[2500][6], label[2500][5];
    int rated_power[] = {25, 20, 20, 15, 20};
    for(int i = 0; i < 2500; i++){
        for(int j = 0; j < 5; j++){
            data[i][j] = (rand()%rated_power[j]) + 1;
            label[i][j] = data[i][j];
        }
        data[i][5] = (rand() % 100) + 1;
        label[i][0] += data[i][5] * 1000;
    }
    bool we;
    cin >> we;
    if(we){
        for(int i = 0; i < 2500; i++){
            for(int j = 0; j < 6; j++)
                cout << data[i][j] << ((j != 5)?',':'\n');
        }
    }
    else{
        for(int i = 0; i < 2500; i++){
            for(int j = 0; j < 5; j++)
                cout << label[i][j] << ((j != 4)?',':'\n');
        }
    }
}