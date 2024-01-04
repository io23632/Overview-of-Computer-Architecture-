//psuedocode to multiply:
// function(int x, int y)
//int n = 1
// int sum = 0
// while (n < y) {
//  sum += sum + x
//    n++
//}
// return sum

// function mult 2
(MULT)             // Declare a label for the function entry
@SP
AM=M-1             // SP--
D=M                // D = *SP
@LCL
M=D                // LCL = *SP (set the frame)
@2
D=A
@5
D=D+A              // D = 5 + 2 (arguments + locals)
@SP
M=M-D              // SP = SP - (2 + 5)

// push constant 0
@0                 // A = 0
D=A                // D = 0
@SP
A=M
M=D                // *SP = D
@SP
M=M+1              // SP++

// pop local 0
@SP
AM=M-1
D=M                // D = *SP
@LCL
A=M
M=D                // *(LCL+0) = D

// push constant 1
@1                 // A = 1
D=A                // D = 1
@SP
A=M
M=D                // *SP = D
@SP
M=M+1              // SP++

// pop local 1
@SP
AM=M-1
D=M                // D = *SP
@LCL
A=M+1
M=D                // *(LCL+1) = D

// LOOP label
(LOOP)
    @LCL
    D=M
    @1
    A=D+A           // A = LCL + 1
    D=M             // D = n
    @ARG
    A=M
    D=D-M           // D = n - y
    @LOOP_END
    D;JGE           // if n >= y jump to LOOP_END

    // sum = sum + x
    @LCL
    D=M
    @0
    A=D+A           // A = LCL + 0
    D=M             // D = sum
    @ARG
    A=M
    D=D+M           // D = sum + x
    @LCL
    A=M
    M=D             // sum = D

    // n++
    @LCL
    D=M
    @1
    A=D+A           // A = LCL + 1
    M=M+1            // n++

    @LOOP
    0;JMP           // Jump to LOOP

// LOOP_END label
(LOOP_END)
    @LCL
    A=M
    D=M             // D = sum
    @SP
    A=M
    M=D             // *SP = sum
    @SP
    M=M+1           // SP++
    @R14
    A=M
    0;JMP           // Jump to return address
