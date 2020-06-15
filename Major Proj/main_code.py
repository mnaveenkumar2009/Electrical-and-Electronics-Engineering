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
print(label[0:])
print(data[0:1])
# D = [[0,0,0,0,0,0]]*2500
# L = [[0,0,0,0,0]]*2500
# for i in range(2500):
#     D[i] = [data['0'][i], data['1'][i], data['2'][i], data['3'][i], data['4'][i], data['5'][i]]
#     L[i] = [label['0'][i], label['1'][i], label['2'][i], label['3'][i], label['4'][i]]
# print(L)
def test_loss(y_true, y_pred):
    subt = K.cast(K.cast(y_true[0]/1000, 'int32') * 1000, 'float32')
    load = subt
    
    sqerr = (load - K.sum(y_pred))
    sqerr *= sqerr
    if K.greater(K.sum(y_pred), K.sum(y_true) - subt) :
        return K.sum(y_pred) + 100
    if K.greater(y_pred[0],y_true[0] - subt):
        return K.sum(y_pred) + 100
    for i in range(5):
        if K.greater(y_pred[i],y_true[i]):
            return K.sum(y_pred) + 100    
    if K.greater(K.cast(K.sum(y_pred), 'float32'), load):
        return K.sum(y_pred) + 100
    return sqerr

model = Sequential()
model.add(Dense(60, input_dim = 6, activation='relu'))
model.add(Dense(60, activation='relu'))
model.add(Dense(5, activation='sigmoid'))
model.compile(loss=test_loss, optimizer='adam', metrics=['accuracy'])

# train
model.fit(data, label, nb_epoch=100)
# score = model.evaluate(data, labels)
# print(score)
model.save('microgrid.h5')