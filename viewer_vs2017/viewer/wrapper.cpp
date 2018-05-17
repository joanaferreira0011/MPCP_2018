// MPCP: invoca fun��o para tratar imagem
// Confirma que fun��o est� definida

#include "wrapper.h"
#include <time.h>
#include <wchar.h>

void wrapper(FUNC_PTR theFunction, void* bits, long largura, long altura)
{
	if (theFunction == NULL) {
		MessageBox(NULL, L"Fun��o n�o-definida.", L"Erro", MB_ICONEXCLAMATION | MB_OK);
		return;
	}
	theFunction((unsigned char *)bits, largura, altura);
	return;
}