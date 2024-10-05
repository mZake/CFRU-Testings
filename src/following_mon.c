#include "defines.h"
#include "../include/pokemon.h"
#include "../include/new/follow_me.h"

// Made by Zake
void ChangeFollowingMonSprite(void)
{
    u8 SlotId = 0xFE;
    u16 OwTableId = 0;

    for (s8 i = 5; i >= 0; --i)
        if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG, NULL))
            SlotId = i;

    if (SlotId == 0xFE) //Quer dizer que todos os mons são ovos
        return;

    u16 Species = GetMonData(&gPlayerParty[SlotId], MON_DATA_SPECIES, NULL);

    if (Species < 0xFF) // 0x0-0xFE | 0100-01FE
    {
        OwTableId = 0x0100;
        Species -= 0x1;
        OwTableId += Species;
    }
    else if ((Species > 0xFE) && (Species < 0x1FE)) // 0xFF-0x1FD | 0200-02FE
    {
        OwTableId = 0x0200;
        Species -= 0x100;
        OwTableId += Species;
    }
    else if ((Species > 0x1FD) && (Species < 0x2FD)) // 0x1FE-0x2FC | 0300-03FE
    {
        OwTableId = 0x0300;
        Species -= 0x1FF;
        OwTableId += Species;
    }
    else if ((Species > 0x2FC) && (Species < 0x3FC)) // 0x2FD-0x3FB | 0400-04FE
    {
        OwTableId = 0x0400;
        Species -= 0x2FE;
        OwTableId += Species;
    }
    else if ((Species > 0x3FB) && (Species < 0x4FB)) // 0x3FC-0x4FA | 0500-05FE
    {
        OwTableId = 0x0500;
        Species -= 0x3FD;
        OwTableId += Species;
    }
    else if ((Species > 0x4FA) && (Species < 0x5FA)) // 0x4FB-0x5F9 | 0600-06FE
    {
        OwTableId = 0x0600;
        Species -= 0x4FC;
        OwTableId += Species;
    }

    gFollowerState.gfxId = OwTableId;
}
