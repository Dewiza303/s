	section .text
	global leavelongestnum

leavelongestnum:
;=========== PROLOG ===========================
	push	ebp
	mov		ebp, esp
	sub		esp, 16

;=========== BODY =============================
	mov 	eax, [ebp+8]
	mov		[ebp-4], eax
	mov		[ebp-8], eax

loop:
	mov		dl, [eax]
	test	dl, dl
	jz		finish
	inc 	eax

;checks if char is_digit()
	cmp		dl, '9'
	jg		loop
	cmp		dl, '0'
	jge		digit_found

	jmp		loop

digit_found:
	dec 	eax
	mov		[ebp-12], eax		;inserting new first

dig_subsequence:	
	inc 	eax
	mov		dl, [eax]
	cmp		dl, '9'
	jg		subseq_end
	cmp		dl, '0'
	jge		dig_subsequence

subseq_end:
	mov		[ebp-16], eax		;inserting new last

;compare sequence length with previoulsy found
	sub 	eax, [ebp-12]
	mov		ecx, [ebp-8]
	sub 	ecx, [ebp-4]
	cmp 	eax, ecx
	jg 		new_max_found
	mov		eax, [ebp-16]
	jmp		loop

new_max_found:
	mov		eax, [ebp-12]
	mov		[ebp-4], eax
	mov		eax, [ebp-16]
	mov		[ebp-8], eax
	mov		eax, [ebp-16]
	jmp		loop


finish:	;insert indicator of an end of str
	mov		eax, [ebp-8]
	mov		[eax], dl
	mov		eax, [ebp-4]

;=========== EPILOG ===========================
	mov		esp, ebp
	pop		ebp
	ret