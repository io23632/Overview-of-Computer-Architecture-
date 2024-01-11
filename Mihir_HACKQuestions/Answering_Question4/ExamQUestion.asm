//posuedicode
// n = RAM[0]
// pos = 0;
// while (n != 1) {
//      count = 0;
//      int mask = 1;
//  while(mask != 0x8000) {
//    if (n & mask != 0) {
//       count += 1;
//}
//    mask << 1
//}
// n = count
// RAM[pos] = count
// pos++
//}


// set R0 to variable n 
@R0
D=M 
@n
M=D

//set pos to 0 
@pos
M=0 

// while n != 1
(outer_loop)
// Jump Condition is when n = 1
@n
D=M-1
@outer_loop_end
D;JEQ

@count
M=0

@mask
M=1

        // inner loop
        (inner_loop)
        //jump conition is when mask == 0x8000
        @mask
        D=M
        @32768
        D=D-A
        @inner_loop_end
        D;JEQ

            // if mask != 0 
            // jump out of loop when mask is = 0
            @mask
            D=M
            @inner_loop_end
            D;JEQ
            
            //increment count
            @count
            M=M+1

        // mask << 1
        @mask
        AD=M
        AD = A + D
        @mask
        M=D

        @inner_loop
        0;JMP

        (inner_loop_end)

@outer_loop
0;JMP

// n = count
// RAM[pos] = count
// pos++

@count
D=M
@n
M=D

@pos
A=M
D=A
@count
M=D

@pos
M=M+1


(outer_loop_end)

@outer_loop_end
0;JMP
