//While no key is pressedn, make every pixel on the screen black. 
//While any key is being pressed, make every pixel on the screen white

// Pseudocode 
// while True:
//      for (int i = 0x4000; i < 0x5FFF; i++)
//          if RAM[KBD] != 0
//              write 0x0000 to RAM[i]
//            else 
//              write  0xFFFF to RAM[i]


//////////////////////////////////////////////////////////////////////////////////////////////////////


// While True:
(bigloop)
    // int i = 0x4000 which is the SCREEN
@SCREEN
D = A 
@i 
M = D

(smallloop)
// load i and store in D
@i
D=M
// load 0x5FFF
@24575 // in denary this is 24575
D=D-A // i - 0x5FFF 
@bigloop
D;JGT // if i - 0x5FFF > 0 go to bigloop


//if RAM[KBD] != 0, jump to (writezeros)
// otherwise write 0XFFFF to RAM[i]
@KBD 
D=M 
@writezeros
D;JNE // if D is not equal to value at KBD 

D=0
D = !D // D contains 0XFFFF
@i 
A=M 
M=D 
//increment i 
@i 
M = M + 1
@smallloop
0;JMP

// write 0x0000 to RAM[i]
(writezeros)
D=0
@i 
A=M 
M=D 
//increment i 
@i 
M = M + 1
@smallloop
0;JMP


@bigloop
0; JMP