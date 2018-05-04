include mpcp.inc
.xmm

.data
yup REAL4 1.0, 20.0, 5.0, 7.0, 15.0, 2.0, 3.0, 1.0 ;test
alpha REAL4 2.0

.code

scaleSeq PROC seq:PTR REAL4, N:DWORD, alfa:REAL4
	mov ecx, N
	mov eax, seq

	movss xmm1, alfa
	SHUFPS xmm1, xmm1, 00000000b

	mult: MOVAPS xmm0, [eax]
		 MULPS xmm0, xmm1
		 movaps [eax], xmm0
		add eax, 16
		loop mult

	ret
	scaleSeq endp

main PROC C
	invoke scaleSeq offset yup, 2, alpha
	main endp
	end