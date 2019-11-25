	section .text
	global _remnth

_remnth:
;=================PROLOG======================
	push	ebp
	mov		ebp, esp
	sub		esp, 4			

;=================BODY========================
	
	mov		eax, [ebp+8]
	mov		ecx, [ebp-4]
	xor		ecx, ecx		;zero cnt
	mov		[ebp-4], ecx
	mov		ecx, [ebp+8]	;set pointer on the beggining
nextchr:
	mov		dl, [ecx]
	test	dl, dl
	jz		finish			;checks if end of string
	
	push	ecx
	mov		ecx, [ebp-4]
	inc		ecx				;increase cnt
	mov		[ebp-4], ecx
	cmp		ecx, [ebp+12]	
	je		remove_chr		

copy:
	pop		ecx
	mov		[eax], dl
	inc		eax
	inc		ecx
	jmp		nextchr

remove_chr:
	xor		ecx, ecx
	mov		[ebp-4], ecx
	pop		ecx
	inc		ecx
	jmp		nextchr

finish:
	mov		[eax], dl
	mov		eax, [ebp+8]
	
;=================EPILOG======================
	mov		esp, ebp
	pop		ebp
	ret