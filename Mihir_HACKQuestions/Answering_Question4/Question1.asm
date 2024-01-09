//- Write a Hack assembly program that performs a single left shift operation on the word in
// RAM[0] and stores the result in RAM[2].

//load RAM[0]
@R0
AD=M
// a single left operation is * 2
AD = A + D
@R2
M=D 

(infiniteloop)
@infiniteloop
0;JMP
