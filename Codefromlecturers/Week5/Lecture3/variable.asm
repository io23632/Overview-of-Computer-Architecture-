// Programme: Swap RAM[0] and RAM[1]
//Psuedocode:
// temp = R1
// R1 = R0
// R0 = temp


// load R[0] and store it in D
@R1
D = M

// load temp
@temp
// temp (M) = R1 (D)
M = D

// load R0 and store it in D
@R0
D = M

// Load R1// R1 = R0
@R1
M = D

// R0 = temp

// load temp and store it in D
@temp
D=M
@R0
M = D // R0 = temp

(END)
@END
0;JMP

