.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_RemapAnalogueButtons
/* 222D4 80031AD4 27100400 */  nor        $v0, $zero, $a0
/* 222D8 80031AD8 00084430 */  andi       $a0, $v0, 0x800
/* 222DC 80031ADC 40200400 */  sll        $a0, $a0, 1
/* 222E0 80031AE0 00044330 */  andi       $v1, $v0, 0x400
/* 222E4 80031AE4 40190300 */  sll        $v1, $v1, 5
/* 222E8 80031AE8 25208300 */  or         $a0, $a0, $v1
/* 222EC 80031AEC 00024330 */  andi       $v1, $v0, 0x200
/* 222F0 80031AF0 40180300 */  sll        $v1, $v1, 1
/* 222F4 80031AF4 25208300 */  or         $a0, $a0, $v1
/* 222F8 80031AF8 00804330 */  andi       $v1, $v0, 0x8000
/* 222FC 80031AFC 82190300 */  srl        $v1, $v1, 6
/* 22300 80031B00 25208300 */  or         $a0, $a0, $v1
/* 22304 80031B04 00104330 */  andi       $v1, $v0, 0x1000
/* 22308 80031B08 42180300 */  srl        $v1, $v1, 1
/* 2230C 80031B0C 25208300 */  or         $a0, $a0, $v1
/* 22310 80031B10 F9614230 */  andi       $v0, $v0, 0x61F9
/* 22314 80031B14 27104400 */  nor        $v0, $v0, $a0
/* 22318 80031B18 0800E003 */  jr         $ra
/* 2231C 80031B1C FFFF4230 */   andi      $v0, $v0, 0xFFFF
.size GAMEPAD_RemapAnalogueButtons, . - GAMEPAD_RemapAnalogueButtons
