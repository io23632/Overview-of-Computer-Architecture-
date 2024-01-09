//load RAM[0]
// load RAM[1]
// if the number is greater than 16 then store 0 in RAM[2]
// else :
// shift RAM[0] by by 2
// decrement RAM[1] BBY 1 till RAM[1] = 0 

// load RAM[0]
@R0
D=M

// if RAM[1] - 16 > 0 JUMP to set RAM[2] to 0
@R1
D=M
@16
D=D-A 
@set_r2_to_0
D;JGT

(LOOP)
// JUMP Condition to DONE when RAM[1] = 0 
@R1
D=M
@DONE
D;JEQ


@R0
AD=M
AD = A + D // same as R0 * 2

// store the result back in R0 
@R0
M=D 

//decrement R1 by 1 
@R1
M=M-1

// jump to loop 
@LOOP
0;JMP 


(set_r2_to_0)
@R2
M=0
@DONE
0;JMP

// store the final result in R2 
@R0
D=M 
@R2
M=D

(DONE)
@DONE
0;JMP