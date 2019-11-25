	section .text
	global reversedig

reversedig:
;=========== PROLOG ======================
	push	ebp
	mov		ebp, esp

;=========== BODY ========================
	mov		eax, [ebp+8]	;lptr
	mov		ecx, [ebp+8]	;rptr

find_end:
	mov 	dl, [ecx]
	test	dl, dl
	jz		move_lptr
	inc		ecx
	jmp		find_end

move_lptr:
	cmp		eax, ecx
	jge		finish

	mov 	dl, [eax]
	inc		eax
	cmp		dl, '9'
	jg   	move_lptr
	cmp		dl, '0'
	jge		move_rptr		;if we find digit eax point to the next char so we need to decrement
	jmp		move_lptr

move_rptr:
	cmp		eax, ecx
	jg		finish

	mov 	dl, [ecx]
	dec 	ecx
	cmp		dl, '9'
	jg  	move_rptr
	cmp 	dl, '0'
	jge 	swap
	jmp		move_rptr

swap:
	dec 	eax
	inc		ecx
	mov 	dh, [eax]
	mov 	[eax], dl
	mov 	[ecx], dh
	inc		eax
	dec 	ecx
	jmp 	move_lptr

finish:
	mov 	eax, [ebp+8]

;=========== EPILOG ======================
	pop 	ebp
	ret