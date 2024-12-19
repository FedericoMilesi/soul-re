#ifndef _MAIN_H_
#define _MAIN_H_

void MAIN_StartGame();
void VblTick();
int MainG2(void *appData);

DISPENV disp[2];
BLK_FILL clearRect[2];
extern short gEndGameNow;

#endif
