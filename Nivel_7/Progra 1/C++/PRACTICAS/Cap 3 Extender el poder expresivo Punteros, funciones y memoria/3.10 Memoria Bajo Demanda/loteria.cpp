#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctime>

/*Programa que analiza un fichero para encontrar una palabra*/
/*Francisco Cobos Loriente*/
/*DAM1 Programacion, Ejercicios4, Ejercicio nº02*/

/*globales*/

struct NUMERO_SORTEO{
int num; /*numero*/
int tlpm; /*premio total*/
int pmPe; /*premio por euro*/
}nst;

struct NUMEROS{
int index;
int num; /*numero jugado*/
int din; /*dinero jugado*/
};
struct NUMEROS njg;

int esp(int); /*funcion para calcular los espacios*/
void listarNumJg(FILE *, struct NUMEROS); /*lista los numeros jugados*/
void borrarLinea(FILE *, FILE *, struct NUMEROS *,char*,char*);
void numPrem(FILE *,FILE *, struct NUMERO_SORTEO *, struct NUMEROS *);

int fin; /*variable de final de ficheros*/

main(){
system("color 2e");
system("mkdir f03loteria"); /*crea la carpeta para los ficheros en windows*/

srand((unsigned int) time(NULL));
FILE *f;
FILE *f1;
FILE *faux;
int i,n,n1,j;
char car;
int control;
char *nom="f03loteria/sorteo.dat";
char *nomb="f03loteria/listado.dat";
char *nomaux="f03loteria/auxiliar.dat";
int p1=3000000; int pe1=15000; /*1*/
int p2=1000000; int pe2=5000; /*1*/
int p3=500000; int pe3=2500; /*1*/
int p4=200000; int pe4=1000; /*2*/
int p5=50000; int pe5=250; /*8*/
int p6=1000; int pe6=5; /*1531*/
char cop[10];
int op;

printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
*cop='N';
do{

printf("\n###### Loterias ######\n");
printf("Introduce una opcion\n");
printf("Simular sortero 1\n");
printf("Listar todo el sorteo 2\n");
printf("Introducir/borrar numeros jugados 3\n");
printf("Listado de numeros y gastos 4\n");
printf("Numeros premiados 5\n");
printf("Para salir S\n");
scanf("%s",cop);
op=atoi(cop);

if(op==1){ /*genera el fichero del sorteo*/
if((f=fopen(nom,"w+b"))==NULL){printf("\nError de escritura\n");exit(1);}/*abrimos lectura escritura*/
for(i=0;i<1544;i++){
if(i==0)control=0;
else control = 1;
n=rand()%100000;
if(control){
rewind(f);
do{ /*controla que no haya numeros repetidos*/

fin=fread(&nst,sizeof(nst),1,f);
if(fin){if(n==nst.num){n=rand()%100000;rewind(f);}}
}while(fin);
}
nst.num=n; /*creamos el numero*/
if(i==0){nst.tlpm=p1;nst.pmPe=pe1;}
else if(i==1){nst.tlpm=p2;nst.pmPe=pe2;}
else if(i==2){nst.tlpm=p3;nst.pmPe=pe3;}
else if(i==3||i==4){nst.tlpm=p4;nst.pmPe=pe4;}
else if(i>4&&i<13){nst.tlpm=p5;nst.pmPe=pe5;}
else {nst.tlpm=p6;nst.pmPe=pe6;}
fwrite(&nst,sizeof(nst),1,f);

}
printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
printf("\nSorteo simulado\n");
if(!fclose(f))printf("fichero cerrado\n");
else {printf("\nError de cierre\n");exit(1);}
}
else if(op==2){/*lista los numeros del sorteo*/
if((f=fopen(nom,"rb"))==NULL){printf("\nError de apertura\n");exit(1);}
i=1;
do{
fin=fread(&nst,sizeof(nst),1,f);
if(fin)printf(" (%d)%d %d %d",i,nst.num,nst.tlpm,nst.pmPe);
i++;
}while(i<100);
if(!fclose(f)){printf("\nFichero cerrado\n");}
else {printf("\nError de cierre\n");exit(1);}
}
else if(op==3){/*introduce los numero en el fichero*/
*cop='N';
do{
printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
printf("\nIntroducir numero 1\n");
printf("Borrar/crear el fichero 2\n");
printf("Borrar Linea 3\n");
printf("Salir S\n");
scanf("%s",cop);
op=atoi(cop);
if(op==1){
if((f1=fopen(nomb,"rb"))==NULL){printf("Error de escritura");exit(1);}
n=0;
do{
fin=fread(&njg,sizeof(njg),1,f1);
if(n<njg.index)n=njg.index;
}while(fin);
fclose(f1);/*averigua index y le suma 1*/
njg.index=n+1;
if((f1=fopen(nomb,"ab"))==NULL){printf("Error de escritura");exit(1);}

printf("\nIntroduce el numero a jugar\n");
scanf("%d",&njg.num);
if(njg.num<0||njg.num>100000){printf("\nDato erroneo intentalo otra vez\n");
while(njg.num<0||njg.num>100000)scanf("%d",&njg.num);}
printf("\nIntroduce lo que vas a jugar\n");
scanf("%d",&njg.din);
if(njg.din<0||njg.din>100000){printf("\nDato erroneo intentalo otra vez\n");
while(njg.din<0||njg.din>100000)scanf("%d",&njg.din);}
fwrite(&njg,sizeof(njg),1,f1);

if(!fclose(f1))printf("\nFichero cerrado\n");
else printf("\nError de cierre\n");
}
else if(op==2){if((f1=fopen(nomb,"wb"))==NULL){printf("\nError de apertura\n");exit(1);}
if(!fclose(f1))printf("\nfichero cerrado\n");
else {printf("\nError de cierre\n");exit(1);}
njg.index=0;njg.num=0;njg.din=0;
}
else if(op==3){
printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
if((f1=fopen(nomb,"rb"))==NULL){printf("\nError de apertura\n");exit(1);}
if((faux=fopen(nomaux,"wb"))==NULL){printf("\nError de apertura\n");exit(1);}
borrarLinea(f1,faux,&njg,nomb,nomaux);
if(!fclose(f1))printf("\nfichero cerrado\n");
else {printf("\nError de cierre\n");exit(1);}
if(!fclose(faux))printf("\nfichero cerrado\n");
else {printf("\nError de cierre\n");exit(1);}
}

}while(*cop!='S');
printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

*cop='N';

}
else if(op==4){ /*lista los numeros jugados*/
printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

if((f1=fopen(nomb,"rb"))==NULL){printf("\nError de apertura del fichero\n");exit(1);}
else{
listarNumJg(f1,njg);
}
if(!fclose(f1))printf("\nFichero cerrado\n");
else printf("\nError de cierre\n");
}
else if(op==5){
if((f=fopen(nom,"rb"))==NULL){printf("\nError de apertura del fichero\n");exit(1);}
if((f1=fopen(nomb,"rb"))==NULL){printf("\nError de apertura del fichero\n");exit(1);}
numPrem(f,f1,&nst,&njg);
if(!fclose(f)){printf("\nFichero cerrado\n");}
if(!fclose(f1)){printf("\nFichero cerrado\n");}
}


}while(*cop!='S');

}/*final de main*/
int esp(int n){
/*pre: recibe un int
post: calcula el numero de espacios que utiliza para ser escrito*/
int i;
int f=10;
for(i=10;(n/f>0&&i>1);i--)f*=10;

return i;
}
void listarNumJg(FILE *f1, struct NUMEROS pnjg ){
/*pre: recibe el fichero de los numeros jugados ya abierto para lectura
post: lista todos los numeros y el dinero jugado*/
int i;
printf("\nlistado de los numeros y dinero jugado\n");
printf(" numero dinero\n");
do{
fin=fread(&pnjg,sizeof(pnjg),1,f1);
if(fin){
printf("%d ",pnjg.index);
printf("%d",pnjg.num);
if(esp(pnjg.num)>0){for(i=0;i<esp(pnjg.num);i++)printf(" ");}
else printf(" ");
printf("%d\n",pnjg.din);
}
}while(fin);
}
void borrarLinea(FILE *f1, FILE *faux, struct NUMEROS *pnjg,char *nomb,char *nomaux){
/*pre: recibe el fichero de los numeros jugados, un fichero auxiliar y la estructura del numero jugado
post: borra una linea del fichero de numeros jugados*/
char cn[10];
int n;
int fin;
printf("\nIntroduce la linea a borrar\n");
scanf("%s",cn);
n=atoi(cn);
do{

fin=fread(pnjg,sizeof(struct NUMEROS),1,f1);
if(fin){
if(n!=pnjg->index)fwrite(pnjg,sizeof(struct NUMEROS),1,faux);
}
}while(fin);

fclose(faux);
fclose(f1);
if((faux=fopen(nomaux,"rb"))==NULL){printf("\nError de apertura\n"); exit(1);}
if((f1=fopen(nomb,"wb"))==NULL){printf("\nError de apertura\n"); exit(1);}
do{
fin=fread(pnjg,sizeof(struct NUMEROS),1,faux);
if(fin){
fwrite(pnjg,sizeof(struct NUMEROS),1,f1);
}
}while(fin);
}
void numPrem(FILE *f,FILE *f1, struct NUMERO_SORTEO *pnst, struct NUMEROS *pnjg){
/*pre: recibe el fichero del sorteo el fichero de los numeros jugados, y las estructuras de ambos
post: da la lista de premiados y premios*/

int fin1;
int suma=0;
printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
do{
fin=fread(pnjg,sizeof(*pnjg),1,f1);
if(fin){
do{
fin1=fread(pnst,sizeof(*pnst),1,f);
if(fin1){
if(pnjg->num==pnst->num){

printf("\n##### Bingo te a tocado\n");
printf("\n##### Numero premiado %d\n",pnjg->num); /*Miramos el numero premiado directamente*/
printf("##### Cuantia del premio %d euros\n",(pnjg->din*pnst->pmPe));
suma+=(pnjg->din*pnst->pmPe);
}
}
}while(fin1);
fseek(f,(0*sizeof(*pnst)),SEEK_SET);/*Ponemos al fichero en el gordo para saber numero anterior y posterior*/
fread(pnst,sizeof(*pnst),1,f);
if(pnjg->num==(pnst->num-1)){printf("##### Numero anterior al gordo %d de premio\n",(pnjg->din*100));suma+=(pnjg->din*100);}
if(pnjg->num==(pnst->num+1)){printf("##### Numero posterior al gordo %d de premio\n",(pnjg->din*100));suma+=(pnjg->din*100);}
if((pnjg->num%100)==(pnst->num%100)&&pnjg->num!=pnst->num ){printf("##### Dos ultimas cifras del gordo 5 euros de premio\n");suma+=5;}
if((pnjg->num%10)==(pnst->num%10)&&pnjg->num!=pnst->num){printf("##### Ultima cifra del gordo 5 euros de premio\n");suma+=5;}

fseek(f,(1*sizeof(*pnst)),SEEK_SET);/*Ponemos al fichero en el SEGUNDO para saber numero anterior y posterior*/
fread(pnst,sizeof(*pnst),1,f);
if(pnjg->num==(pnst->num-1)){printf("##### Numero anterior al segundo %d de premio\n",(pnjg->din*60));suma+=(pnjg->din*60);}
if(pnjg->num==(pnst->num+1)){printf("##### Numero posterior al segundo %d de premio\n",(pnjg->din*60));suma+=(pnjg->din*60);}
if((pnjg->num%100)==(pnst->num%100)&&pnjg->num!=pnst->num ){printf("##### Dos ultimas cifras del segundo 5 euros de premio\n");suma+=5;}

fseek(f,(2*sizeof(*pnst)),SEEK_SET);/*Ponemos al fichero en el tercero para saber numero anterior y posterior*/
fread(pnst,sizeof(*pnst),1,f);
if(pnjg->num==(pnst->num-1)){printf("##### Numero anterior al tercero %d de premio\n",(pnjg->din*48));suma+=(pnjg->din*48);}
if(pnjg->num==(pnst->num+1)){printf("##### Numero posterior al tercero %d de premio\n",(pnjg->din*48));suma+=(pnjg->din*48);}
if((pnjg->num%100)==(pnst->num%100)&&pnjg->num!=pnst->num ){printf("##### Dos ultimas cifras del tercero 5 euros de premio\n");suma+=5;}

}rewind(f);
}while(fin);
printf("\n##### Total ganado %d \n",suma);
}
