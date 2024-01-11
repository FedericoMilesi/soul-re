.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel printf
/* 64C18 80074418 0000A4AF */  sw         $a0, 0x0($sp)
/* 64C1C 8007441C 0400A5AF */  sw         $a1, 0x4($sp)
/* 64C20 80074420 0800A6AF */  sw         $a2, 0x8($sp)
/* 64C24 80074424 0C00A7AF */  sw         $a3, 0xC($sp)
/* 64C28 80074428 E8FEBD27 */  addiu      $sp, $sp, -0x118
/* 64C2C 8007442C 21288000 */  addu       $a1, $a0, $zero
/* 64C30 80074430 1801A4AF */  sw         $a0, 0x118($sp)
/* 64C34 80074434 1000A427 */  addiu      $a0, $sp, 0x10
/* 64C38 80074438 1C01A627 */  addiu      $a2, $sp, 0x11C
/* 64C3C 8007443C 1401BFAF */  sw         $ra, 0x114($sp)
/* 64C40 80074440 26D1010C */  jal        vsprintf
/* 64C44 80074444 1001B0AF */   sw        $s0, 0x110($sp)
/* 64C48 80074448 1000A427 */  addiu      $a0, $sp, 0x10
/* 64C4C 8007444C 9901030C */  jal        func_800C0664
/* 64C50 80074450 21804000 */   addu      $s0, $v0, $zero
/* 64C54 80074454 21100002 */  addu       $v0, $s0, $zero
/* 64C58 80074458 1401BF8F */  lw         $ra, 0x114($sp)
/* 64C5C 8007445C 1001B08F */  lw         $s0, 0x110($sp)
/* 64C60 80074460 0800E003 */  jr         $ra
/* 64C64 80074464 1801BD27 */   addiu     $sp, $sp, 0x118
.size printf, . - printf
