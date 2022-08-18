#!/usr/bin/env python

from audioop import avg
import csv
import numpy as np
import os
import sys
import glob
import matplotlib.pyplot as plt


args = sys.argv                         # Command line arguments of program.
basePath = os.path.realpath(args[1])    # Argument 1 is qiimeRecords directories containing the quality trimmed reads.

os.chdir(basePath)                      # Change directory to the qiimeRecords folder.
directories = glob.glob("qual*")        # Get the directory names starting with qual.
directories.sort()                      # Sort the quality directories from smallest to largest.

# Extracts the average reads passed for that quality trim. Path is the path to the qual directory containing the stats.csv.
def extract_averages(path):

    # If stats.csv doesn't exist yet create stats.csv by extracting the the stats.qza file.
    if(os.path.isfile(path + 'stats.csv') == False):
        cmd = "qiime tools export --input-path " + path + "quality_filtered_stats.qza --output-path " + path
        os.system(cmd)

    # Read the csv file into a 2d list.
    data = []
    with open(path + 'stats.csv') as csvFile:
        file = csv.reader(csvFile, delimiter=',', quotechar='|')

        for row in file:
            data.append(row)

    # Calculate the average by looping throught reach row for both columns at the same time (Grows at N)
    avgRetained = 0
    i = 1
    while(i < len(data)):
        avgRetained += (int(data[i][2]) / int(data[i][1])) * 100
        i += 1

    # Divide by the the length of the list to get the average reads kept. Print and return this number.
    avgRetained = avgRetained / (len(data) - 1)
    print(avgRetained)
    return avgRetained

##########################################################################################################################

# Append the average of the reads kept for each quality directory onto this list for x-axis of graph.
avgsRetained = []
for dir in directories:
    avgsRetained.append(extract_averages(basePath + "/" + dir + "/"))

# Append the quality score numbers for each directory onto this list for the x-axis of graph.
xAxis = []
for i in directories:
    xAxis.append(i[-2:])

print(avgsRetained)
print(xAxis)

# os.mkdir("qiimeReadsGraph")

# Create the figure.
qiime_graph = plt.figure()
plt.bar(xAxis, avgsRetained, figure=qiime_graph)
plt.title("Reads Kept Over Quality Score Cutoffs", figure=qiime_graph)
plt.xlabel("Quality Score Cutoff", figure = qiime_graph)
plt.ylabel("Percentage of Reads Kept", figure = qiime_graph)
qiime_graph.savefig("./qiimeReadsGraph/qiimeReadsGraph.png")    # Save the figure.