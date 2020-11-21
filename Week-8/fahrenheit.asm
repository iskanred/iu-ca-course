.data
thirtyTwoPtZero: .float 32.0
fivePtZero: .float 5.0
ninePtZero: .float 9.0
.text

.globl main

main: # ------------------------------------------------------------------

li $v0, 6 		# input Fahrenheit | it is in $f0
syscall


l.s $f1, thirtyTwoPtZero
l.s $f2, fivePtZero
l.s $f3, ninePtZero

sub.s $f4, $f0, $f1 	# F - 32.0
mul.s $f4, $f4, $f2  	# (F - 32.0) * 5.0
div.s $f4, $f4, $f3	# (F - 32.0) * 5.0 / 9.0


mov.s $f12, $f4
li $v0, 2
syscall


# Exit
li $v0, 10 
syscall
# ------------------------------------------------------------------------
