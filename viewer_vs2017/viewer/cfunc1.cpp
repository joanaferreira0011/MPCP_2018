// MPCP: fun��o 1 para tratamento de imagens
// 
#include "func.h"
#include <windows.h>
#include <wincodec.h>
#include <windowsx.h>
#include <commdlg.h>
#include <stdio.h>

// Cada pixel ocupa 4 bytes: (MSB) Transpar�ncia | Vermelho | Verde | Azul  (LSB)
// Cada componente � representado por n�mero sem sinal (unsigned char)
// Valor m�nimo: 0; Valor m�ximo: 255

typedef unsigned int media_t;
//typedef unsigned char media_t;

// Convers�o para n�veis de cinzento
// Cada componente RGB � tornada igual � m�dia das comopnentes
void cfunc1(unsigned char *pixels, long largura, long altura)
{
	unsigned char *linha;
	
	for (int j = 0; j < altura; j++) {
		linha = pixels + (j*largura*BYTES_PER_PIXEL);
		for (int i = 0; i < largura*BYTES_PER_PIXEL; i += BYTES_PER_PIXEL) {
			media_t media;					// calcular m�dia; n�o usar vari�veis "unsigned char"
											// para evitar overflow!
			media = (media_t) linha[i] + (media_t) linha[i+1] + (media_t) linha[i+2];
			media = media / 3;
			linha[i] = (unsigned char) media;		// Azul (B)
			linha[i+1] = (unsigned char) media;     // Verde (G)
			linha[i+2] = (unsigned char) media;		// Vermelho (R)
			linha[i+3] = 255;					    // transpar�ncia
		}
	}
	// MessageBox(NULL, L"Fun��o 1 invocada!", L"Fun��o 1", MB_ICONEXCLAMATION | MB_OK);
	return;
}

/* 
			linha[i] = 0;		// Azul (B)
			linha[i+1] = 0;     // Verde (G)
			linha[i+2] = 255;   // Vermelho (R)
			linha[i+3] = 0;		// transpar�ncia
*/