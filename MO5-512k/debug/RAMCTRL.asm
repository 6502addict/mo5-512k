;-test 74LS273 output of bits 0-7 
	ORG	$9000
LOOP	LDA	#$0C
	STA	$A7CB
	LDA	$B000
	STA	$B000
	LDA	#$40
	STA	$A7CB
	LDA	$B000
	STA	$B000
	BRA	LOOP
	END

