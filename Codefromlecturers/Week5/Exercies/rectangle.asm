// pseudocode
//  for (i = 0; i < n; i++) {
//          RAM[addr] = -1
//          addr = addr + 32    
//}  
// set i = 0
// set @SCREEN to addr 
// set RAM[0] to n 
// advance to the next row by addr = addr + 32 



@SCREEN
D = A 
@addr 
M = D  // set @addr to @SCREEN 

// set n to RAM[0] 
@R0
D=M
@n 
M=D 

// Set i to 0 
@i 
M=0 

(loopstart)
// if i - n > 0 then jump to end of loop 
@i 
D=M
@n 
D=D-M
@end 
D;JGT 

// RAM[addr] = !0
@addr
A=M
M = -1

//increment i 
@i
M=M+1



// addr = addr + 32
@32
D=A // D now stores 32
@addr // addr is stored in M 
D=D+M // D = 32 + addr 
@loopstart
0;JMP

@end
0;JMP 