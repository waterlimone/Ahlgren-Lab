#!/usr/bin/env python

from audioop import avg
import csv
import numpy as np
import os
import sys
import glob
import matplotlib.pyplot as plt


args = sys.argv
basePath = os.path.realpath(args[1])

os.chdir(basePath)
directories = glob.glob("qual*")
directories.sort()

def extract_averages(path):
    if(os.path.isfile(path + 'stats.csv') == False):
        cmd = "qiime tools export --input-path " + path + "quality_filtered_stats.qza --output-path " + path
        os.system(cmd)

    data = []
    with open(path + 'stats.csv') as csvFile:
        file = csv.reader(csvFile, delimiter=',', quotechar='|')

        for row in file:
            data.append(row)

    avgRetained = 0
    i = 1
    while(i < len(data)):
        avgRetained += (int(data[i][2]) / int(data[i][1])) * 100
        i += 1

    avgRetained = avgRetained / (len(data) - 1)
    print(avgRetained)
    return avgRetained

avgsRetained = []
for dir in directories:
    avgsRetained.append(extract_averages(basePath + "/" + dir + "/"))

xAxis = []
for i in directories:
    xAxis.append(i[-2:])

print(avgsRetained)
print(xAxis)

# os.mkdir("qiimeReadsGraph")

qiime_graph = plt.figure()
plt.bar(xAxis, avgsRetained, figure=qiime_graph)
plt.title("Reads Kept Over Quality Score Cutoffs", figure=qiime_graph)
plt.xlabel("Quality Score Cutoff", figure = qiime_graph)
plt.ylabel("Percentage of Reads Kept", figure = qiime_graph)
qiime_graph.savefig("./qiimeReadsGraph/qiimeReadsGraph.png")