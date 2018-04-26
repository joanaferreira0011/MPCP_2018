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

MAXFREQ proc (register....)   ptseq: ptr sword, nelem: dword
.........
MAXFREQ ENDP
...

LIM proc pt.seq:ptr sword, nelem: dword, limite: sword
......
LIM endp

main PROC c

invoke printf, offset msg_ler
invoke scanf, offset fmt_ler, offset valor
invoke LIM, offset seq, lengthof seq, valor

main endp
end
