# f = (g+t) - (i+j)
# f = s0
# $s1 = g = 2
# $s2 = h = 3
# $s3 = i = 4
# $s4 = j = 5
.text
	addi $s1, $zero, 5
	addi $s2, $zero, 4
	addi $s3, $zero, 3
	addi $s4, $zero, 2
	add $t0, $s1, $s2
	add $t1, $s3, $s4
	sub $s0, $t0, $t1
	
	
	addi $v0,$zero,1 # $sv0 = 1
	add $a0,$zero,$s0
	syscall