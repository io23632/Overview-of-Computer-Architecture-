//Write a Hack assembly program that, upon pressing the 'S' key, draws a black square
//starting from the top-left corner of the screen, covering a quarter of the screen.

//ASCII charcter for S = 83

//psuedocode:
// int s_active = KBD = 83
// while (RAM[KBD] = 1) {
//	for (int i = 0; i < 256/2; i++) {
//		for (int j = 0; j < 32/2; j++)
//			addr = SCREEN + 32*i + j
//			RAM[addr] = -1 
//	}
//    }
// }


//psuedocode: refined
// (s_active)
// if RAM[KBD] = 83 goto fill screen black:
// (screen_black)
// i = 0
// (row_loop)
// jump condition: when i > 128 == i - 128 = 0 jump to row_loop_end
// j = 0
// (col_loop)
// jump condition: when j > 16 == j - 16 = 0 jump to col_loop_end
// addr = SCREEN + i << 5 + j
// RAM[addr] = -1
// increment j
// jump to col loop
// col_loop_End
// increment i
// jump to row_loop
// row_loop_end
// jump to s_active

// s_active
(s_active)
// if RAM[KBD] = 83 goto fill screen black: RAM[KBD] - 83 = 0
@KBD
D=M
@83
D=D-A
@screen_black
D;JEQ


(screen_black)
// i = 0
@i
M=0

(row_loop)
//jump condition: when i > 128 == i - 128 = 0 jump to row_loop_end
@i
D=M
@128
D=D-A
@row_loop_end
D;JEQ

// j = 0
@j
M=0

	// col_loop
	(col_loop)
	// jump condition: j - 16 = 0 jump to col_loop_end
	@j
	D=M
	@16
	D=D-A
	@col_loop_end
	D;JEQ
	
	// else addr = SCREEN + i << 5 + j
	// i << 5
	@i
	AD=M
	AD= A + D
	AD= A + D
	AD= A + D
	AD= A + D
	AD= A + D
	//D now stores i*32
	@j
	D=M
	@i
	D=D+M
	@SCREEN
	D=D+A
	@addr
	M=D
	// RAM[addr] = -1
	
	@addr
	A=M
	M =-1
	

	//increment j
	@j
	M=M+1
	
	//jump to col_loop
	@col_loop
	0;JMP


(col_loop_end)
// increment i 
@i
M=M+1

//jump to row_loop
@row_loop
0;JMP

(row_loop_end)

@s_active
0;JMP	


