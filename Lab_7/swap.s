	.text
main:
	la	$a0,n1
	la	$a1,n2
	jal	swap
	li	$v0,1	# print n1 and n2; should be 27 and 14
	lw	$a0,n1
	syscall	
	li	$v0,11	# print character
	li	$a0,' '
	syscall
	li	$v0,1
	lw	$a0,n2
	syscall
	li	$v0,11
	li	$a0,'\n'
	syscall
	li	$v0,10	# exit
	syscall

swap:	# your code goes here	#lslsls
	addi $sp, $sp, -4	# int temp;
	lw $t0, 0($a0)	# n1val is at temp, n2val is NULL
	sw $t0, 0($sp)	# n1val is at stack, n2val is NULL 
	lw $t0, 0($a1)	# n1val is at stack, n2val is at temp
	sw $t0, 0($a0)	# n1val is at stack, n2val is at a0
	lw $t0, 0($sp)	# n1val is at temp, n2val is at a0
	sw $t0, 0($a1)	# n1val is at a1, n2val is at a0. DONE.
	addi $sp, $sp, 4
	jr $ra

	.data
n1:	.word	14
n2:	.word	27

# Q1. It will break when the address inside of junk happens to work, being that the crap inside is just a valid address.
# Q2. 