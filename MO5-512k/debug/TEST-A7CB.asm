;-test A7CB chip select
	ORG	$9000
LOOP	LDA	$A7CB
	BRA	LOOP
	END

