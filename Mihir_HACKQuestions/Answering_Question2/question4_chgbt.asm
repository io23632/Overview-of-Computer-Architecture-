// s_active: Check if 'S' key is pressed
(s_active)
@KBD
D=M          // D = content of KBD
@83          // ASCII value for 'S'
D=D-A        // Check if KBD content is 83
@screen_black
D;JEQ        // If yes, jump to screen_black

@DONE        // Infinite loop if 'S' not pressed
0;JMP

(screen_black)
// Initialize i to 0
@i
M=0

(row_loop)
// Check if i >= 128
@i
D=M
@128
D=D-A
@row_loop_end
D;JEQ

// Initialize j to 0
@j
M=0

(col_loop)
// Check if j >= 16
@j
D=M
@16
D=D-A
@col_loop_end
D;JEQ

// Calculate address: SCREEN + i * 32 + j
@i
AD=M
AD= A + D
AD= A + D
AD= A + D
AD= A + D
AD= A + D
//D now stores i*32
@SCREEN
D=D+A      // D = SCREEN + i * 32
@j
D=D+M      // D = SCREEN + i * 32 + j
@addr
M=D

// Set the pixel to black (write -1 to RAM[addr])
@addr
A=M
M=-1

// Increment j
@j
M=M+1

// Jump back to col_loop
@col_loop
0;JMP

(col_loop_end)
// Increment i
@i
M=M+1

// Jump back to row_loop
@row_loop
0;JMP

(row_loop_end)
// Once done, go back to s_active to check for key press again
@s_active
0;JMP

(DONE)
// Infinite loop to end program
@DONE
0;JMP
