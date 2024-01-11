.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel check_hack_attract
/* A900C 800B880C 20AA828F */  lw         $v0, %gp_rel(hack_attract)($gp)
/* A9010 800B8810 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A9014 800B8814 15004018 */  blez       $v0, .L800B886C
/* A9018 800B8818 1000BFAF */   sw        $ra, 0x10($sp)
/* A901C 800B881C 00BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x138)($gp)
/* A9020 800B8820 D0074224 */  addiu      $v0, $v0, 0x7D0
/* A9024 800B8824 2B104300 */  sltu       $v0, $v0, $v1
/* A9028 800B8828 10004010 */  beqz       $v0, .L800B886C
/* A902C 800B882C 0D80033C */   lui       $v1, %hi(the_attract_movies)
/* A9030 800B8830 24AA828F */  lw         $v0, %gp_rel(hack_attract_movie)($gp)
/* A9034 800B8834 ACC86324 */  addiu      $v1, $v1, %lo(the_attract_movies)
/* A9038 800B8838 80100200 */  sll        $v0, $v0, 2
/* A903C 800B883C 21104300 */  addu       $v0, $v0, $v1
/* A9040 800B8840 0000448C */  lw         $a0, 0x0($v0)
/* A9044 800B8844 01000224 */  addiu      $v0, $zero, 0x1
/* A9048 800B8848 20AA82AF */  sw         $v0, %gp_rel(hack_attract)($gp)
/* A904C 800B884C E8E1020C */  jal        play_movie_dup1
/* A9050 800B8850 00000000 */   nop
/* A9054 800B8854 24AA828F */  lw         $v0, %gp_rel(hack_attract_movie)($gp)
/* A9058 800B8858 00BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x138)($gp)
/* A905C 800B885C 01004224 */  addiu      $v0, $v0, 0x1
/* A9060 800B8860 03004230 */  andi       $v0, $v0, 0x3
/* A9064 800B8864 24AA82AF */  sw         $v0, %gp_rel(hack_attract_movie)($gp)
/* A9068 800B8868 20AA83AF */  sw         $v1, %gp_rel(hack_attract)($gp)
.L800B886C:
/* A906C 800B886C 1000BF8F */  lw         $ra, 0x10($sp)
/* A9070 800B8870 00000000 */  nop
/* A9074 800B8874 0800E003 */  jr         $ra
/* A9078 800B8878 1800BD27 */   addiu     $sp, $sp, 0x18
.size check_hack_attract, . - check_hack_attract
