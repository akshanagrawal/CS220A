.data
message: .asciiz "Fibonacci numbers upto 500:\n"
comma: .asciiz " , "
.text
main:
    
	la $a0,message  # message hailed
	li $v0,4
	syscall
		
    move $a0,$0     # initially F0=0 is printed
    li $v0,1
	syscall
	
	addi $t1,$0,1   # store F1 = 1
	addi $t2,$0,1   # store F2 = 1 
	
Iteration:

	bge $t1,500,exit_iteration  # exit if Fibonacci number exceed 500
	add $t3,$t2,$t1             # F(n) = F(n-1) + F(n-2)
	
	la $a0,comma                # print delimiter/comma
	li $v0,4
	syscall

	move $a0,$t1                # print fibonacci numbers  
	li $v0,1
	syscall
	
	addi $t1,$t2,0              # now $t1 stores value of $t2
	addi $t2,$t3,0              # now $t2 stores value of $t3 
	j Iteration                 # back to the iteration loop
	
exit_iteration:                 # exit
	li $v0,10
	syscall
	