.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_Menu
/* 48E4 800140E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 48E8 800140E8 1400B1AF */  sw         $s1, 0x14($sp)
/* 48EC 800140EC 21888000 */  addu       $s1, $a0, $zero
/* 48F0 800140F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 48F4 800140F4 0C8A908F */  lw         $s0, %gp_rel(currentMenu)($gp)
/* 48F8 800140F8 0D80023C */  lui        $v0, %hi(mainMenu)
/* 48FC 800140FC 1800B2AF */  sw         $s2, 0x18($sp)
/* 4900 80014100 108A928F */  lw         $s2, %gp_rel(debugMenuChoice)($gp)
/* 4904 80014104 B08D4224 */  addiu      $v0, $v0, %lo(mainMenu)
/* 4908 80014108 05000212 */  beq        $s0, $v0, .L80014120
/* 490C 8001410C 1C00BFAF */   sw        $ra, 0x1C($sp)
/* 4910 80014110 0D80023C */  lui        $v0, %hi(pauseMenu)
/* 4914 80014114 F09E4224 */  addiu      $v0, $v0, %lo(pauseMenu)
/* 4918 80014118 06000216 */  bne        $s0, $v0, .L80014134
/* 491C 8001411C 21202002 */   addu      $a0, $s1, $zero
.L80014120:
/* 4920 80014120 2000248E */  lw         $a0, 0x20($s1)
/* 4924 80014124 20E1020C */  jal        menu_process
/* 4928 80014128 00000000 */   nop
/* 492C 8001412C 78500008 */  j          .L800141E0
/* 4930 80014130 00000000 */   nop
.L80014134:
/* 4934 80014134 BB4E000C */  jal        pre_process_functions
/* 4938 80014138 21280002 */   addu      $a1, $s0, $zero
/* 493C 8001413C 28004014 */  bnez       $v0, .L800141E0
/* 4940 80014140 00000000 */   nop
/* 4944 80014144 108A848F */  lw         $a0, %gp_rel(debugMenuChoice)($gp)
/* 4948 80014148 00000000 */  nop
/* 494C 8001414C 40100400 */  sll        $v0, $a0, 1
/* 4950 80014150 21104400 */  addu       $v0, $v0, $a0
/* 4954 80014154 C0100200 */  sll        $v0, $v0, 3
/* 4958 80014158 21105000 */  addu       $v0, $v0, $s0
/* 495C 8001415C 0000428C */  lw         $v0, 0x0($v0)
/* 4960 80014160 00000000 */  nop
/* 4964 80014164 0600422C */  sltiu      $v0, $v0, 0x6
/* 4968 80014168 0B004014 */  bnez       $v0, .L80014198
/* 496C 8001416C 01008224 */   addiu     $v0, $a0, 0x1
.L80014170:
/* 4970 80014170 40180200 */  sll        $v1, $v0, 1
/* 4974 80014174 21186200 */  addu       $v1, $v1, $v0
/* 4978 80014178 C0180300 */  sll        $v1, $v1, 3
/* 497C 8001417C 21187000 */  addu       $v1, $v1, $s0
/* 4980 80014180 0000638C */  lw         $v1, 0x0($v1)
/* 4984 80014184 21204000 */  addu       $a0, $v0, $zero
/* 4988 80014188 108A84AF */  sw         $a0, %gp_rel(debugMenuChoice)($gp)
/* 498C 8001418C 0600632C */  sltiu      $v1, $v1, 0x6
/* 4990 80014190 F7FF6010 */  beqz       $v1, .L80014170
/* 4994 80014194 01008224 */   addiu     $v0, $a0, 0x1
.L80014198:
/* 4998 80014198 21202002 */  addu       $a0, $s1, $zero
/* 499C 8001419C B64F000C */  jal        draw_menu
/* 49A0 800141A0 21280002 */   addu      $a1, $s0, $zero
/* 49A4 800141A4 21202002 */  addu       $a0, $s1, $zero
/* 49A8 800141A8 D74D000C */  jal        maybe_change_menu_choice
/* 49AC 800141AC 21280002 */   addu      $a1, $s0, $zero
/* 49B0 800141B0 108A828F */  lw         $v0, %gp_rel(debugMenuChoice)($gp)
/* 49B4 800141B4 00000000 */  nop
/* 49B8 800141B8 09005214 */  bne        $v0, $s2, .L800141E0
/* 49BC 800141BC 21202002 */   addu      $a0, $s1, $zero
/* 49C0 800141C0 A24E000C */  jal        process_menu_line
/* 49C4 800141C4 21280002 */   addu      $a1, $s0, $zero
/* 49C8 800141C8 0C8A828F */  lw         $v0, %gp_rel(currentMenu)($gp)
/* 49CC 800141CC 00000000 */  nop
/* 49D0 800141D0 03005014 */  bne        $v0, $s0, .L800141E0
/* 49D4 800141D4 21202002 */   addu      $a0, $s1, $zero
/* 49D8 800141D8 C54E000C */  jal        post_process_functions
/* 49DC 800141DC 21280002 */   addu      $a1, $s0, $zero
.L800141E0:
/* 49E0 800141E0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 49E4 800141E4 1800B28F */  lw         $s2, 0x18($sp)
/* 49E8 800141E8 1400B18F */  lw         $s1, 0x14($sp)
/* 49EC 800141EC 1000B08F */  lw         $s0, 0x10($sp)
/* 49F0 800141F0 0800E003 */  jr         $ra
/* 49F4 800141F4 2000BD27 */   addiu     $sp, $sp, 0x20
.size DEBUG_Menu, . - DEBUG_Menu
