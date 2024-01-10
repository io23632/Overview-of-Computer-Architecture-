//Question 3: Screen Manipulation (Intermediate)
//Write a Hack assembly program that creates a vertical stripe pattern on the screen,
//with every other column being black.

//psuedocode: 
// for (int i = 0; i < 256; i++) {
//	for (int j = 0; j < 32; j++) {
//		int addr = SCREEN(base address) + 32*1 + j
//		RAM[addr] = 0xAAAA
//}
//}

//psuedocode: refined

// i = 0
// (row_loop)
// jump conditioin is i - 256 = 0 jump to end loop
// j = 0 
// addr = 0
	// (col_loop)
	// jump condition is j - 32 = 0 jump to col_loop_end
	// addr = SCREEN + i << 5 + j
	// RAM[addr] = 0xAAAA

	// increment j

	(col_loop_end)


// increment i

//(row_loop_end)


//DONE
//Inifiniteloop 

// i = 0
@i
M=0
//addr = 0
@addr
M=0

(row_loop)
// jump conditioin is i - 256 = 0 jump to end loop
@i
D=M
@256
D=D-A
@row_loop_end
D;JEQ

//j = 0
@j
M=0



	// col_loop
	(col_loop)
	// JUMP condition is when j - 32 = 0 
	@j
	D=M
	@32
	D=D-A
	@col_loop_end
	D;JEQ
	
	// else addr = SCREEN + i << 5 + j
	// i << 5 == i * 32
	@i
	AD=M
	AD = A + D
	AD = A + D
	AD = A + D
	AD = A + D
	AD = A + D
	@j
	D=D+M // D= (i*32) + j
	@SCREEN
	D=D+A
	@addr
	M=D

	// RAM[addr] = 0xAAAA
	@43690
	D=A
	@addr
	A=M
	M=D

	//@16384 // 0x4000
	//D=A
	//@10922 // 0x2AAA
	//D=D+A // D now holds 0xAAAA
	//@addr
	//A=M
	//M=D

	//increment j
	@j
	M=M+1

	@col_loop
	0;JMP

(col_loop_end)
//increment i
@i
M=M+1

//jump to start of row_loop
@row_loop
0;JMP

(row_loop_end)
//DONE
(DONE)
@DONE
D;JMP

	

