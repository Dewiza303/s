	section .text
	global _removerng

_removerng:
;=================PROLOG======================
	push 	ebp
	mov 	ebp, esp
	mov		eax, [ebp+8]	;pointer used to copy values
	mov		ecx, [ebp+8]	;pointer used to examine char value
	
;=================BODY========================
removing:
	mov		dl, [ecx]
;checks end of str
	test	dl, dl
	jz		finish
;checks if current char > lowerbound
	cmp		dl, [ebp+12]
	jge		check_upperbound

copychr:
	mov		[eax], dl
	inc		eax
	inc		ecx
	jmp		removing


check_upperbound:
	cmp		dl, [ebp+16] 			;char < upperbound
	jg		copychr
	inc		ecx
	jmp 	removing

finish:
	mov		dl, [ecx]
	mov		[eax], dl	;copy end of str character
	mov		eax, [ebp+8]	;set to start of str

;=================EPILOG======================
	pop		ebp
	ret
