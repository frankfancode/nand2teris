@R0
D=M

@a
M=D

@R1
D=M

@i
M=D

@2
M=0

(LOOP)
    @i
    D=M
    @END
    D;JEQ
    @0
    D=M
    @2
    M=M+D
    @i
    M=M-1
    @i
    D=M
    @LOOP
    D;JGT

(END)
    @END
    0;JMP