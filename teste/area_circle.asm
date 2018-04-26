include mpcp.inc

.xmm

.data
raio real8 ?
msg_ler byte "Indique o raio a considerar: ", 0
fml REAL8 "%lf",0
res_LIM byte "A area e %f", 13, 10, 0
pi real8 3.1415926535897932
area real4 ?

.code
invoke scanf, offset fml, offset raio

movesd xmmi0, raio
MULSD  xmmi0, raio
MULSD xmmi0, pi
movesd area, xmmi0

invoke printf, offset msg_ler, area
invoke _getch
invoke ExitProcess, 0

main endp
end
