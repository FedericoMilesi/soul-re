.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_ChangeDirectory
/* 51144 80060944 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 51148 80060948 1400B1AF */  sw         $s1, 0x14($sp)
/* 5114C 8006094C 21888000 */  addu       $s1, $a0, $zero
/* 51150 80060950 1800BFAF */  sw         $ra, 0x18($sp)
/* 51154 80060954 2580010C */  jal        STREAM_AddQueueEntryToTail
/* 51158 80060958 1000B0AF */   sw        $s0, 0x10($sp)
/* 5115C 8006095C 21202002 */  addu       $a0, $s1, $zero
/* 51160 80060960 CADF000C */  jal        LOAD_HashUnit
/* 51164 80060964 21804000 */   addu      $s0, $v0, $zero
/* 51168 80060968 3C000426 */  addiu      $a0, $s0, 0x3C
/* 5116C 8006096C E4A382AF */  sw         $v0, %gp_rel(gCurDir)($gp)
/* 51170 80060970 0C0002AE */  sw         $v0, 0xC($s0)
/* 51174 80060974 0A000224 */  addiu      $v0, $zero, 0xA
/* 51178 80060978 0D80053C */  lui        $a1, %hi(gCurDir + 0x6C)
/* 5117C 8006097C E819A524 */  addiu      $a1, $a1, %lo(gCurDir + 0x6C)
/* 51180 80060980 21302002 */  addu       $a2, $s1, $zero
/* 51184 80060984 080000AE */  sw         $zero, 0x8($s0)
/* 51188 80060988 1AD1010C */  jal        sprintf
/* 5118C 8006098C 040002A6 */   sh        $v0, 0x4($s0)
/* 51190 80060990 1800BF8F */  lw         $ra, 0x18($sp)
/* 51194 80060994 1400B18F */  lw         $s1, 0x14($sp)
/* 51198 80060998 1000B08F */  lw         $s0, 0x10($sp)
/* 5119C 8006099C 0800E003 */  jr         $ra
/* 511A0 800609A0 2000BD27 */   addiu     $sp, $sp, 0x20
.size LOAD_ChangeDirectory, . - LOAD_ChangeDirectory
