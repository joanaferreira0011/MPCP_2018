include mpcp.inc

.data
string byte "loli"
msg byte "%c"

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
