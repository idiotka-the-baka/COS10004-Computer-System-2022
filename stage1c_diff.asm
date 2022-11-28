; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

sub r0, r12, r11; these are the already stored values from previous stage, to calculate the diff we only need to subtract them
         ; this is a place holder - replace "1" with the register holding the return value


         bx lr