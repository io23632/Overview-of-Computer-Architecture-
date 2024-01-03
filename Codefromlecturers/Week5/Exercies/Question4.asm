// Write a HACK program that multiplies RAM[0] by RAM[1] and sotres the result in RAM[2]. 


//pseudocode
// R2 = 0 
// while (R0 > 0) {
//    R2 = R2 + R1
//    R0--;
//}


// R2 = 0 
@R2
M=0

// while (R0 > 0)
(loopstart)
@R0 
D=M
@end
D; JLE // if R0 <=0 jump to end 

//R2 = R2 + R1
@R1
D=M 
@R2 
M=M+D

// R0--
@R0 
M=M-1

@loopstart
0;JMP

(end)
@end
0;JMP