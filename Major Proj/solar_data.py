import numpy as np
np.random.seed(123)
import pandas
solar = pandas.read_csv('solardata.csv')
solar[str(1)] = solar['0']/2.0
print(solar['1'])



    np_y_pred = [int(y_pred[0]), int(y_pred[1]), int(y_pred[2]), int(y_pred[3]), int(y_pred[4])]
    np_y_true = [int(y_true[0]), int(y_true[1]), int(y_true[2]), int(y_true[3]), int(y_true[4])]