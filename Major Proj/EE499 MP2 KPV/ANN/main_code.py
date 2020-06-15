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
label = pandas.read_csv('out.csv')

# print(data['dV'][0])

# data[1] = data['dV']
print(data.info())
input()
# print(label)

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

# create a msk of 1s and 0s with 1's having 80% probability
msk = np.random.rand(len(data)) < 0.8
#train contains the ones from msk
train = data[msk]
label_train = label[msk]
# test contains the complement of msk (0s)
test = data[~msk]
label_test = label[~msk]

# create the Model and add layers to test various possible models
model = Sequential()
# model.add(Dense(1, input_dim = block__size, activation='sigmoid')) # for perceptron model
model.add(Dense(40, input_dim = block__size, activation='relu'))
model.add(Dense(40, activation='relu'))
model.add(Dense(1, activation='sigmoid'))
model.compile(loss="binary_crossentropy", optimizer='adam', metrics=['accuracy'])

# train the data
model.fit(train, label_train, nb_epoch=5)
# evaluate train data score
score = model.evaluate(train, label_train)
print(score)
# evaluate test data score
score = model.evaluate(test, label_test)
print(score)

#save the model
model.save('microgrid3.h5')