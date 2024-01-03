// Initialize total to 0 and store in RAM[2]
@0
D=A    // D = 0
@2
M=D    // RAM[2] = 0

// Initialize loop counter (i) to 0
@i
M=0    // i = 0

(LOOP) // Start of the loop
    @i
    D=M      // D = i
    @1
    D=D-M    // D = i - RAM[1]
    @END     // Set up to jump to END
    D;JGE    // If i >= RAM[1], jump to END

    // Add RAM[0] to total
    @0
    D=M      // D = RAM[0]
    @2
    M=D+M    // RAM[2] = RAM[2] + RAM[0]

    // Increment i by 1
    @i
    M=M+1    // i = i + 1

    // Jump back to the start of the loop
    @LOOP
    0;JMP

(END) // End of the loop, the program will end here
    @END
    0;JMP // Infinite loop to halt the program
