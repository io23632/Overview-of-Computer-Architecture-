//pseudocode
// for (int i = 0; i < RAM[0]; i++){
//  colour 16 pixels black
//}
//////
// @SCREEN = addr 
// n = RAM[0]
// i = 0
// LOOPSTART
// if i > n (or i - n > 0) then go to Loopend 
// RAM[addr] = -1 // 1111111111111111 // colour the first 16 pixels black
// advance to the next row:
// addr = addr + 32
// i = i + 1
// goto LOOPSTART


// load screen and set to addr
@SCREEN
D = A 
@addr
M = D


// Load R0 and set it to n
@R0
D = M  
@n
M = D // n = RAM[0]

// load i and set it to 0
@i
M = 0

(LOOPSTART)
// if i > n (or i - n > 0) then go to Loopend 
@i
D = M
@n
D = D - M
@LOOPEND 
D;JGT // jump to loop end if i - n > 0


// RAM[addr] = -1 // 1111111111111111 // colour the first 16 pixels black
@addr
A = M 
M = -1

// increment i
@i
M = M + 1

// addr = addr + 32
@32
D = A 
@addr
M = M + D
@LOOPSTART
0;JMP 


(LOOPEND)
@LOOPEND
0;JMP
