#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <dos.h>

#define DELAY_MS 20
void printPin() {
  clrscr();
  printf("PPPPP  IIIIIII   N    N\r\n");
  printf("P   PP    I      NN   N IDENTIFICATION\r\n");
  printf("P   PP    I      N N  N\r\n");
  printf("PPPPP     I      N  N N   PROGRAM\r\n");
  printf("P         I      N   NN\r\n");
  printf("P      IIIIIII   N    N\r\n");
  printf("\n");
  printf("Strike a key when ready ...");
  getch();
}

void scanPin(){
  int pos = 38;
  int cnt = 0;

  printf("\r\n\r\n12345678901234567890123457890123456780\r\n");
  while(pos>=5){
    for(int j=0; j<5; j++){
      for(int i=0; i<pos; i++) printf("%c", ((rand() % 10))+48);
      printf("\n");
      delay(DELAY_MS);
    }

    if (cnt & 1 == 1)
      pos--;
    else
      pos-=2;

    cnt++;
  }

  for(int i=0;i<10;i++)
    printf("9003\r\n");
  printf("\nPIN IDENTIFICATION NUMBER: 9003\r\n\r\na>");
  getch();
}

void main() {
  printPin();
  scanPin();
}
