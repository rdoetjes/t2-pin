#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <dos.h>

#define DELAY_MS 20

void printPin() {
  clrscr();
  printf("PPPPP  IIIIIII   N    N\n");
  printf("P   PP    I      NN   N IDENTIFICATION\n");
  printf("P   PP    I      N N  N\n");
  printf("PPPPP     I      N  N N   PROGRAM\n");
  printf("P         I      N   NN\n");
  printf("P      IIIIIII   N    N\n");
  printf("\n");
  printf("Strike a key when ready ...");
  getch();
}

void scanPin(){
  int pos = 38;
  int sub = 1;

  printf("\n\n12345678901234567890123457890123456780\n");
  while(pos>=5){
    for(int j=0; j<5; j++){
      for(int i=0; i<pos; i++) printf("%c", ((rand() % 10))+48);
      printf("\n");
      delay(DELAY_MS);
    }

    if (sub == 1){
      pos--;
      sub=2;
    } else{
      pos-=2;
      sub=1;
    }
  }

  for(int i=0;i<10;i++)
    printf("9003\n");
  printf("\nPIN IDENTIFICATION NUMBER: 9003\na>");
  getch();
}

void main() {
  printPin();
  scanPin();
}
