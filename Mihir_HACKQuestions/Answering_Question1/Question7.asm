//Question 7: Bitwise OR
//Develop a program that performs a bitwise OR operation between the values in `RAM[12]`
//and `RAM[13]` and stores the result in `RAM[14]`.

@R12
D=M 
@R13
D=D|M
@R14
M=D
