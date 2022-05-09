import sys
import os

def tail(filename, numlines):

    #read the file
    with open(filename, 'r') as file:
        #store each line in a list
        content = file.read().splitlines()
        
    #count the length of list
    count = len(filename)
    
    #display content using loop
    for i in range(count-numlines, count):
        print(content[i])

def main():
    if len(sys.argv) != 3:
        print("Usage: python tail.py <file_name> <number_line>")
    else:
        tail(sys.argv[1], int(sys.argv[2]))

if __name__ == '__main__':
    main()
