.data
msg: .asciiz " "

.text
.globl main

main:

# first Fib nums
li $t0, 1
li $t1, 1

# i = 0
li $t7, 0

# Print 1st Fib Num
move $a0, $t0
li $v0, 1
syscall 
# Print Space
la $a0, msg
li $v0, 4
syscall

# Print 2nd Fib Num
move $a0, $t1
li $v0, 1
syscall 
# Print Space
la $a0, msg
li $v0, 4
syscall

For: 
#begin
	move $t2, $t1 # tmp = f(n-2)
	add $t1, $t1, $t0 # f(n - 1) = f(n-1) + f(n-2)
	move $t0, $t2 # f(n-2) = tmp

	# Print current Fib num
	move $a0, $t1
	li $v0, 1
	syscall 
	
	# Print Space
	la $a0, msg
	li $v0, 4
	syscall

	addi $t7, $t7, 1 # i++
	blt $t7, 8, For # If (i < 10) branch to For
# end


li $v0, 10 # Exit program
syscall
