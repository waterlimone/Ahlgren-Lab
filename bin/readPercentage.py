# Runs throught the JSON files outputed by cutadapt and calculates
# the average percentage of reads that meet quality filtering/trimming

from asyncore import read
from audioop import avg
import json
import os

def cut_adapt_trim_log(path):

    files = os.listdir(path)

    read_percentage_kept = []
    base_percentage_kept = []
    for file in files:
        with open(path + "/" + file, "r") as read_file:
            temp = json.load(read_file)
            read_percentage_kept.append((temp["read_counts"]["output"] / temp["read_counts"]["input"]) * 100)
            base_percentage_kept.append((temp["basepair_counts"]["output"] / temp["basepair_counts"]["input"]) * 100)


    length = 0
    avgReadPercentage = 0
    avgBasePercentage = 0
    for i, percent in enumerate(read_percentage_kept):
        # print("Reads Kept: ", percent, "%")
        # print("Bases Kept: ", base_percentage_kept[i], "%")

        avgReadPercentage += percent
        avgBasePercentage += base_percentage_kept[i]
        length = i

    length += 1
    avgReadPercentage = avgReadPercentage / length
    avgBasePercentage = avgBasePercentage / length

    # print("\n")
    # print("Average Read Percentage: ", avgReadPercentage, "%")
    # print("Average Base Percentage: ", avgBasePercentage, "%")
    
    return avgReadPercentage, avgBasePercentage