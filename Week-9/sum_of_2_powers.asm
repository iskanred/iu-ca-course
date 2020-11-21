.text
.globl main

main: # -------------------------------------------------------------

# Input N: s0
li $v0, 5
syscall
move $s0, $v0

# Result 'res': s1

Loop:
	beq $s0, $zero, EndLoop		# if N == 0: end loop
	
	# res = res + two_in_power(N)
	move $a0, $s0
	jal two_in_power
	add $s1, $s1, $v0
	
	# Next Iteration
	subi $s0, $s0, 1 		# N--
	j Loop
EndLoop:


# Print Result
move $a0, $s1
li $v0, 1
syscall
	
	
# Exit
li $v0, 10
syscall
# -------------------------------------------------------------------


two_in_power:
li $t7, 1
sllv $v0, $t7, $a0
jr $ra

