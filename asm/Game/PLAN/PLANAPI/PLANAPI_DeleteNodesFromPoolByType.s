.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_DeleteNodesFromPoolByType
/* 88804 80098004 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88808 80098008 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 8880C 8009800C 1000B0AF */  sw         $s0, 0x10($sp)
/* 88810 80098010 D8BF908F */  lw         $s0, %gp_rel(gameTrackerX + 0x210)($gp)
/* 88814 80098014 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 88818 80098018 21988000 */  addu       $s3, $a0, $zero
/* 8881C 8009801C 1400B1AF */  sw         $s1, 0x14($sp)
/* 88820 80098020 21880000 */  addu       $s1, $zero, $zero
/* 88824 80098024 2000BFAF */  sw         $ra, 0x20($sp)
/* 88828 80098028 1800B2AF */  sw         $s2, 0x18($sp)
/* 8882C 8009802C 01004290 */  lbu        $v0, 0x1($v0)
/* 88830 80098030 00000000 */  nop
/* 88834 80098034 13004010 */  beqz       $v0, .L80098084
/* 88838 80098038 21900002 */   addu      $s2, $s0, $zero
.L8009803C:
/* 8883C 8009803C 14000296 */  lhu        $v0, 0x14($s0)
/* 88840 80098040 00000000 */  nop
/* 88844 80098044 07004230 */  andi       $v0, $v0, 0x7
/* 88848 80098048 05005314 */  bne        $v0, $s3, .L80098060
/* 8884C 8009804C 21200002 */   addu      $a0, $s0, $zero
/* 88850 80098050 EB66020C */  jal        PLANPOOL_DeleteNodeFromPool
/* 88854 80098054 21284002 */   addu      $a1, $s2, $zero
/* 88858 80098058 1A600208 */  j          .L80098068
/* 8885C 8009805C 00000000 */   nop
.L80098060:
/* 88860 80098060 01003126 */  addiu      $s1, $s1, 0x1
/* 88864 80098064 1C001026 */  addiu      $s0, $s0, 0x1C
.L80098068:
/* 88868 80098068 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 8886C 8009806C 00000000 */  nop
/* 88870 80098070 01004290 */  lbu        $v0, 0x1($v0)
/* 88874 80098074 00000000 */  nop
/* 88878 80098078 2A102202 */  slt        $v0, $s1, $v0
/* 8887C 8009807C EFFF4014 */  bnez       $v0, .L8009803C
/* 88880 80098080 00000000 */   nop
.L80098084:
/* 88884 80098084 2000BF8F */  lw         $ra, 0x20($sp)
/* 88888 80098088 1C00B38F */  lw         $s3, 0x1C($sp)
/* 8888C 8009808C 1800B28F */  lw         $s2, 0x18($sp)
/* 88890 80098090 1400B18F */  lw         $s1, 0x14($sp)
/* 88894 80098094 1000B08F */  lw         $s0, 0x10($sp)
/* 88898 80098098 0800E003 */  jr         $ra
/* 8889C 8009809C 2800BD27 */   addiu     $sp, $sp, 0x28
.size PLANAPI_DeleteNodesFromPoolByType, . - PLANAPI_DeleteNodesFromPoolByType
