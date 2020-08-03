# Header comment section (typical assignment info)
#Program #3
#Multiplies two matrices 
#CS320
#Date: 10/13/2019
#@ReymondPamelar cssc0509

import sys
# This function begins execution of program.
# Verify data input filename provided on command line: len(sys.argv)
# If error, output message for user: Usage: p3.py dataFileName'
# and quit, using sys.exit()
#
# Declare A, B, call read_matrices to initialize A, B, and store
# return value as C
#
# Print A and B contents
#
# Call mult_matrices
#
# Print result contents
#
def main():
    print("Program #3, cssc0509, Reymond Pamelar")
    
    A=[]
    B=[]
    C=read_matrices(A,B)
    
#Checks if a file from command line exit
    try:
        f = open(sys.argv[1])
        f.close();
    except FileNotFoundError:
        print('File does not exist')
        sys.exit(0)
    
    print("Matrix A Contents:")
    print_matrix(A)
    print()
    
    print("Matrix B Contents:")
    print_matrix(B)
    print()
    
    mult_matrices(A,B,C)
    print("Matrix A * B is:")
    print_matrix(C)
    
# This function reads m, n, and p from the datafile.
# Then matrices A and B are filled from the datafile.
# Matrix C is then allocated size m x p.
# The values for m, n, and p are local values filled in by this function
# PARAMETERS in order are:
# list matrix A
# list matrix B
# RETURN matrix C
#
def read_matrices(A,B):
    with open(sys.argv[1],"r") as f:
        #reads rows and/or columns from first three numbers of file
        m = next(f)
        n = next(f)
        p = next(f)
        #fills in lists for A and B from file
        for i in range(int(m)):
            A.append([int(x) for x in next(f).split()])
        for i in range(int(n)):
            B.append([int(x) for x in next(f).split()])
        #initializes m*p matrix for array C
        C = [[0 for x in range(int(p))] for y in range (int(m))]
        
        return C
        

# This function prints a matrix. Rows and columns should be preserved.
# PARAMETERS in order are:
# list The matrix to print
#
def print_matrix(matrix):
    for row in matrix:
        print(row)
    
# The two matrices A and B are multiplied, and matrix C contains the
# result.
# PARAMETERS in order are:
# list Matrix A
# list Matrix B
# list Matrix C (all zeros at this point)
#
def mult_matrices(A,B,C):
    #rows of A
    for i in range(len(A)):
        #columns of B
        for j in range(len(B[0])):
            #rows of B
            for k in range(len(B)):
                C[i][j] += A[i][k] * B[k][j]


# Begin program
if __name__ == '__main__':
    main()
