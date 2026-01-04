$MOD51 ; THIS INCLUDES 8051 DEFINITIONS FOR THE METALINK ASSEMBLER

; ------------------------------------
; Interrupt Vector Table
; ------------------------------------
ORG 0000H
    LJMP MAIN

ORG 0003H
    LJMP INT0_MIN_RESET

ORG 0013H
    LJMP INT1_HOUR_RESET

ORG 0030H
; ------------------------------------
; Main Program
; ------------------------------------
MAIN:
    SETB EA
    SETB EX0
    SETB EX1
    MOV TMOD, #01H
    MOV P0, #00
    MOV P1, #00
    MOV P2, #00

CLOCK_LOOP:
    MOV R6, #01         ; Hour counter
    MOV R7, #24         ; Hour loop count

HOUR_LOOP:
    MOV R4, #01         ; Minute counter
    MOV R5, #60         ; Minute loop count

MINUTE_LOOP:
    MOV R2, #01         ; Second counter
    MOV R3, #60         ; Second loop count

SECOND_LOOP:
        LCALL DELAY

        MOV A, R2
        XRL A, #60
        JNZ SKIP_SEC_RESET
        MOV R2, #00
SKIP_SEC_RESET:
        MOV A, R2
        JB P3.4, $
        LCALL BIN_TO_BCD
        MOV P0, A
        INC R2
    DJNZ R3, SECOND_LOOP

    MOV A, R4
    XRL A, #60
    JNZ SKIP_MIN_RESET
    MOV R4, #00
SKIP_MIN_RESET:
    MOV A, R4
    LCALL BIN_TO_BCD
    MOV P1, A
    INC R4
DJNZ R5, MINUTE_LOOP

    MOV A, R6
    XRL A, #24
    JNZ SKIP_HOUR_RESET
    MOV R6, #00
SKIP_HOUR_RESET:
    MOV A, R6
    LCALL BIN_TO_BCD
    MOV P2, A
    INC R6
DJNZ R7, HOUR_LOOP

    JMP CLOCK_LOOP

; ------------------------------------
; Delay Subroutine (~1 sec)
; ------------------------------------
DELAY:
    MOV R0, #40H
DELAY_LOOP:
    MOV TL0, #LOW(-27)
    MOV TH0, #HIGH(-27)
    SETB TR0
    JNB TF0, $
    CLR TF0
    DJNZ R0, DELAY_LOOP
    CLR TR0
    RET

; ------------------------------------
; Binary to BCD Conversion
; ------------------------------------
BIN_TO_BCD:
    MOV B, #10
    DIV AB
    SWAP A
    ORL A, B
    RET

; ------------------------------------
; External Interrupt 0 ??? Reset Minutes
; ------------------------------------
ORG 0200H
INT0_MIN_RESET:
    JNB P3.4, RETURN_INT0
    MOV 31H, A
    MOV 32H, B
    CLR EX0
    CLR EX1

    MOV A, R4
    XRL A, #60
    JNZ SKIP_MIN_RESET_INT
    MOV R4, #00
SKIP_MIN_RESET_INT:
    MOV A, R4
    LCALL BIN_TO_BCD
    MOV P1, A
    MOV A, #60
    SUBB A, R4
    MOV R5, A
    INC R4

    MOV A, 31H
    MOV B, 32H
    SETB EX0
    SETB EX1
RETURN_INT0:
    RETI

; ------------------------------------
; External Interrupt 1 ??? Reset Hours
; ------------------------------------
ORG 0250H
INT1_HOUR_RESET:
    JNB P3.4, RETURN_INT1
    MOV 33H, A
    MOV 34H, B
    CLR EX0
    CLR EX1

    MOV A, R6
    XRL A, #24
    JNZ SKIP_HOUR_RESET_INT
    MOV R6, #00
SKIP_HOUR_RESET_INT:
    MOV A, R6
    LCALL BIN_TO_BCD
    MOV P2, A
    MOV A, #24
    SUBB A, R6
    MOV R7, A
    INC R6

    MOV A, 33H
    MOV B, 34H
    SETB EX0
    SETB EX1
RETURN_INT1:
    RETI

END