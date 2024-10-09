#include "../defines.h"
#include "../../include/following_mon_sprites.h"

//Add Followers Frames Here
MON_OW_TEMPLATE_32x32_FRAMES(0001, Bulbasaur)
MON_OW_TEMPLATE_32x32_FRAMES(0002, Ivysaur)
MON_OW_TEMPLATE_32x32_FRAMES(0003, Venusaur)
MON_OW_TEMPLATE_32x32_FRAMES(0004, Charmander)
MON_OW_TEMPLATE_32x32_FRAMES(0005, Charmeleon)

//Add Followers Graphics Info Here
const struct EventObjectGraphicsInfo gFollowingMonGraphics[] =
{
    MON_OW_OBJECT_GRAPHICS(1200, Bulbasaur)
    MON_OW_OBJECT_GRAPHICS(1201, Ivysaur)
    MON_OW_OBJECT_GRAPHICS(1202, Venusaur)
    MON_OW_OBJECT_GRAPHICS(1203, Charmander)
    MON_OW_OBJECT_GRAPHICS(1204, Charmeleon)
};