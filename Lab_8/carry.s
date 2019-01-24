	.data
n1:	.word	14
n2:	.word	27	
	.text
main:
	la 	$t0, n1
	la 	$t1, n2
	add	$t3, $t0, $t1
	slt	$t2, $t0, $t2	#Makes t3 hold 1 if n1 < sum
	slt	$t2, $t1, $t2	#Makes t3 hold 1 if n2 < sum

