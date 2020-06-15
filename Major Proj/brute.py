import pandas
import random
data = [[]]*5
data[0] = [0,0,0,13.3775478,26.7550956,53.5101912,80.2652868,53.5101912,26.7550956,13.3775478,0,0] # solar
# data[0] /= 3.5
data[0] = [i/3.5 for i in data[0]]
# print(data)
data[1] = [353.93,949.58,653.41,426.28,1399.73,761.02,949.58,556.45,681.68,857.38,1323.95,1494.42] # wind
data[1] = [i/90.0 for i in data[1]]
data[2] = [2163.105,2379.4155,2595.726,2812.0365,3028.347,3244.6575,3460.968,3677.2785,3893.589,4109.8995,4326.21,4542.5205] # hydro
data[2] = [i/450.0 for i in data[2]]
data[3] = [random.random()*15 for i in range(12)]
data[4] = [20 for i in range(12)]
load = [random.random()*100 for i in range(12)]
# print(data)
xxx = 0;
for hour in range(12):
    i = 0
    max_possible = 0
    ans = [0]*5
    while i < (100 ** 3):
        perc = [0]*5
        cur = i
        for j in range(4):
            perc[j] = (cur%100)/100.0
            cur /= 100
        power_drawn = 0
        for j in range(5):
            power_drawn += data[j][hour] * perc[j]
        if data[j][hour] > 0:
            perc[4] = min(1, (load[hour] - power_drawn)/data[j][hour])
        perc[4] = max(0, perc[4])
        power_drawn += perc[4] * data[4][hour]
        if power_drawn > load[hour]:
            i += 1
            continue
        if power_drawn > max_possible:
            max_possible = power_drawn
            xxx += load[hour] - power_drawn
            ans = perc
        i += 1
    X = ans
    for i in range(5):
        X[i] *= data[i][hour]
    print(X)
    if hour < 11:
        data[4][hour + 1] -= X[4]
print(xxx)