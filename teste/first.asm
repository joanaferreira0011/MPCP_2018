include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
	val1 word 2 dup()
	val1 word 3 dup()

.code
	mov ax, val1
	mul val2  ; resultado em DX:AX
	shl eax, 16  ; eax <- dx:ax
	mov ax, dx
	ror eax, 16
end