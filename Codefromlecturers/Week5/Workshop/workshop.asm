// psuedocode:
// row = RAM[0], COLUMN = RAM[1], width = RAM[2], col = RAM[3]
// division algorithm to calculate col/16
// temp = 0
// total = 0
// while (total <= col){
//      total = total + 16
//      temp++
//}
// temp--; 
// 
// Calculate startposition 
// startposition = 0x4000 + row << 5 + temp
// current_row_address = startposition
// for (i = 0; i < height; i++){
//    j = 0
//    pixels_coloured = 0
//    while (pixels_coloured < width) {
//          RAM[current_row_address + j] = 0xFFFF
//          j++
//          pixels_coloured += 16
//}
//    current_row_address += 32
//}


// temp = 0, total = 0
@temp 
M=0
@total 
M=0


// while (total <= col) 

// jump condition: total - col => 0

(temp_loop)
@total 
D=M // D now stores total 
@R3 // R3 stores COl, which is now stored in M
D=D-M // D = total - RAM[3]
@temp_endloop
D; JGE // when D is greater than or equal to 0 jump to end of loop 

// total = total + 16
@16
D=A // D now stores 16
@total  // total stored in M
M=D+M // M = 16 + total 

// temp++
@temp 
M=M+1

// while (total <= col) go to temp_loop // total - col <= 0
@total
D=M // D now stores total 
@R3 // M now stores col 
D=D-M // D = total - col 
@temp_loop
D; JLE // Jump to start of the loop if D is less than or equal to 0

(temp_endloop)

// temp-- i.e. temp = temp - 1
@temp 
M=M-1 

// startposition = 0x4000 + row << 5 + temp

// row << 5
@R0
AD=M
AD= A + D // (same as row (stored in AD) * 2)
AD= A + D // (same as row (stored in AD) * 4)
AD= A + D // (same as row (stored in AD) * 8)
AD= A + D // (same as row (stored in AD) * 16)
AD= A + D // (same as row (stored in AD) * 32)
// D now stores the value of row << 5


@temp // tmep is now stored in M 
D=D+M // //row << 5 + temp :  stored in D 
@SCREEN // value stored in A
D=A+D // D =  0x4000 + D (row << 5 + temp )

// startposition = 0x4000 + row << 5 + temp
@startposition
M=D

// current_row_address = startposition
@current_row_address
D=M

// for (i = 0; i < height; i++)
// initialise i = 0 
@i 
M=0 
// Jump condition = i - height > 0 height is stored in RAM[3]
(forloop_start)
@i 
D=M 
@R3 // Height stored in M 
D=D-M // i - height
@forloop_end
D; JGT 

// j = 0 
@j
M=0

// pixels_coloured = 0
@pixels_coloured
M = 0

//    while (pixels_coloured < width) // width RAM[2]
(whileloop_start)

// jump condition : pixels_coloured - width > 0
@pixels_coloured
D=M
@R2 // M now stores width 
D=D-M // pixels_coloured - width 
@whileloop_end
D; JGE

// current_row_address + j 
@current_row_address
D=M 
@j 
D=M+D 
@temp 
M=D // temp stores current_row_address + j 

// if you access @temp with register A that is the same as RAM[temp]

D=0
D= !A // D= -1 0xFFFF
@temp
A=M // store the the memory in the address register A to access RAM[temp]
M=D // RAM[temp] = 0xFFFF

// j++ 
@j
M=M+1 

// pixels_coloured += 16 
@16
D=A
@pixels_coloured
M=M+D
@whileloop_start
0;JMP 

(whileloop_end)

@32
D=A
@current_row_address
M=M+D 

// increment i 
@i 
M=M+1

//DONE
(forloop_end)
@forloop_end
0;JMP