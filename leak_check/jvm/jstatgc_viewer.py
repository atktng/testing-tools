# -*- coding: utf-8 -*-

import pandas as pd
import matplotlib.pyplot as plt
import argparse

parser = argparse.ArgumentParser(description='jstatgc viewer')

parser.add_argument('csv', type=str, help='jstat -gc log csv file.')
args = parser.parse_args()

data = pd.read_csv(args.csv)
data.columns.values[0] = 'Datetime'
start = data['Timestamp'][0]

plt.figure()
x_axis = data['Timestamp'].apply(lambda t, s: t - s, s=start)
plt.subplots_adjust(left=0.15, right=0.8)

for label in data.columns.values:
    if label != 'Timestamp' and label != 'Datetime':
        plt.plot(x_axis, data[label], label=label)

plt.legend(bbox_to_anchor=(1.01, 1), loc='upper left', borderaxespad=1, fontsize=10)
plt.xlabel('elapsed time [s]')

plt.savefig('jstatgc_graph.png')
