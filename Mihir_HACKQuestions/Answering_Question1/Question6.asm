// Question 6: Bitwise AND
//Write a program that performs a bitwise AND operation between the values in `RAM[9]` and
//`RAM[10]` and stores the result in `RAM[11]`.

@R9
D=M
@R10
D=D&M
@R11
M=D