;-test 74LS273 output of bits 0-7 
	ORG	$9000
LOOP	LDA	#$00
	STA	$A7CB
	LDA	#$01
	STA	$A7CB
	LDA	#$02
	STA	$A7CB
	LDA	#$04
	STA	$A7CB
	LDA	#$08
	STA	$A7CB
	LDA	#$10
	STA	$A7CB
	LDA	#$20
	STA	$A7CB
	LDA	#$40
	STA	$A7CB
	BRA	LOOP
	END

