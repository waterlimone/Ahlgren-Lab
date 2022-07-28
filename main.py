
from readPercentage import cut_adapt_trim_log
import matplotlib.pyplot as plt

def main():
    read_percentage_22, base_percentage_22 = cut_adapt_trim_log("/home/cmcilvenna/RWU_amplicon_data/RWU_SYNITS_0.22filterCells_sequenceData/qual22_trimmed/trimLog")
    read_percentage_25, base_percentage_25 = cut_adapt_trim_log("/home/cmcilvenna/RWU_amplicon_data/RWU_SYNITS_0.22filterCells_sequenceData/qual25_trimmed/trimLog")
    read_percentage_28, base_percentage_28 = cut_adapt_trim_log("/home/cmcilvenna/RWU_amplicon_data/RWU_SYNITS_0.22filterCells_sequenceData/qual28_trimmed/trimLog")
    read_percentage_32, base_percentage_32 = cut_adapt_trim_log("/home/cmcilvenna/RWU_amplicon_data/RWU_SYNITS_0.22filterCells_sequenceData/qual32_trimmed/trimLog")

if __name__ == '__main__':
    main()
    x = [1, 2, 3]
    y = [2, 4, 1]

    plt.plot(x, y)
    plt.xlabel("x - axis")
    plt.ylabel("y - axis")
    plt.title("My first graph")
    plt.show()