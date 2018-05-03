include mpcp.inc

.xmm

.data
raio real8 ?
msg_ler byte "Indique o raio a considerar: ", 0
fml REAL8 "%lf",0
res byte "A area e %f", 13, 10, 0
pi real8 3.1415926535897932
area real4 ?

.code

invoke printf, offset msg_ler

invoke scanf, offset fml, offset raio

movsd xmmi0, raio
MULSD  xmmi0, raio
MULSD xmmi0, pi
movsd area, xmmi0

invoke printf, offset res, area
invoke _getch
invoke ExitProcess, 0

main endp
end
