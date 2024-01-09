// - Implement a Hack assembly program that performs the left shift operation on RAM[0] three
// times, storing the result in RAM[2].
// psuedocode: Store 3 in a variable and until this variable does not reach 0, preform a left shift operation on R0



// load R0
@R0
D=M 

// store 3 in a variable
@3
D=A
@mult_var
M=D

(loop) 
// jump conditon is if mult_var = 0 
@mult_var
D=M
@DONE
D;JEQ 

// preform a left shit operation on R0
@R0 
AD=M
AD = A + D
@R0
M=D

// decrement mult_var by -1 
@mult_var
M=M-1
@loop
0;JMP

(DONE)
@R0
D=M
@R2
M=D 

(inifiniteloop)
@inifiniteloop
0;JMP