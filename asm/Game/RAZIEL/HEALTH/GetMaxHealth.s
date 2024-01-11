.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMaxHealth
/* 95010 800A4810 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 95014 800A4814 02000224 */  addiu      $v0, $zero, 0x2
/* 95018 800A4818 0E006210 */  beq        $v1, $v0, .L800A4854
/* 9501C 800A481C 00000000 */   nop
/* 95020 800A4820 28FA8387 */  lh         $v1, %gp_rel(Raziel + 0x3F8)($gp)
/* 95024 800A4824 00000000 */  nop
/* 95028 800A4828 01006324 */  addiu      $v1, $v1, 0x1
/* 9502C 800A482C 40100300 */  sll        $v0, $v1, 1
/* 95030 800A4830 21104300 */  addu       $v0, $v0, $v1
/* 95034 800A4834 80210200 */  sll        $a0, $v0, 6
/* 95038 800A4838 21104400 */  addu       $v0, $v0, $a0
/* 9503C 800A483C 80100200 */  sll        $v0, $v0, 2
/* 95040 800A4840 21104300 */  addu       $v0, $v0, $v1
/* 95044 800A4844 80100200 */  sll        $v0, $v0, 2
/* 95048 800A4848 21104300 */  addu       $v0, $v0, $v1
/* 9504C 800A484C 0800E003 */  jr         $ra
/* 95050 800A4850 40110200 */   sll       $v0, $v0, 5
.L800A4854:
/* 95054 800A4854 0100023C */  lui        $v0, (0x186A0 >> 16)
/* 95058 800A4858 0800E003 */  jr         $ra
/* 9505C 800A485C A0864234 */   ori       $v0, $v0, (0x186A0 & 0xFFFF)
.size GetMaxHealth, . - GetMaxHealth
