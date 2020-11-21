.data
array: .space 32 			# allocate 32 bytes for 8 4-byte-floats-numbers
.text
.globl main

main: # -------------------------------------------------------------

# Array pointer: t0
# Iteration counter of Loop 'i': t1 
# Result 'min': f2
# Temporary value 'num': f0

la $t0, array				# load addres of array pointer to $t0	
li $t1, 0				# i = 0

fillArrayLoop:	

	beq $t1, 8, endFillLoop 		# if i == 8: end loop
		
	# Input float 'num': f0
	li $v0, 6
	syscall
	
	s.s $f0, ($t0)			# array[i] = num
	
	# Next iteration
	addi $t0, $t0, 4 		# array pointer ++
	addi $t1, $t1, 1			# i++
	j fillArrayLoop

endFillLoop:


la $t0, array				# load addres of array pointer to $t0	
li $t1, 0				# i = 0
l.s $f2, ($t0)				# min = array[0]

findMinLoop:
	beq $t1, 8, endFindLoop 		# if i == 8: end loop
	
	l.s $f0, ($t0)			# num = array[i]
	
	# if !(num < min): move to next iteration
	c.lt.s $f0, $f2			 		
	bc1f FindLoopNextIter
	
	# if num < min:
	mov.s $f2, $f0			# min = num

FindLoopNextIter:
	addi $t0, $t0, 4 		# array pointer ++
	addi $t1, $t1, 1			# i++
	j findMinLoop
endFindLoop:
	
	
# Print Result
mov.s $f12, $f2
li $v0, 2
syscall
	
# Exit
li $v0, 10
syscall
# -------------------------------------------------------------------
