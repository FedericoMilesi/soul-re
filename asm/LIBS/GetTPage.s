.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetTPage
/* AFEF4 800BF6F4 03008230 */  andi       $v0, $a0, 0x3
/* AFEF8 800BF6F8 C0110200 */  sll        $v0, $v0, 7
/* AFEFC 800BF6FC 0300A530 */  andi       $a1, $a1, 0x3
/* AFF00 800BF700 40290500 */  sll        $a1, $a1, 5
/* AFF04 800BF704 25104500 */  or         $v0, $v0, $a1
/* AFF08 800BF708 0001E330 */  andi       $v1, $a3, 0x100
/* AFF0C 800BF70C 03190300 */  sra        $v1, $v1, 4
/* AFF10 800BF710 25104300 */  or         $v0, $v0, $v1
/* AFF14 800BF714 FF03C630 */  andi       $a2, $a2, 0x3FF
/* AFF18 800BF718 83310600 */  sra        $a2, $a2, 6
/* AFF1C 800BF71C 25104600 */  or         $v0, $v0, $a2
/* AFF20 800BF720 0002E730 */  andi       $a3, $a3, 0x200
/* AFF24 800BF724 80380700 */  sll        $a3, $a3, 2
/* AFF28 800BF728 0800E003 */  jr         $ra
/* AFF2C 800BF72C 25104700 */   or        $v0, $v0, $a3
/* AFF30 800BF730 00000000 */  nop
.size GetTPage, . - GetTPage
