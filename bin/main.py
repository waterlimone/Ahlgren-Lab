import os
import sys

def main():
    print(os.getcwd())
    print(os.path.dirname(os.path.realpath(__file__)))
    # print(sys.argv)

if __name__ == '__main__':
    main()