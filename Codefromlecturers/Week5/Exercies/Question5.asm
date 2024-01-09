//psuedocode
// while (true) {
//    int c_pressed; // can be 0 or 1
//    for (int i = 0; i < 256; i++) {
//        for (int j = 0; j < 32; j++) {
//              int address = SCREEN + i * ROW_WIDTH + j; // ROW_WIDTH = 32    
//            if (i % 2 == c_pressed) {
//                RAM[address] = 0xAAAA // black checkerboard
//            }
//            else {
//                screen[address] = 0x5555 // white cherc
//            }
//        }
//    }
// }

// while (true)
(while_loop)
// int c_pressed; // can be 0 or 1
@c_pressed
M=0
// set i = 0 
@i
M=0
    // row_loop
    (row_loop)
    // JUMP condition is if i - height > 0 jump out of loop where height is 256
    @i
    D=M 
    @256
    D=D-A 
    @row_loop_end
    D;JGE

        // j = 0
        @j
        M=0
            // col loop 
            (col_loop)
            // Jump condition is if j - width > 0 jump out of loop where width is 32
            @j
            D=M
            @32
            D=D-A 
            @row_loop
            D;JGE

            // int address = SCREEN + i * ROW_WIDTH (32) + j;
            // i * 32 == i << 5
            @i
            AD=M
            AD= A + D // (same as row (stored in AD) * 2)
            AD= A + D // (same as row (stored in AD) * 4)
            AD= A + D // (same as row (stored in AD) * 8)
            AD= A + D // (same as row (stored in AD) * 16)
            AD= A + D // (same as row (stored in AD) * 32)
            @j
            D=D+M // D now stores i*32+j
            @SCREEN
            D=A+D // D now stores SCREEN + i * ROW_WIDTH (32) + j;
            @address
            M=D

            // if (i % 2 == c_pressed). If c_pressed is 0, i%2 == c_pressed == true, if c_pressed = 1 
            // i%2 == false. 
            //load i
            @i
            D=M 
            @2
            D=D&A // D now contains the result of i % 2. 
            // load c_pressed
            @c_pressed
            D=D-M // if D != 0, jump to fill_checkerboard_white else continue to fill_checkerboard_black
            @fill_checkerboard_white
            D;JNE
            
            (fill_checkerboard_black)
            // RAM[address] = 0x5555 / 21845
            @address
            A=M
            @21845
            D=A // D now holds the value 21845 (0x5555)
            M=D // RAM[address] = 21845

            (fill_checkerboard_white)
            // RAM[address] = 0xAAAA / 21845
            @16384 // 0x4000
            D=A
            @10922 // 0x2AAA
            D=D+A // D now holds 0xAAAA
            @address
            A=M
            M=D 

            // increment j
            @j
            M=M+1
            @col_loop
            0;JMP

    // increment i 
    @i 
    M=M+1
    @row_loop
    0;JMP


(row_loop_end)



@while_loop
0;JMP
