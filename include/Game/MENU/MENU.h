#ifndef _MENU_H_
#define _MENU_H_

#include "common.h"

// size: 0x24
typedef struct mcmenu_table_t {
    // offset: 0000
    int (*data_size)();
    // offset: 0004
    void (*initialize)();
    // offset: 0008
    void (*terminate)();
    // offset: 000C
    void (*begin)();
    // offset: 0010
    void (*end)();
    // offset: 0014
    int (*set_buffer)();
    // offset: 0018
    int (*main)();
    // offset: 001C
    int (*pause)();
    // offset: 0020
    char *versionID;
} mcmenu_table_t;

typedef struct menu_t menu_t;

void menu_pop(menu_t *menu);
void menu_item_flags(struct menu_t *menu, int (*fn)(), long parameter, long flags, char *format);
void menu_item(struct menu_t *menu, int (*fn)(), long parameter, char *format);

#endif
