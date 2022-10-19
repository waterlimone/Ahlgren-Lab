
from readPercentage import cut_adapt_trim_log
from trim import Trim
import matplotlib.pyplot as plt
import os

def cutadapt_graph(path, folder):
    os.mkdir(path + "/cutadapt_figures")

    files = os.listdir(path + "/cutadapt_trims")
    reads = []
    bases = []
    score = []

    for i, directory in enumerate(files):
        qual_score = directory[4:-8]
        log_path = path + "/cutadapt_trims/" + directory + "/trimLog"
        read_temp, base_temp = cut_adapt_trim_log(log_path)
        reads.append(read_temp)
        bases.append(base_temp)
        score.append(qual_score)
    
    reads_graph = plt.figure()
    plt.bar(score, reads, figure = reads_graph)
    plt.title("Reads Kept Over Quality Score Cutoffs", figure = reads_graph)
    plt.xlabel("Quality Score Cutoff", figure = reads_graph)
    plt.ylabel("Percentage of Reads Kept", figure = reads_graph)
    reads_graph.savefig("./cutadapt_figures/reads_percentage_passed.png")

    bases_graph = plt.figure()
    plt.bar(score, bases, figure = bases_graph)
    plt.title("Bases Kept Over Quality Score Cutoffs", figure = bases_graph)
    plt.xlabel("Quality Score Cutoff", figure = bases_graph)
    plt.ylabel("Percentage of Bases Kept", figure = bases_graph)
    bases_graph.savefig("./cutadapt_figures/bases_percentage_passed.png")