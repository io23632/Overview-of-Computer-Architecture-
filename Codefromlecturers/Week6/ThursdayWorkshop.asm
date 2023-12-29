//Goal: Draw a black rectanlge at row RAM[0], column RAM[1], with width RAM[2] and height RAM[3]
// Easy mode: Both RAM[1] (column) and RAM[2] (width) are divisable by 16 
// pseudocode

// Calculate col:
		//temp = 0;
		//total = 0;

		//for (temp = 0; total <= col; temp++) {
				//total = total + 16;
			//}
			//temp--; // sets temp to col/16
			
// Calculate the current position of the pixel given row and col:

			//pos = (0x4000 // address of the starting pixel in screen + (row << 5) // row * 32 +  temp)
			//current_row_addr = pos;

// Set up the row for loop:

			// for (i = 0; i < height; i++) {
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

// for (temp = 0; total <= col; temp++) 

(loop_temp)
// if total - col > 0 jump to end_loop_temp
@total 
D = M 
@R1 // RAM[1] contains col
D = D - M 
@end_loop_temp
D; JGT






(end_loop_temp)
