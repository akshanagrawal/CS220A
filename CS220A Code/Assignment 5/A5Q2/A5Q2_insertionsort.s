.text


.globl main

main:

#print msg1
li $v0,4
la $a0,msg1
syscall

#take input 10 times

addi $t0,$zero,0
Loop1:
beq $t0, 40, exit1
#print msg2
li $v0,4
la $a0,msg2
syscall
#print index integer
li $v0,1
add $t1,$t0,$zero
addi $t3,$zero,4
div $t1,$t1,$t3
addi $t1,$t1,1
move $a0,$t1
syscall

li $v0,4
la $a0,msg4
syscall

#read ith number
li $v0,5
syscall
move $t1,$v0

sw $t1,array_input($t0)
addi $t0,$t0,4
#print new line
li $v0,4
la $a0,msg3
syscall

j Loop1

exit1:

#print msg5
li $v0,4
la $a0,msg5
syscall
#print integers received
addi $t2,$zero,0
Loop2:
beq $t2,40,exit2
li $v0,1
lw $a0,array_input($t2)
addi $t2,$t2,4
syscall

li $v0,4
la $a0,msg4
syscall
j Loop2

exit2:

#insertion sort
addi $t4,$zero,4    # works as iterator to outer loop (i)

SortLoop1:                                        # outer loop 
beq $t4,40,exitsortloop1
lw $t5,array_input($t4)                               #key_value
addi $t6, $t4,-4                                  # iterator for inner loop j initialised as i-1
addi $t1,$zero,-1
SortLoop2:                                        #inner loop, works for the condition: while (j >= 0 and array_input[j] > key) 
ble $t6,$t1,exitsortloop2                              
lw $t2,array_input($t6)
ble $t2,$t5,exitsortloop2
addi $t3,$zero,0                                     
addi $t7,$t6,4
sw $t2,array_input($t7)                                #array_input[j+1] = array_input[j]
addi $t6,$t6,-4                                    # decrement j
j SortLoop2                                         
exitsortloop2:
addi $t7,$t6,4                                     
sw $t5,array_input($t7)                                #array_input[j+1]=key_value 
addi $t4,$t4,4                                     #increment i
j SortLoop1
exitsortloop1:


#print msg3
li $v0,4
la $a0,msg3
syscall
#print msg6
li $v0,4
la $a0,msg6
syscall
#print integers received
addi $t2,$zero,0
printsorted:
beq $t2,40,exit2print
li $v0,1
lw $a0,array_input($t2)
addi $t2,$t2,4
syscall

li $v0,4
la $a0,msg4
syscall
j printsorted

exit2print:
li $v0,10
syscall

.data

msg1: .asciiz "Reading 10 integers into array\n"
array_input: .word 0:10                                #initialized to 0 and number of elements is 10
msg2: .asciiz "give integer"
msg3: .asciiz "\n"
msg4: .asciiz " "
msg5: .asciiz "Original array:\n"
msg6: .asciiz "Sorted array:\n" 