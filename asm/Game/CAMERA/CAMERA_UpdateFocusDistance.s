.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_UpdateFocusDistance
/* CC38 8001C438 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* CC3C 8001C43C 21388000 */  addu       $a3, $a0, $zero
/* CC40 8001C440 1800BFAF */  sw         $ra, 0x18($sp)
/* CC44 8001C444 0804E384 */  lh         $v1, 0x408($a3)
/* CC48 8001C448 02000224 */  addiu      $v0, $zero, 0x2
/* CC4C 8001C44C 2A006210 */  beq        $v1, $v0, .L8001C4F8
/* CC50 8001C450 00000000 */   nop
/* CC54 8001C454 EC00E28C */  lw         $v0, 0xEC($a3)
/* CC58 8001C458 00000000 */  nop
/* CC5C 8001C45C 01004230 */  andi       $v0, $v0, 0x1
/* CC60 8001C460 25004014 */  bnez       $v0, .L8001C4F8
/* CC64 8001C464 00000000 */   nop
/* CC68 8001C468 A801E284 */  lh         $v0, 0x1A8($a3)
/* CC6C 8001C46C B001E384 */  lh         $v1, 0x1B0($a3)
/* CC70 8001C470 A801E494 */  lhu        $a0, 0x1A8($a3)
/* CC74 8001C474 2A104300 */  slt        $v0, $v0, $v1
/* CC78 8001C478 07004010 */  beqz       $v0, .L8001C498
/* CC7C 8001C47C 0082033C */   lui       $v1, (0x82000000 >> 16)
/* CC80 8001C480 9C04E28C */  lw         $v0, 0x49C($a3)
/* CC84 8001C484 00000000 */  nop
/* CC88 8001C488 24104300 */  and        $v0, $v0, $v1
/* CC8C 8001C48C 02004014 */  bnez       $v0, .L8001C498
/* CC90 8001C490 00000000 */   nop
/* CC94 8001C494 B001E4A4 */  sh         $a0, 0x1B0($a3)
.L8001C498:
/* CC98 8001C498 B001E384 */  lh         $v1, 0x1B0($a3)
/* CC9C 8001C49C 0601E284 */  lh         $v0, 0x106($a3)
/* CCA0 8001C4A0 00000000 */  nop
/* CCA4 8001C4A4 2A106200 */  slt        $v0, $v1, $v0
/* CCA8 8001C4A8 0B004010 */  beqz       $v0, .L8001C4D8
/* CCAC 8001C4AC 06000424 */   addiu     $a0, $zero, 0x6
/* CCB0 8001C4B0 A801E284 */  lh         $v0, 0x1A8($a3)
/* CCB4 8001C4B4 00000000 */  nop
/* CCB8 8001C4B8 2A106200 */  slt        $v0, $v1, $v0
/* CCBC 8001C4BC 03004010 */  beqz       $v0, .L8001C4CC
/* CCC0 8001C4C0 00020324 */   addiu     $v1, $zero, 0x200
/* CCC4 8001C4C4 37710008 */  j          .L8001C4DC
/* CCC8 8001C4C8 05000424 */   addiu     $a0, $zero, 0x5
.L8001C4CC:
/* CCCC 8001C4CC 80000324 */  addiu      $v1, $zero, 0x80
/* CCD0 8001C4D0 37710008 */  j          .L8001C4DC
/* CCD4 8001C4D4 01000424 */   addiu     $a0, $zero, 0x1
.L8001C4D8:
/* CCD8 8001C4D8 40000324 */  addiu      $v1, $zero, 0x40
.L8001C4DC:
/* CCDC 8001C4DC 6A01E224 */  addiu      $v0, $a3, 0x16A
/* CCE0 8001C4E0 0601E524 */  addiu      $a1, $a3, 0x106
/* CCE4 8001C4E4 B001E684 */  lh         $a2, 0x1B0($a3)
/* CCE8 8001C4E8 6801E724 */  addiu      $a3, $a3, 0x168
/* CCEC 8001C4EC 1000A2AF */  sw         $v0, 0x10($sp)
/* CCF0 8001C4F0 605C000C */  jal        CriticalDampValue
/* CCF4 8001C4F4 1400A3AF */   sw        $v1, 0x14($sp)
.L8001C4F8:
/* CCF8 8001C4F8 1800BF8F */  lw         $ra, 0x18($sp)
/* CCFC 8001C4FC 00000000 */  nop
/* CD00 8001C500 0800E003 */  jr         $ra
/* CD04 8001C504 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_UpdateFocusDistance, . - CAMERA_UpdateFocusDistance
