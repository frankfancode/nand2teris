// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.


(LOOP_KEYBOAD)
    @KBD
    D=M

    @keycode
    M=D

    @PRESS
    D;JGT

    @LOOP_KEYBOAD
    0;JMP

(PRESS)
    @SCREEN
    D=A
    @0
    M=D

    @129
    D=A

    @keycode
    D=D-M

    @BLACKSCREEN
    D;JNE
    @WHITE_SCREEN
    0;JMP


(BLACKSCREEN)
    // set current pixel is black
    @0
    D=M
    A=D
    M=-1
    
    // next pixel
    @0
    M=M+1

    // check current pixel is bigger than max screen pixel index
    @0
    D=M
    @1
    D=M-D
    @BLACKSCREEN
    D;JGT
    @LOOP_KEYBOAD
    0;JMP


(WHITE_SCREEN)
    // set current pixel is black
    @0
    D=M
    A=D
    M=0
    
    // next pixel
    @0
    M=M+1

    // check current pixel is bigger than max screen pixel index
    @0
    D=M
    @1
    D=M-D
    @WHITE_SCREEN
    D;JGT


@LOOP_KEYBOAD
0;JMP