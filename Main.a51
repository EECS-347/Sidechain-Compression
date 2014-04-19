;Sidechain Compression Main Program

$MOD51 

;Startup code goes here:

;Data
DSEG AT 20h
presetOneGain: DS 1
presetOneThresh: DS 1
presetOneRatio: DS 1
presetOneRelease: DS 1
presetTwoGain: DS 1
presetTwoThresh: DS 1
presetTwoRatio: DS 1
presetTwpRelease: DS 1
presetThreeGain: DS 1
presetThreeThresh: DS 1
presetThreeRatio: DS 1
presetThreeRelease: DS 1

;Code
CSEG AT 0  
start: ljmp init ; Jump around interrupt handlers

;Delay code:
CSEG AT 40h
init: 
    LCALL Delay1sec
    

Delay1sec:                   ; <------------------------------+
        LCALL   Delay1sec    ; 3 cycles                       |
        MOV     R2,#42d      ; 2 cycles                       |
        MOV     R1,#00d      ; 2 cycles                       |
        MOV     R0,#00d      ; 2 cycles                       |
loop:   DJNZ    R0,loop      ; 4 cycles <-- l1 <- l2 <- l3    Delay1sec
        DJNZ    R1,loop      ; 4 cycles <---------+     |     |
        DJNZ    R2,loop      ; 4 cycles <---------------+     |
        RET

;Main loop (reading from rotary encoders, writing to digipots)

;Interrupts from button presses


