.text
.globl main
main:
li $v0, 4
la $a0, message1  # hailing message 1
syscall

li $v0, 5
syscall
move $s1, $v0     # s1 stores p

la $t0, floating_array
li $t1, 0         # let t1 contain address of a[0]
addi $t2, $0, 0   # let t2 be 0, used later for hailing message 2 through a conditional statement

###############################################

loop1:

ble $s1,$t1, result # goto result if s1<=t1
li $v0, 6
syscall
swc1 $f0, 0($t0)    # store word to floating point
addi $t0, $t0, 4    # add 4 to t0
addi $t1, $t1, 1    # add 1 to t1
j loop1             # jump back to loop1

################################################

result:

addi $t2, $t2, 1       # add 1 to t2
ble  $t2, 1, display   # goto display if t2<=1
mtc1 $0, $f12          # move instruction
la $t0, floating_array # t0 conatins address of a[0]
li $t1, 0
li $t3, 0  

################################################

loop2:

ble $s1, $t1, exit     # goto exit if s1<=t1
lwc1 $f1, 0($t0)       # load word into coprocessor
bne $t3, $0, minus     # goto minus if t3! = 0
li $t3,1
add.s $f12,$f12, $f1   # single point float addition
j evaluate             # jump to evaluate

#################################################

minus:

li $t3,0
sub.s $f12,$f12, $f1   # single point float subtraction

#################################################


evaluate:

addi $t0,$t0, 4        # add immediate 4 to t0
addi $t1,$t1, 1        # add immediate 1 to t1
j loop2                # jump back to loop2

##################################################

display:                 

li $v0, 4
la $a0, message2       # hailing message2  
syscall
j result

##################################################

exit:                  # exit 

li $v0, 2
syscall
jr $ra

##################################################

.data
floating_array: .space 40
message1: .asciiz "Enter the value of p and then the elements:\n"
message2: .asciiz "Output is:"