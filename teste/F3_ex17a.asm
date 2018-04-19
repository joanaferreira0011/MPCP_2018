; ebx valor mem primeiro
; ecx length seq
include mpcp.inc
.data
seq dword 2,3,8
res byte "Media arred= %d", 0

.code

main PROC C

mov eax, 0
mov esi, offset seq; end da seq
mov ecx, length seq; length

sum: add eax [ebx]
	 add esi, type seq; atualiza o elemento
	 loop sum

divide: move ebx, length seq
		move edx, 0
		div ebx

;arredondamento: se resto >= 2* divisor, então incrementa o quociente (resultado)

shl ebx, 1; 2* divisor
cmp edx, ebx; resto >= 2*divisor?
jb imprime
inc eax; arredonda para cima

imprime: invoke printf, offset res, eax

main ENDP