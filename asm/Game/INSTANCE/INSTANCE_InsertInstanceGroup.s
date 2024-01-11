.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_InsertInstanceGroup
/* 23008 80032808 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2300C 8003280C 1400B1AF */  sw         $s1, 0x14($sp)
/* 23010 80032810 21888000 */  addu       $s1, $a0, $zero
/* 23014 80032814 1000B0AF */  sw         $s0, 0x10($sp)
/* 23018 80032818 2180A000 */  addu       $s0, $a1, $zero
/* 2301C 8003281C 1800BFAF */  sw         $ra, 0x18($sp)
/* 23020 80032820 BBC9000C */  jal        INSTANCE_InstanceGroupNumber
/* 23024 80032824 21200002 */   addu      $a0, $s0, $zero
/* 23028 80032828 C0100200 */  sll        $v0, $v0, 3
/* 2302C 8003282C 0C004224 */  addiu      $v0, $v0, 0xC
/* 23030 80032830 21202202 */  addu       $a0, $s1, $v0
/* 23034 80032834 D53E010C */  jal        LIST_InsertFunc
/* 23038 80032838 21280002 */   addu      $a1, $s0, $zero
/* 2303C 8003283C 1800BF8F */  lw         $ra, 0x18($sp)
/* 23040 80032840 1400B18F */  lw         $s1, 0x14($sp)
/* 23044 80032844 1000B08F */  lw         $s0, 0x10($sp)
/* 23048 80032848 0800E003 */  jr         $ra
/* 2304C 8003284C 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_InsertInstanceGroup, . - INSTANCE_InsertInstanceGroup
