!program to find the square root of a number
program squareroot
	
	!declare type 
	real:: guess, nextguess
	integer:: guesscount = 0
	
	!set number to calculate and set tolerance
	real, parameter:: number = 62632.52, tolerance = 0.0005
	
	!https://en.wikibooks.org/wiki/Fortran/Fortran_simple_input_and_output
	!for write to file
	integer, parameter :: out_unit = 20
	
	!create and open text file to write results to
	open (unit = out_unit, file = "results.txt", action = "write", status = "replace")
	
	!initial guess is 1
	guess = 0.0
	nextguess = 1.0
	
	do while(abs(guess - nextguess) >= tolerance)
		guess = nextguess
		guesscount = guesscount + 1
		nextguess = guess - ((guess - (number / guess)) / 2.0)
		write(out_unit, '(a, f13.6)') "The next value is: ", nextguess
	end do
		
	!show results in results.txt
	write(out_unit,'(a, f10.2, a, f10.6)') &
		"The squareroot of ", number, " is ", nextguess
	write(out_unit,'(a, i2)') "The total number of guesses is: ", guesscount
	
	!close file
	close (out_unit)
	
end program squareroot