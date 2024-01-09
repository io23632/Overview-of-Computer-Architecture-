//Question 1: Basic Output to Screen (Easy)
//Write a Hack assembly program that turns the top-left pixel of the screen black.

@SCREEN
D=A
@addr 
M=D

@addr
A=M
M = -1

(infiniteloop)
@infiniteloop
0;JMP


