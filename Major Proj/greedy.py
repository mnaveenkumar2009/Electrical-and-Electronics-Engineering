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
for hour in range(12):
    cur_load = load[hour]
    X = [0] * 5
    for i in range(5):
        if cur_load > data[i][hour]:
            cur_load = cur_load - data[i][hour]
            X[i] = data[i][hour]
            data[i][hour] = 0
        else:
            X[i] = cur_load
            data[i][hour] -= cur_load
            cur_load = 0
    print(X)
    if hour < 11:
        data[4][hour + 1] = data[4][hour]