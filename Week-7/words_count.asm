.data
	string: .space 500
	string_size: .word 125
.text
.globl main

main: # ------------------------------------------------------------------

# Input String
li $v0, 8 # to input string
lw $a1, string_size # allocate string size space for string
la $a0, string # load buffer space into address
syscall

move $t2, $a0 # $t2 points to string
move $t1, $zero # Counter = 0

li $t4, 32 # previous_char of string. Start value = ' '


Loop: # --------------------------------------------------

	lb $t0, 0($t2) # get char from string


	beq $t0, $zero, EndLoop # if (char == '\0')

	beq $t0, 10, EndLoop # if (char == '\n')
	

	beq $t0, 32, MoveNext # if (char == ' ')

	bne $t4, 32, MoveNext # if (previous_char != ' ')


	# if (current char != ' ' && previous_char == ' ')
	addiu $t1, $t1, 1

MoveNext: 
	move $t4, $t0 # store current char into previous_char
	addi $t2, $t2, 1 # move pointer to the next char
	j Loop
	
EndLoop: # -------------------------------------------------


# Print Words Counter
move $a0, $t1
li $v0, 1
syscall


# Exit
li $v0, 10 
syscall
# ---------------------------------------------------------------------
