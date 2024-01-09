//Exam-like Question: Complete Operation
//Your code should:
//1. Add `RAM[0]` to `RAM[1]`, then store the result in `RAM[2]`.
//2. If `RAM[2]` is positive, then multiply `RAM[2]` by −1.
//3. Perform a bitwise OR of `RAM[2]` with `RAM[1]` and store the result in `RAM[2]`.

// Add RAM[0] to RAM[1] and store in RAM[2]
@R0
D=M
@R1
D=D+M
@R2
M=D

// If `RAM[2]` is positive, then multiply `RAM[2]` by −1.
// if RAM[2] is >  0 
@R2
D=M
@multiply
D;JGT

(multiply)
@R2
D=M 
D=-D 
@R2
M=D 

//3. Perform a bitwise OR of `RAM[2]` with `RAM[1]` and store the result in `RAM[2]`.
@R2
M=D
@R1
D=D|M
@R2 
M=D



