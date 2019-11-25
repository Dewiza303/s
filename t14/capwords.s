	section .text
	global capwords

capwords:
;============ PROLOG ============================
	push	ebp
	mov		ebp, esp

;============ BODY ==============================
	mov		eax, [ebp+8]

find_first_char:
	mov		dl, [eax]
;checks end of string
	test	dl, dl
	jz		finish

	inc eax
;checks is_letter() == true
	cmp		dl, 'z'
	jg		find_first_char
	cmp		dl, 'a'
	jge		capitalize
	cmp		dl, 'Z'
	jg 		find_first_char
	cmp		dl, 'A'
	jge		find_space
	jmp		find_first_char

capitalize:
	sub		dl, 'a'
	add		dl, 'A'
	dec		eax
	mov		[eax], dl
	inc 	eax

find_space:
	mov		dl, [eax]
	inc		eax
	cmp		dl, ' '
	je 		find_first_char
	jmp 	find_space 	


finish:
	mov		eax, [ebp+8]
;============ EPILOG ============================
	pop 	ebp
	ret