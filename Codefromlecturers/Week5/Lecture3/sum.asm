//psuedocode
//i = 0, RAM[1] = 0
// while i < RAM[0] : (same as i - RAM[0] < 0)
// Add i to RAM[1]
// Increment i 


// Load i and set it to 0
@i
M = 0

// Load RAM[1] and set it to 0
@R1
M = 0

(loopstart)
// load i and store it in D
@i
D = M

// Load RAM[0] (stored in M) and do i - RAM[0]
@R0
D = D - M

// if D is greater than 0 then jump to loop end
@loopend
D; JGT

// Add i to RAM[1]:
//Load i and store in D
@i
D = M

// load RAM[1] now stored in M, then add i to RAM[1] i = D, RAM[1] = M
@R1
M = D + M

// increment i:
@i
M = M + 1

// got to loop start
@loopstart 
0;JMP

(loopend)
@loopend
0;JMP