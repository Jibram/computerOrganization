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
	li	$v0, -1			# Handles case where number does not have a 1.
	beqz	$a0, return		# ^
	li	$v0, 31			# Greatest possible location of a 1.
	li	$t0, 0x80000000		# Mask
loop:
	and	$t1, $a0, $t0		# Bitwise compare and push into t1
	bgtz	$t1, return		# There was a match of ones.
	addi	$v0, $v0, -1		# No match, decrement
	srl	$t0, $t0, 1		# Moves mask all once to the right.
	j loop
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
