#include <iostream>
#include <iomanip>
#include <math.h>
#include <string.h>

#define NUMERO 4
#define _USE_MATH_DEFINES

using namespace std;
void imprimirMatriz(float matriz[][NUMERO]);
void menorFila(float matriz[][NUMERO]);
void restarFila(float matriz[][NUMERO],int fila,int resta);
void menorColumna(float matriz[][NUMERO]);
void restarColumna(float matriz[][NUMERO],int fila,int resta);
void lineas(float matriz[][NUMERO]);
void eliminarFilas(float matriz[][NUMERO], int aplicar, bool pasa, int &cantidadLineas);
void eliminarColumnas(float matriz[][NUMERO], int aplicar, bool pasa, int &cantidadLineas);
void asignacion(float matriz[][NUMERO], int cantidadCeros, int libres[][2],int n);
int existenLibres(int libres[][2]);
int buscarLibre(int libres[][2], int guarda);
int menorMatriz(float matrizCopia[][NUMERO]);

int main()
{
    float matriz[NUMERO][NUMERO] = {{14,5,8,7},
                                    {2,12,6,5},
                                    {7,8,3,9},
                                    {2,4,6,10}};
    float resultado[NUMERO] = {1,1,1,1};
    int libres[NUMERO][2] = {{-1,-1}, {-1,-1}, {-1,-1},{-1,-1}};
    int n=0;
    imprimirMatriz(matriz);
    menorFila(matriz);
    menorColumna(matriz);
    imprimirMatriz(matriz);
    lineas(matriz);
    asignacion(matriz,1, libres,n);
    return 0;
}

void imprimirMatriz(float matriz[][NUMERO]){
    for(int i=0; i<NUMERO; i++){
        for(int j=0; j<NUMERO; j++){
            cout<<matriz[i][j]<<" ";
        }
        cout<<endl;
    }
    cout<<"--------------------------"<<endl;

}

void menorFila(float matriz[][NUMERO]){
    int minimoI =0, minimoJ =0, minimor = 99;
    for(int i=0; i<NUMERO; i++){
        for(int j=0; j<NUMERO; j++){
            if(matriz[i][j]<minimor){
                minimoI = i;
                minimoJ = j;
                minimor = matriz[i][j];
            }
        }
        restarFila(matriz,i,minimor);
        minimor = 99;

    }

}

void restarFila(float matriz[][NUMERO],int fila,int resta){

    for(int i=0; i<NUMERO; i++){
        matriz[fila][i] = matriz[fila][i] - resta;
    }

}

void menorColumna(float matriz[][NUMERO]){
    int minimoI =0, minimoJ =0, minimor = 99;
    for(int i=0; i<NUMERO; i++){
        for(int j=0; j<NUMERO; j++){
            if(matriz[j][i]<minimor){
                minimoI = i;
                minimoJ = j;
                minimor = matriz[j][i];
            }
        }
        restarColumna(matriz,i,minimor);
        minimor = 99;

    }

}

void restarColumna(float matriz[][NUMERO],int fila,int resta){

    for(int i=0; i<NUMERO; i++){
        matriz[i][fila] = matriz[i][fila] - resta;
    }

}

void lineas(float matriz[][NUMERO]){
    float matrizCopia[NUMERO][NUMERO];
    int cantidadLineas =0 ;
    int contaI = 0, contaJ = 0;
    int filas[NUMERO]={-1,-1,-1,-1}, columnas[NUMERO]={-1,-1,-1,-1};
    int menor =0;

    for(int i=0; i<NUMERO; i++){
        for(int j=0; j<NUMERO; j++){
            matrizCopia[i][j] = matriz[i][j];
        }
    }

    eliminarFilas(matrizCopia, NUMERO, false, cantidadLineas);
    eliminarColumnas(matrizCopia, NUMERO, false, cantidadLineas);
    eliminarFilas(matrizCopia, 1, true, cantidadLineas);
    eliminarColumnas(matrizCopia, 1, true, cantidadLineas);

    menor = menorMatriz(matrizCopia);
    if(cantidadLineas < NUMERO){
        for(int i=0; i<NUMERO; i++){
            for(int j=0; j<NUMERO; j++){
                if(matrizCopia[i][j] == -1){
                    contaI++;
                }
                else{
                    matriz[i][j] = matriz[i][j]-menor;
                }
                if(matrizCopia[j][i] == -1){
                    contaJ++;
                }
                if(contaJ == NUMERO){
                    columnas[i] = i;
                    contaJ=0;
                }
            }
            if(contaI == NUMERO){
                filas[i] = i;
                contaI = 0;
            }
        }

        for(int i=0; i<NUMERO; i++){
            if(filas[i]!=-1){
                for(int j=0; j<NUMERO; j++){
                    if(columnas[j]!=-1){
                        matriz[columnas[j]][filas[i]] = matriz[columnas[j]][filas[i]] + menor;
                    }
                }
            }
        }
        lineas(matriz);
    }
    else{
        return;
    }

}

