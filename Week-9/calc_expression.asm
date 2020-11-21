.data 

f5p4: .float 5.4
f12p3: .float 12.3
f18p23: .float 18.23
f8p23: .float 8.23

.text
.globl main

main: # -------------------------------------------------------------

# Input x: f1
li $v0, 6	
syscall
mov.s $f1, $f0

# Input y: f2
li $v0, 6	
syscall
mov.s $f2, $f0


# Result 'res': f4
# Temorary value from memory 'temp': f3

l.s $f3, f5p4		# temp = 5.4
mul.s $f4, $f1, $f2	# res = x * y
mul.s $f4, $f4, $f3	# res = 5.4 * x * y


l.s $f3, f12p3		# temp = 12.3
mul.s $f3, $f3, $f2	# temp = 12.3 * y
sub.s $f4, $f4, $f3	# res = res - temp // 5.4xy - 12.3y


l.s $f3, f18p23		# temp = 18.23
mul.s $f3, $f3, $f1	# temp = 18.23 * x
add.s $f4, $f4, $f3	# res = res + temp // 5.4xy - 12.3y + 18.23x

l.s $f3, f8p23		# temp = 18.23
sub.s $f4, $f4, $f3 	# res = res - temp // 5.4xy - 12.3y + 18.23x - 8.23


# Print Result
mov.s $f12, $f4
li $v0, 2
syscall
	
	
# Exit
li $v0, 10
syscall
# -------------------------------------------------------------------