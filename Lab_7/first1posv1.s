main:
	lui	$a0,0x8000
	jal	first1pos
	jal	printv0
	lui	$a0,0x0001
	jal	first1pos
	jal	printv0
	li	$a0,1
	jal	first1pos
	jal	printv0
	add	$a0,$0,$0
	jal	first1pos
	jal	printv0
	li	$v0,10
	syscall

first1pos:	# your code goes here
	addi $v0, $0, 31	#v0 = 31
	bltz $a0, return	#v0 < 0, therefore leading bit is 1 since it's negative.
loop:
	addi $v0, $v0, -1	#v0 = v0 - 1
	bltz $v0, return
	sll $a0, $a0, 1		#Shift left.
	bltz $a0, return	#Return if negative.
	j loop			#Loops if positive
return:
	jr $ra

printv0:
	addi	$sp,$sp,-4
	sw	$ra,0($sp)
	add	$a0,$v0,$0
	li	$v0,1
	syscall
	li	$v0,11
	li	$a0,'\n'
	syscall
	lw	$ra,0($sp)
	addi	$sp,$sp,4
	jr	$ra
