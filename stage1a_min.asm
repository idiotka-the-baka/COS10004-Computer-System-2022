; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
         cmp r0, r1
        movlt r4, r0
        cmp r1, r0
        movlt r4, r1
        cmp r4, r2
        movlt r5, r4
        cmp r2, r4
        movlt r5, r2
         ; this is a place holder - replace "1" with the register holding the return value
        mov r0, r5
        mov r11, r5

         bx lr