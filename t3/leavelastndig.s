	section .text
	global leavelastndig

leavelastndig:
;============ PROLOG ======================
	push	ebp
	mov		ebp, esp
	mov		eax, [ebp+8]
	mov		ecx, [ebp+12]

;============ BODY ========================
fend:
	mov		dl, [eax]
	test	dl, dl		
	jz		end_found	;checks if end of str
	inc		eax
	jmp		fend

end_found:
	dec		eax
	cmp		eax, [ebp+8]
	jz		finish
	dec		ecx
	jnz		end_found

finish: 

;============ EPILOG ======================
	pop ebp
	ret