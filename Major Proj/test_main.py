import tensorflow as tf
import numpy as np
import xgboost as xgb
np.random.seed(123)
import pandas
import keras.backend as K 
from keras.models import Sequential
from keras.layers import Dense
import random
random.seed(5) 

sess = tf.compat.v1.Session()

# solar, wind, hydro, fuel cell, battery
rated_power = [25, 20, 20, 15, 20]

solar = pandas.read_csv('solardata.csv')
# averaging solar power for every 2 hrs
for i in range(12):
    solar[str(2*i+1)] = solar[str(2*i)]/2.0
    solar[str(2*i)] = solar[str(2*i + 1)]
# print(solar[0:0])
# print(solar)

# wind = pandas.read_csv('wind.csv')

data = pandas.read_csv('train_x.csv')
label = pandas.read_csv('train_y.csv')
label = label.drop('5', axis=1)
D = [[0,0,0,0,0,0]]*2500
L = [[0,0,0,0,0]]*2500
for i in range(2500):
    D[i] = [data['0'][i], data['1'][i], data['2'][i], data['3'][i], data['4'][i], data['5'][i]]
    L[i] = [label['0'][i], label['1'][i], label['2'][i], label['3'][i], label['4'][i]]
# print(L)

model = Sequential()
model.add(Dense(60, input_dim = 6, activation='relu'))
model.add(Dense(60, activation='relu'))
model.add(Dense(5, activation='sigmoid'))

model.load_weights('microgrid.h5')
print(D[0])
XXX = model.predict(data)
print(XXX)