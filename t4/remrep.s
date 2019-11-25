	section .text
	global remrep

remrep:
;=========== PROLOG =====================
	push	ebp
	mov		ebp, esp
	mov		eax, [ebp+8]

;=========== BODY =======================
outrem_loop:
	mov		ecx, eax
	mov		dl, [eax]
	test	dl, dl
	jz		finish		;checks end of str

;removing repetitions of currently examined char
	push	eax
	inc		ecx
	inc 	eax
inrem_loop:
	mov		dh, [ecx]
	test	dh, dh
	jz		fin_loop

	cmp		dh, dl		; dh == dl ?
	jnz		copychr

	inc		ecx
	jmp		inrem_loop

copychr:
	mov		[eax], dh
	inc		eax
	inc		ecx
	jmp		inrem_loop

fin_loop:
	mov		[eax], dh
	pop		eax
	inc		eax
	jmp		outrem_loop

finish:
	mov		eax, [ebp+8]
;=========== EPILOG =====================
	pop		ebp
	ret