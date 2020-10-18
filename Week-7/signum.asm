.data
.text 
.globl main

main:
# Input integer
li $v0, 5
syscall

move $a0, $v0

jal sgn

move $a0, $v0

# Print integer
li $v0, 1
syscall


#Exit
li $v0, 10 
syscall



sgn: 
move $t0, $ra

bgt $a0 $zero return_positive
beq $a0 $zero return_zero
blt $a0 $zero return_negative

jr $ra

return_positive:
li $v0, 1
jr $ra

return_zero:
li $v0, 0
jr $ra

return_negative:
li $v0, -1
jr $ra