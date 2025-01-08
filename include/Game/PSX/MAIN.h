#ifndef _MAIN_H_
#define _MAIN_H_

void MAIN_StartGame();
void VblTick();
int MainG2(void *appData);
long *MAIN_LoadTim(char *name);

DISPENV disp[2];
BLK_FILL clearRect[2];
extern short gEndGameNow;

#endif
