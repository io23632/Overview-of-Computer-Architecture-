//Goal: Draw a black rectanlge at row RAM[0], column RAM[1], with width RAM[2] and height RAM[3]
// Easy mode: Both RAM[1] (column) and RAM[2] (width) are divisable by 16 
// pseudocode

// Calculate col:
		//temp = 0;
		//total = 0;
//////// Changed for loop to do while loop 
		// do {
            // total = total + 16;
            // temp++;
            // while (total <= col)
       // }
       // temp-- // sets temp to col/16
// Calculate the current position of the pixel given row and col:

			//pos = (0x4000 // address of the starting pixel in screen + (row << 5) // row * 32 +  temp)
			//current_row_addr = pos;

// Set up the row for loop:

			// for (i = 0; i <= height; i++) {
							//j= 0;
							//pixel_coloured = 0;
							//while (pixels_coloured < width) {
									//RAM[curr_addr + j] = 0xFFFF;
									//j++;
									//pixels_coloured = pixels_coloured + 16;
			//}
				//current_addr = current_addr + 32


//temp = 0
@temp
M = 0;

// total = 0
@total
M = 0

// do 
(loop_temp)
// total = total + 16
@16
D=A 
@total 
M = M + D 
// temp++
@temp 
M = M + 1

// while (total <= col) jump to top of loop 

@total 
D = M 
@R1 // stores col 
D = D - M 
@loop_temp
D; JLE // if total - col < 0 jump to top of loop 

// temp = temp - 1 Now temp = col/16
@temp 
M = M - 1 



//pos = (0x4000 // address of the starting pixel in screen + (row << 5) // row * 32 +  temp)

// row << 5 row times 5 (the binary numbers are being multiplied by 5, bit shifting to get to 32)
// Remember that bit shifting is multiplying by 2 (5 times ) to get to 32 so, if we store
// the value of row in AD then do A + D, we are esentially doubling the value of row. 
// Then if we do this 5 times we get * 32 

@R0
AD = M 
// Double the value in 'D' five times to effectively perform a 'row * 32'
AD=A+D       // Double once (2x)
AD=A+D       // Double twice (4x)
AD=A+D       // Double thrice (8x)
AD=A+D       // Double four times (16x)
AD=A+D       // Double five times (32x)
// D now stores the value of row * 32
// (row << 5 + temp)
@temp 
D = M + D 
// + 0x4000 (which is the screen)
@SCREEN
D = A + D 

// store the value of D (pos) in M 
@pos 
M = D 

// curr_addr = pos
@current_addr 
M = D 


//////////// for (i = 0; i < height; i++)


// i = 0 
@i 
M = 0

    (row_for_loopstart)
    @i 
    D = M
    @R3 // stores height 
    D = D - M // D = i - height 
    @row_for_loopend
    D; JGE // // if i - height => 0 jump to for loop end // if D => 0, then jump

    // j = 0 
    @j
    M=0
    // pixel_coloured =0
    @pixels_coloured
    M=0

    // while (pixels_coloured < width)
        (while_colloop_start)
        @pixel_coloured 
        D=M 
        @R2
        D = M - D // D = pixel_coloured - widht
        @while_colloop_end
        D;JGE // if pixel_coloured - widht > 0 jump to end of col loop 

        //RAM[curr_addr + j] = 0xFFFF;
        @curr_addr
        D=M 
        @j 
        D=D+M 
        @temp 
        M=D // temp stores current_addr + j 
        // 0xFFFF is the same as loading 0 and preforming a NOT operation 
        D=0
        D = !A 
        @temp 
        A=M
        M=D // temp (which stores RAM[curr_addr + j] to 0xFFFF) coulured a pixel 
        //j++;
        @j 
        M=M+1
        // load 16 and store in D
        @16
        D=A
        
        @pixel_coloured
        M=M+D //pixels_coloured = pixels_coloured + 16;

        @while_colloop_start
        0;JMP

        (while_colloop_end)

    //current_addr = current_addr + 32
    @32
    D=A 
    @curr_addr
    M=M+D
    // increment i 
    @i 
    M = M + 1
    // jump back to row loop start 
    @row_for_loopstart
    0;JMP


(row_for_loopend)
// DONE
@row_for_loopend
0;JMP