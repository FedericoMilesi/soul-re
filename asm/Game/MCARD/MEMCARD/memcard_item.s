.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_item
/* AA1F0 800B99F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AA1F4 800B99F4 3000A38F */  lw         $v1, 0x30($sp)
/* AA1F8 800B99F8 0700E010 */  beqz       $a3, .L800B9A18
/* AA1FC 800B99FC 1800BFAF */   sw        $ra, 0x18($sp)
/* AA200 800B9A00 0D80023C */  lui        $v0, %hi(gameTrackerX + 0x20)
/* AA204 800B9A04 8033448C */  lw         $a0, %lo(gameTrackerX + 0x20)($v0)
/* AA208 800B9A08 0FDE020C */  jal        menu_item_flags
/* AA20C 800B9A0C 1000A3AF */   sw        $v1, 0x10($sp)
/* AA210 800B9A10 8AE60208 */  j          .L800B9A28
/* AA214 800B9A14 00000000 */   nop
.L800B9A18:
/* AA218 800B9A18 0D80023C */  lui        $v0, %hi(gameTrackerX + 0x20)
/* AA21C 800B9A1C 8033448C */  lw         $a0, %lo(gameTrackerX + 0x20)($v0)
/* AA220 800B9A20 33DE020C */  jal        menu_item
/* AA224 800B9A24 21386000 */   addu      $a3, $v1, $zero
.L800B9A28:
/* AA228 800B9A28 1800BF8F */  lw         $ra, 0x18($sp)
/* AA22C 800B9A2C 00000000 */  nop
/* AA230 800B9A30 0800E003 */  jr         $ra
/* AA234 800B9A34 2000BD27 */   addiu     $sp, $sp, 0x20
.size memcard_item, . - memcard_item
