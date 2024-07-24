#ifndef _MENU_H_
#define _MENU_H_

#include "common.h"

typedef struct menu_t menu_t;

void menu_pop(menu_t *menu);
void menu_item_flags(struct menu_t *menu, int (*fn)(), long parameter, long flags, char *format);
void menu_item(struct menu_t *menu, int (*fn)(), long parameter, char *format);

#endif
