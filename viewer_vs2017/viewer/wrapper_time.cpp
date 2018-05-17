#include "wrapper.h"
#include <time.h>
#include <wchar.h>

// #define REGISTAR_TEMPO

void wrapper(FUNC_PTR theFunction, void* bits, long largura, long altura)
{
#ifdef REGISTAR_TEMPO
	clock_t startTime, endTime;
	wchar_t msgString[200];
#endif
	if (theFunction == NULL) {
		// mensagem
		MessageBox(NULL, L"Fun��o n�o-definida.", L"Erro", MB_ICONEXCLAMATION | MB_OK);
		return;
	}

	startTime = clock();
	theFunction(bits, largura, altura);
	endTime = clock( ) ;

	double elapsedTime = (endTime - startTime )/ CLOCKS_PER_SEC;
	swprintf(msgString, 200 , L"Dura��o: %f (s)",elapsedTime);
	msgString[199]='\0';
	MessageBox(NULL,msgString, L"Informa��o", MB_OK);
	
	return;
}