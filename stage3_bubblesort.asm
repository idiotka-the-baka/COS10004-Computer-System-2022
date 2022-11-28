; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - address of array
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push{r0-r12}
        mov r10,r0  ; move array size to local register

        ; check if array is empty or not
        cmp r0,0
        beq skip_bubble$ ; if empty then skip sum
        mov r7,4  ; number of bytes per value to jump to next
        bubblesort_start$:
        mov r3, #0 ;index
        mov r4, #0 ;next index number
        mov r6, #0 ;number of swaps
        bubblesort_loop$:
        mov r12, r3 ;store r3 to r12
        add r4, r3, #1 ;put the "index +1 into r3"
        mov r3, r12 ;take the index out again
        ;begin the comparision
        cmp r4, r10 ;compare: if we reach the end of the array or not
        bge bubblesort_check$ ; check for the array, if met the condition => skip the comparision for optimize. 
        mul r8,r3,r7  ;calculate byte offset  ( byteoffset =  curr_index * 4 bytes)
        mul r9,r4,r7  ;calculate byte offset  ( byteoffset =  curr_index * 4 bytes)
        ldr r5, [r1, r8]
        ldr r11, [r1, r9];take 2 inputs from array
        cmp r5, r11 ;compare 2 values
        strgt r5, [r1, r9]
        strgt r11, [r1, r8]; swap if there is something greater than
        addgt r6, #1 ; add the comparision point
        mov r3, r4 ; increase by 1 level
        b bubblesort_loop$ ; call itself, do it again
        bubblesort_check$:
        cmp r6, #0 ;check of changes in this loop?
        subgt r10, #1 ; since 1 number is in the correct order, subtract it to 1
        bgt bubblesort_start$ ;if there were changes, not done, we have to do it again!

        ; your function must mov the address of the sorted array to r0
        skip_bubble$:
        pop{r0-r12}
        ; Stage 2 function call  (flash the contents of numarray1) (same as Kernel file)
mov r0,BASE ; pass peripheral base address
mov r1,r8  ; size of arrays
adr r2,numarray1
bl stage2_flash_array

mov r1, $200000
mov r0, BASE
bl PAUSE   ; Pause for 2 seconds

         bx lr
