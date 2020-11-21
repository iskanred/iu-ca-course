.data
.text

.globl main


main: # ------------------------------------------------------------------

li $v0, 5				# input Number
syscall
move $a0, $v0

jal sumOf				# sumOf (n);

move $a0, $v0
li $v0, 1				# output result
syscall

# Exit
li $v0, 10 
syscall
# ------------------------------------------------------------------------

sumOf: # ------------------------------------------------------------------
	# $a0 - argument n
	# $v0 - returning result
	
	sub $sp, $sp, 8		 	# allocate space for 2 registers in stack
	sw $ra, 4($sp)			# load return address to stack
	sw $a0, 0($sp)			# load argument n to stack
	
	li $v0, 0 			# $v0 = 0 // result = 0
	
	beq $a0, $zero, base_case	# if (n == 0) return;
	
	addi $a0, $a0, -1		# n = n - 1
	
	jal sumOf			# return sumOf (n - 1)
	
	lw $a0, 0($sp)			# $a0 = original value of n (not n - 1) // n = n
	
	add $v0, $v0, $a0 		# $v0 = n + sumOf(n - 1) // result = n + sumOf (n - 1)

base_case:
	lw $ra 4($sp) 			# restore $ra returning 
	addi $sp, $sp, 8 		# restore $sp
	jr $ra 				# back to caller
# -------------------------------------------------------------------------

