include mpcp.inc

MAXFREQ proto ptseq:ptr sword, nelem: dword
LONGSEQ proto ptseq:ptr sword, nelem: dword
LIM proto ptseq: ptr sword, nelem: dword, limite: sword

.data
seq sword 1, 20, -5, 7, 15
valor sword		
msg_ler byte "Indique o limite a considerar: ", 0
fmt_ler byte "%d",0
res_LIM byte "N. elementos superiores a%d e igual a %d", 13, 10, 0

.code

main PROC c
mov ecx, lengthof string  
mov esi, offset string


push_words: movzx edx,byte ptr[esi]
			push edx
			inc esi
			loop push_words

mov ecx, LENGTHOF string 

Pop_words: pop ebx
		   push ecx    ;;;;;;;;printf estraga ecx, por isso guarda-se valor na pilha e depois volta se a ver
		   invoke printf, offset msg, bl
		   pop ecx
		   loop Pop_words
invoke _getch
invoke ExitProcess, 0

main endp
end
