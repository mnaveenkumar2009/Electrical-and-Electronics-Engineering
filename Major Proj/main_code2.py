import tensorflow as tf
import numpy as np
import xgboost as xgb
np.random.seed(123)
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import roc_auc_score
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
D = [[0,0,0,0,0,0]]*2500
L = [[0,0,0,0,0]]*2500
for i in range(2500):
    D[i] = [data['0'][i], data['1'][i], data['2'][i], data['3'][i], data['4'][i], data['5'][i]]
    L[i] = [label['0'][i], label['1'][i], label['2'][i], label['3'][i], label['4'][i]]
    for j in range(5):
        D[i][j] = float(D[i][j])
        L[i][j] = float(L[i][j])
    D[i][5] = float(D[i][5])
# print(L)
def test_loss(y_pred, y_true):
    # return K.variable(1e18)
    np_y_pred = K.cast(y_pred, 'float32')
    np_y_true = K.cast(y_true, 'float32')
    subt = K.cast(y_true[0]/1000, 'int32')
    subt *= 1000
    subt = K.cast(subt, 'float32')
    load = subt
    # np_y_true[0] -= subt
    if K.greater(K.sum(np_y_pred), K.sum(np_y_true) - subt) :
        return K.variable(1e18)
    if K.greater(np_y_pred[0],np_y_true[0] - subt):
        return K.variable(1e18)
    for i in range(5):
        if K.greater(np_y_pred[i],np_y_true[i]):
            return K.variable(1e18)
    
    if K.greater(K.cast(K.sum(np_y_pred), 'float32'), load):
        return K.variable(1e18)
    return load - K.sum(np_y_pred)

# xg_reg = xgb.XGBRegressor(obj = test_loss, colsample_bytree = 0.3, learning_rate = 0.024,
#                 max_depth = 6, alpha = 10, n_estimators = 230,eval_metric='auc')
# xg_reg.fit(D, L)
dtrain = xgb.DMatrix(D)
xgb.train({'max_depth': 4, 'eta': 1, 'silent': 1}, dtrain, obj=test_loss,feval=test_loss)