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

// size: 0x1C
typedef struct menu_format_t {
    // offset: 0000
    int xpos;
    // offset: 0004
    int ypos;
    // offset: 0008
    int lineskip;
    // offset: 000C
    int itemskip;
    // offset: 0010
    int width;
    // offset: 0014
    int center;
    // offset: 0018
    int border;
} menu_format_t;

// size: 0x24
typedef struct menu_stack_t {
    // offset: 0000
    int (*fn)();
    // offset: 0004
    int index;
    // offset: 0008 (28 bytes)
    struct menu_format_t format;
} menu_stack_t;

// size: 0x10
typedef struct menu_item_t {
    // offset: 0000
    char *text;
    // offset: 0004
    int (*fn)();
    // offset: 0008
    long parameter;
    // offset: 000C
    long flags;
} menu_item_t;

// size: 0x388
typedef struct menu_t {
    // offset: 0000
    int nmenus;
    // offset: 0004
    int nitems;
    // offset: 0008
    int nbytes;
    // offset: 000C (180 bytes)
    struct menu_stack_t stack[5];
    // offset: 00C0 (192 bytes)
    struct menu_item_t items[12];
    // offset: 0180 (512 bytes)
    char bytes[512];
    // offset: 0380
    void (*drawfn)();
    // offset: 0384
    void *opaque;
} menu_t;

void menu_pop(menu_t *menu);
void menu_item_flags(menu_t *menu, int (*fn)(), long parameter, long flags, char *format);
void menu_item(menu_t *menu, int (*fn)(), long parameter, char *format);
void menu_push(menu_t *menu, int (*fn)());

#endif
