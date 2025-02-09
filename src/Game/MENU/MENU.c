#include "Game/MENU/MENU.h"

int menu_data_size()
{
    return sizeof(menu_t);
}

void menu_initialize(menu_t *menu, void *opaque)
{
    memset(menu, 0, sizeof(menu_t));

    menu->nmenus = -1;

    menu->opaque = opaque;
}

void menu_format(menu_t *menu, int center, int xpos, int ypos, int width, int lineskip, int itemskip, int border)
{
    menu_format_t *fmt;

    fmt = &menu->stack[menu->nmenus - 1].format;

    fmt->xpos = xpos;
    fmt->ypos = ypos;

    fmt->center = center;

    fmt->lineskip = lineskip;
    fmt->itemskip = itemskip;

    fmt->width = width;

    fmt->border = border;
}

void menu_set(menu_t *menu, int (*fn)())
{
    menu->nmenus = 0;

    menu->drawfn = NULL;

    menu_push(menu, fn);
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_push);

void menu_pop(menu_t *menu)
{
    menu->nmenus--;
}

// void menu_item_flags(struct menu_t *menu, int (*fn)(), long parameter, long flags, char *format)
void menu_item_flags(menu_t *menu, int (*fn)(), long parameter, long flags, char *format, ...)
{
    menu_item_t *item;
    va_list temp; // not from decls.h

    item = &menu->items[menu->nitems++];

    item->fn = fn;

    item->parameter = parameter;

    item->text = &menu->bytes[menu->nbytes];

    item->flags = flags;

    va_start(temp, format);

    vsprintf(item->text, format, temp);

    menu->nbytes += strlen(item->text) + 1;
}

// void menu_item(struct menu_t *menu, int (*fn)(), long parameter, char *format)
void menu_item(menu_t *menu, int (*fn)(), long parameter, char *format, ...)
{
    menu_item_t *item;
    va_list temp; // not from decls.h

    item = &menu->items[menu->nitems++];

    item->fn = fn;

    item->parameter = parameter;

    item->text = &menu->bytes[menu->nbytes];

    item->flags = 0;

    if (format != NULL)
    {
        va_start(temp, format);

        vsprintf(item->text, format, temp);

        menu->nbytes += strlen(item->text) + 1;
    }
    else
    {
        item->text = NULL;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_build);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", DisplayHintBox);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", DisplayMenuBox);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_draw_item);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_draw);
/* TODO: this function requires migration of .sdata
void menu_draw(menu_t *menu)
{
    Extents2d ext = {2147483647, -2147483648, 2147483647, -2147483648};
    menu_stack_t *stack;
    int index;
    int ypos;
    int i;
    menu_item_t *item;
    int color;

    stack = &menu->stack[menu->nmenus] - 1;

    index = stack->index;

    ypos = 0;

    if (menu->drawfn != NULL)
    {
        menu->drawfn(menu->opaque);
    }

    for (i = 0; i < menu->nitems; i++)
    {
        item = &menu->items[i];

        color = ((i == 0) && ((item->flags & 0x4))) ? 3 : i != index;

        ypos = menu_draw_item(menu, ypos, 0, 0, item->text, color, item->flags, &ext);
    }

    if (stack->format.border != 0)
    {
        DisplayMenuBox(ext.xmin, ext.xmax, ext.ymin, ext.ymax);
    }
}*/

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_run);

void menu_process(menu_t *menu)
{
    menu_build(menu);

    menu_draw(menu);

    menu_run(menu);
}
