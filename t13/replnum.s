	section .text
	global	replnum

replnum:
;========== PROLOG ================
	push	ebp
	mov		ebp, esp

;========== BODY ==================
	mov		eax, [ebp+8]

find_digit:
	mov		dl, [eax]
	test	dl, dl
	jz		finish
;check is_digit() == true
	inc 	eax
	cmp		dl, '9'
	jg		find_digit
	cmp		dl, '0'
	jge		digit_found
	jmp		find_digit

digit_found:
;replacing first digit in digit sequence to a char 
	dec 	eax
	mov		dl, [ebp+12]
	mov		[eax], dl
	mov		ecx, eax
	inc		eax
	push	eax				;safe current address

seq_end:
	inc 	ecx
	mov		dl, [ecx]
	cmp		dl, '9'
	jg		copy_rest
	cmp		dl, '0'
	jge		seq_end

copy_rest:
	mov		dl, [ecx]
	mov		[eax], dl
	inc		ecx
	inc		eax
	test	dl, dl
	jz		copy_finished
	jmp		copy_rest

copy_finished:
	pop		eax
	jmp		find_digit

finish:
	mov		eax, [ebp+8]

;========== EPILOG ================
	pop		ebp
	ret