	section .text
	global getdec

getdec:
;========== PROLOG ======================
	push	ebp
	mov		ebp, esp
	sub		esp, 8

;========== BODY ========================
	mov		eax, 0
	mov		[ebp-4], eax
	mov		[ebp-8], eax
	mov		eax, [ebp+8]
find_uint:
	mov		dl, [eax]
	test	dl, dl
	jz		finish

	inc		eax
;checks if is_digit() == true
	cmp		dl, '9'
	jg		find_uint
	cmp		dl, '0'
	jge		first_digit
	jmp 	find_uint	

first_digit:
	dec 	eax
	mov		[ebp-4], eax

find_last_digit:
	inc		eax
	mov		dl, [eax]

;checks if is_digit() == true
	cmp		dl, '9'
	jg		output_atoi
	cmp		dl, '0'
	jge		find_last_digit	

output_atoi:
	mov		[ebp-8], eax
	mov		ecx, [ebp-4]
	xor		eax, eax
	xor		edx, edx

convert:
	mov		dl, [ecx]
	sub		dl, '0'
	add		eax, edx
	inc		ecx
	cmp		ecx, [ebp-8]
	je 		finish
	mov		edx, 10
	mul		edx
	jmp 	convert


finish:
;========== EPILOG ======================
	mov	esp, ebp
	pop ebp
	ret