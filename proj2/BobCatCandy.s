.data 
str0:		.asciiz "Welcome to BobCat Candy, home to the famous BobCat Bars!\n"
#Introduction strings
str1:		.asciiz "Please enter the price of BobCat Bar:\n"
str2:		.asciiz "Please enter the number of wrappers needed to exchange for a new bar:\n"
str3:		.asciiz "How. how much do you have?\n"
str4:		.asciiz "Good! Let me run the number ...\n"
str5_1:		.asciiz "First you buy "
str5_2:		.asciiz " bars.\n"
str6_1:		.asciiz "Then, you will get another "
str6_2:		.asciiz " bars.\n"
str7_1:		.asciiz "With $"
str7_2:		.asciiz ", you will receive a maximum of "
str7_3:		.asciiz " BobCat Bars!"

.text

# PRICE, WRAPPERS, MONEY

main:
		#This is the main program.
		#It first asks user to enter the price of each BobCat Bar.
		#It then asks user to enter the number of bar wrappers needed to exchange for a new bar.
		#It then asks user to enter how much money he/she has.
		#It then calls maxBars function to perform calculation of the maximum BobCat Bars the user will receive based on the information entered. 
		#It then prints out a statement about the maximum BobCat Bars the user will receive.
		
		# Implement your main here
		
		# Introduction
		li	$v0, 4
		la	$a0, str0 
		syscall
		
		# Print request for PRICE of BobCat Bar
		la	$a0, str1
		syscall
		
		# Recieve PRICE of BobCat Bar
		li	$v0, 5
		syscall
		add	$s0, $v0, $zero	# Save PRICE of bobcat bar
		
		# Print request for number of WRAPPERS needed for exchange
		li	$v0, 4
		la	$a0, str2
		syscall

		# Recieve number of WRAPPERS needed for exchange
		li	$v0, 5
		syscall	
		add	$s1, $v0, $zero	# Save number of WRAPPERS needed for exchange

		# Print request for amount of MONEY
		li	$v0, 4
		la	$a0, str3
		syscall

		# Recieve amount of MONEY
		li	$v0, 5
		syscall	
		add	$s2, $v0, $zero	# Save amount of MONEY
		
		add	$a0, $s1, $zero # n wrappers
		add	$a1, $s0, $zero # price of bar
		add	$a2, $s2, $zero # money

		jal 	maxBars 	# Call maxBars to calculate the maximum number of BobCat Bars
		add	$s3, $v0, $zero	# Save maxBars
		
		# Print out final statement here
		li	$v0, 4
		la	$a0, str7_1
		syscall
		
		li	$v0, 1
		add	$a0, $s2, $zero
		syscall

		li	$v0, 4
		la	$a0, str7_2
		syscall
		
		li	$v0, 1
		add	$a0, $s3, $zero
		syscall
		
		li	$v0, 4
		la	$a0, str7_3
		syscall
		
		j 	end			# Jump to end of program



maxBars:
		# This function calculates the maximum number of BobCat Bars.
		# It takes in 3 arguments ($a0, $a1, $a2) as n, price, and money. It returns the maximum number of bars
		
		# Prologue
		addi	$sp, $sp, -12
		sw	$ra, 0($sp)	# Address
		sw	$a0, 4($sp)	# n
		
		# Calculation
		div	$a2, $a1	# money/price
		mflo	$t0		# holds the first amount of bars
		sw	$t0, 8($sp)	# number of bars
		
		# Print initial bars amount
		li	$v0, 4
		la	$a0, str5_1
		syscall
		
		li	$v0, 1
		lw	$a0, 8($sp)	# Number of bars
		syscall
		
		li	$v0, 4
		la	$a0, str5_2	
		syscall
		# End of print statement
		
		lw	$a0, 8($sp)	# Number of bars
		lw	$a1, 4($sp)	# n
		jal 	newBars 	# Call a helper function to keep track of the number of bars.
		
		# Need to add the number of bars in new bars to here.
		lw	$t0, 8($sp)
		add	$v0, $v0, $t0
		
		# Epilogue
		lw	$ra, 0($sp)
		add	$sp, $sp, 12
		jr 	$ra
		# End of maxBars

newBars:
		# This function calculates the number of BobCat Bars a user will receive based on n.
		# It takes in 2 arguments ($a0, $a1) as number of bars so far and n.
		add	$sp, $sp, -16
		sw	$ra, 0($sp)
		sw	$a0, 4($sp)	# number of bars so far
		sw	$a1, 8($sp)	# n wrappers
		
		div	$a0, $a1	# newBars/nWrappers
		mflo	$t0		# newNewBars
		sw	$t0, 12($sp)
		
		# Print new bar amount this round
		li	$v0, 4
		la	$a0, str6_1
		syscall
		
		li	$v0, 1
		add	$a0, $t0, $zero	# Number of bars
		syscall
		
		li	$v0, 4
		la	$a0, str6_2	
		syscall
		# End of print statement
		
		lw	$a0, 12($sp)
		lw	$a1, 8($sp)

		li	$v0, 0
		blt	$a0, $a1 done
		
		jal	newBars
		
done:
		lw	$t0, 12($sp)	# Number of new bars
		add	$v0, $v0, $t0
		
		lw	$ra, 0($sp)
		add	$sp, $sp, 16
		jr 	$ra
		# End of newBars

end: 
		# Terminating the program
		lw $ra, 0($sp)
		addi $sp, $sp 4
		li $v0, 10 
		syscall
