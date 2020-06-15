# import necessary libraries
import numpy as np
# set the seed to reproduce the model on a rerun
np.random.seed(123)
import pandas
import keras.backend as K 
from keras.models import Sequential
from keras.layers import Dense
import random
random.seed(5) 

#block size same as the one taken in the dV/dt islanding detection method
block__size = 32

# read the input and output
data = pandas.read_csv('Voltage.csv')

# set data[i] for all i from 0 to 31 as data['dV']  since the row must be of size 32
for i in range(block__size):
    data[i] = data['dV']

# We know that, data[i] (0 indexed) contains the data from i + 1 (1 indexed)
# Hence, we edit the columns from 1 to 31 (0 indexed)
for i in range(block__size):
    data[i][0:len(data) - block__size + 1] = data['dV'][i:len(data) - block__size + 1 + i]
# Resize the data to len(data) - 31 as that's the output data size
data = data[0:len(data) - block__size + 1]
# drop the initial column since the preprocessing is done
data = data.drop(columns = ['dV'])


model = Sequential()
model.add(Dense(40, input_dim = block__size, activation='relu'))
model.add(Dense(40, activation='relu'))
model.add(Dense(1, activation='sigmoid'))
model.compile(loss="binary_crossentropy", optimizer='adam', metrics=['accuracy'])
model.load_weights("microgrid3.h5")
Pred = (model.predict_classes(data))
# for i in Pred:
#     print(i)
import math
l = int(math.ceil(len(Pred)/3.0))
r = int(math.floor((len(Pred) * 2)/3.0))
Ac = 0
for i in range(l, r + 1):
    Ac += (Pred[i] == 1)
print(Ac/(r - l + 1.0)) # islanding accuracy
print(1 - (sum(Pred) - sum(Ac))/(len(Pred) - (r - l + 1.0))) # non islanding mode accuracy