int menorMatriz(float matrizCopia[][NUMERO]){
    int menor = 1;
    for(int i=0; i<NUMERO; i++){
        for(int j=0; j<NUMERO; j++)
        {
            if(matrizCopia[i][j]<menor && matrizCopia[i][j] != -1){
                menor = matrizCopia[i][j];
            }
        }
    }
    return menor;

}

void eliminarFilas(float matrizCopia[][NUMERO], int aplicar, bool pasa, int &cantidadLineas){
    if(aplicar <= 1 && pasa == false){
        return;
    }
    int cantidadCeros=0;
    for(int i=0; i<NUMERO; i++){
        for(int j=0; j<NUMERO; j++){
            if(matrizCopia[i][j] == 0){
                cantidadCeros++;
            }
        }
        if(cantidadCeros==aplicar){
            for(int k=0; k<NUMERO; k++){
                matrizCopia[i][k] = -1;

            }
            cantidadLineas++;
        }
        cantidadCeros = 0;
    }
    eliminarFilas(matrizCopia, aplicar-1, false, cantidadLineas);
}

void eliminarColumnas(float matrizCopia[][NUMERO], int aplicar, bool pasa, int &cantidadLineas){
    if(aplicar <= 1 && pasa == false){
        return;
    }
    int cantidadCeros=0;
    for(int i=0; i<NUMERO; i++){
        for(int j=0; j<NUMERO; j++){
            if(matrizCopia[j][i] == 0){
                cantidadCeros++;
            }
        }
        if(cantidadCeros==aplicar){
            for(int k=0; k<NUMERO; k++){
                matrizCopia[k][i] = -1;

            }
            cantidadLineas++;
        }
        cantidadCeros = 0;
    }
    eliminarColumnas(matrizCopia, aplicar-1, false, cantidadLineas);
}

void asignacion(float matriz[][NUMERO], int cantidadCeros, int libres[][2], int n){
    if(existenLibres(libres) == -1){
        cout<<"Final"<<endl;
        for(int i =0 ; i<NUMERO; i++){
            for(int j =0 ; j< 2; j++){
                cout<<libres[i][j]<<" ";
            }
            cout<<endl;
        }
        return;
    }

    int contador = 0, guarda =0;

    for(int i=0; i<NUMERO; i++){
        for(int j=0; j<NUMERO; j++){
            if(matriz[i][j]==0){
                contador++;
            }
        }
        if(contador == cantidadCeros){
            for(int j=0; j<NUMERO; j++){
                if(matriz[i][j] == 0){
                    guarda = j+1;
                    if(buscarLibre(libres, guarda) == 0){
                        break;
                    }
                }
            }
            libres[n][0] = i+1;
            libres[n][1] = guarda;
            n++;
        }
        contador =0;
        guarda = 0;
    }
    asignacion(matriz,cantidadCeros+1, libres,n);
}

int existenLibres(int libres[][2]){

    for(int i=0; i<NUMERO; i++){
        if(libres[i][0]==-1){
            return 1;
        }
    }
    return -1;

}

int buscarLibre(int libres[][2], int guarda){
    for(int i=0; i<NUMERO; i++){
        if(libres[i][1] == guarda){
            return 1;
        }
    }
    return 0;
}
