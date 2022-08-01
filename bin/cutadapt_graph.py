
from readPercentage import cut_adapt_trim_log
import matplotlib.pyplot as plt

def cutadapt_graph():
    read_22, base_22 = cut_adapt_trim_log(
        "/home/cmcilvenna/RWU_amplicon_data/RWU_SYNITS_0.22filterCells_sequenceData/qual22_trimmed/trimLog")
    read_25, base_25 = cut_adapt_trim_log(
        "/home/cmcilvenna/RWU_amplicon_data/RWU_SYNITS_0.22filterCells_sequenceData/qual25_trimmed/trimLog")
    read_28, base_28 = cut_adapt_trim_log(
        "/home/cmcilvenna/RWU_amplicon_data/RWU_SYNITS_0.22filterCells_sequenceData/qual28_trimmed/trimLog")
    read_32, base_32 = cut_adapt_trim_log(
        "/home/cmcilvenna/RWU_amplicon_data/RWU_SYNITS_0.22filterCells_sequenceData/qual32_trimmed/trimLog")

    x = [22, 25, 28, 32]
    read_y = [read_22, read_25, read_28, read_32]
    base_y = [base_22, base_25, base_28, base_32]

    readsP = plt.figure()
    plt.plot(x, read_y, figure = readsP)
    plt.title("Reads Kept Over Quality Score Cutoffs", figure = readsP)
    plt.xlabel("Quality Score Cutoff", figure = readsP)
    plt.ylabel("Percentage of Reads Kept", figure = readsP)
    readsP.savefig("../Figures/Reads_Kept")

    basesP = plt.figure()
    plt.plot(x, base_y, figure = basesP)
    plt.title("Bases Kept Over Quality Score Cutoffs", figure = basesP)
    plt.xlabel("Quality Score Cutoff", figure = basesP)
    plt.ylabel("Percentage of Bases Kept Per Read", figure = basesP)
    basesP.savefig("../Figures/Bases_Kept")