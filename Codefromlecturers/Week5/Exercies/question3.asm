// Write a programme that subtracts RAM[1] from RAM[0] and stores the resutl in RAM[2]

//psuedocode

// RAM[1] - RAM[0]
@R1 
D=M // D now stores RAM[1]
@R0 // stores in M
D=D-M
@R2
M=D
