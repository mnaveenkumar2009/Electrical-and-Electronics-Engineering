# import necessary libraries
import numpy as np
# set the seed to reproduce the model on a rerun
np.random.seed(123)
import pandas
data = pandas.read_csv('../Data.csv')
label = pandas.read_csv('out.csv')
data['Island'] = label['Island']

data.to_csv('Data.csv')