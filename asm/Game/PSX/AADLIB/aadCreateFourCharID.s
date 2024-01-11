.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadCreateFourCharID
/* 42CE4 800524E4 FF00E730 */  andi       $a3, $a3, 0xFF
/* 42CE8 800524E8 FF00C630 */  andi       $a2, $a2, 0xFF
/* 42CEC 800524EC 00320600 */  sll        $a2, $a2, 8
/* 42CF0 800524F0 2538E600 */  or         $a3, $a3, $a2
/* 42CF4 800524F4 FF00A530 */  andi       $a1, $a1, 0xFF
/* 42CF8 800524F8 002C0500 */  sll        $a1, $a1, 16
/* 42CFC 800524FC 2538E500 */  or         $a3, $a3, $a1
/* 42D00 80052500 00160400 */  sll        $v0, $a0, 24
/* 42D04 80052504 0800E003 */  jr         $ra
/* 42D08 80052508 2510E200 */   or        $v0, $a3, $v0
.size aadCreateFourCharID, . - aadCreateFourCharID
