; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - address of Array
; Function returns nothing

stage2_flash_array:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

        push{r0-r8}
        mov r4,r1  ; move array size to local register

        ; check if array is empty or not
        cmp r1,0
        beq skip_flash$ ; if empty then skip 
                mov r6,0  ; initialise current index
                mov r7,4  ; number of bytes per value to jump to next

flash_array$:
                mov r1, $200000
                mov r0, BASE
                push{lr}
                bl PAUSE   ; Pause for 2 seconds
                pop{lr}
                        mul r8,r6,r7  ;calculate byte offset  ( byteoffset =  curr_index * 4 bytes)
                        ldr r3,[r2,r8] ; get current indexed value
                        add r6,#1  ; increment current index
                ; prepare to flash answer
                mov r1,r3       ; value to flash
                push{r2}
                mov r2,$80000   ; delay time of ~1 second (ie 1 sec on , 1 sec off)
                push{lr}  ; store current lr before it is overwritten during function call
                bl FLASH   ; call the FLASH function (same as in assignment 2)
                pop{lr} ; restore old lr value  
                pop{r2}
                cmp r6,r4  ; compare current index (r6) with size of array (r4)
                blt flash_array$  ; if current index <  size loop again
        skip_flash$:  ; jump landing point if array was empty

        pop{r0-r8} 
        ; your function should make use of the existing functions FLASH and PAUSE

        bx lr