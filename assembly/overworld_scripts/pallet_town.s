.align 2
.thumb

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Pallet_FatGuy

EventScript_Pallet_FatGuy:
    faceplayer
    lock
    setvar 0x8001 0x84
    special 0xD1
    msgbox gText_TestScript MSG_NORMAL
    release
    end

.align 2
.global EventScript_Pallet_Girl

EventScript_Pallet_Girl:
    setflag 0x828
    setflag 0x4BD
    givepokemon 0x1 0x5 0x0 0x0 0x0 0x0
    givepokemon 0x2 0x5 0x0 0x0 0x0 0x0
    givepokemon 0x3 0x5 0x0 0x0 0x0 0x0
    givepokemon 0x4 0x5 0x0 0x0 0x0 0x0
    givepokemon 0x5 0x5 0x0 0x0 0x0 0x0
    giveegg 0x1
    end
