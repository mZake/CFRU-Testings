#include "../defines.h"
#include "../../include/following_mon_sprites.h"

static const struct SpriteFrameImage sPicTable_Bulbasaur[] = {
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 0),
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 1),
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 2),
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 3),
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 4),
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 5),
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 6),
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 7),
    overworld_frame(gFollowingMonPic0001_Bulbasaur_PNGTiles, 4, 4, 8),
};

static const struct SpriteFrameImage sPicTable_Ivysaur[] = {
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 0),
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 1),
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 2),
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 3),
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 4),
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 5),
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 6),
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 7),
    overworld_frame(gFollowingMonPic0002_Ivysaur_PNGTiles, 4, 4, 8),
};

static const struct SpriteFrameImage sPicTable_Venusaur[] = {
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 0),
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 1),
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 2),
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 3),
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 4),
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 5),
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 6),
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 7),
    overworld_frame(gFollowingMonPic0003_Venusaur_PNGTiles, 4, 4, 8),
};

static const struct SpriteFrameImage sPicTable_Charmander[] = {
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 0),
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 1),
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 2),
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 3),
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 4),
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 5),
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 6),
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 7),
    overworld_frame(gFollowingMonPic0004_Charmander_PNGTiles, 4, 4, 8),
};

static const struct SpriteFrameImage sPicTable_Charmeleon[] = {
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 0),
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 1),
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 2),
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 3),
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 4),
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 5),
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 6),
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 7),
    overworld_frame(gFollowingMonPic0005_Charmeleon_PNGTiles, 4, 4, 8),
};

const struct EventObjectGraphicsInfo gFollowingMonGraphics[] =
{
    {
        .tileTag = 0xFFFF,
        .paletteTag1 = 0x1200,
        .paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
        .size = (32 * 32) / 2,
        .width = 32,
        .height = 32,
        .shadowSize = SHADOW_SIZE_M, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
        .inanimate = FALSE,
        .disableReflectionPaletteLoad = FALSE,
        .tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
        .gender = MALE, //Can also be FEMALE
        .oam = gEventObjectBaseOam_32x32,
        .subspriteTables = gEventObjectSpriteOamTables_32x32,
        .anims = gEventObjectImageAnimTable_Standard,
        .images = sPicTable_Bulbasaur,
        .affineAnims = gDummySpriteAffineAnimTable,
    },
    {
        .tileTag = 0xFFFF,
        .paletteTag1 = 0x1201,
        .paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
        .size = (32 * 32) / 2,
        .width = 32,
        .height = 32,
        .shadowSize = SHADOW_SIZE_M, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
        .inanimate = FALSE,
        .disableReflectionPaletteLoad = FALSE,
        .tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
        .gender = MALE, //Can also be FEMALE
        .oam = gEventObjectBaseOam_32x32,
        .subspriteTables = gEventObjectSpriteOamTables_32x32,
        .anims = gEventObjectImageAnimTable_Standard,
        .images = sPicTable_Ivysaur,
        .affineAnims = gDummySpriteAffineAnimTable,
    },
    {
        .tileTag = 0xFFFF,
        .paletteTag1 = 0x1202,
        .paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
        .size = (32 * 32) / 2,
        .width = 32,
        .height = 32,
        .shadowSize = SHADOW_SIZE_M, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
        .inanimate = FALSE,
        .disableReflectionPaletteLoad = FALSE,
        .tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
        .gender = MALE, //Can also be FEMALE
        .oam = gEventObjectBaseOam_32x32,
        .subspriteTables = gEventObjectSpriteOamTables_32x32,
        .anims = gEventObjectImageAnimTable_Standard,
        .images = sPicTable_Venusaur,
        .affineAnims = gDummySpriteAffineAnimTable,
    },
    {
        .tileTag = 0xFFFF,
        .paletteTag1 = 0x1203,
        .paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
        .size = (32 * 32) / 2,
        .width = 32,
        .height = 32,
        .shadowSize = SHADOW_SIZE_M, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
        .inanimate = FALSE,
        .disableReflectionPaletteLoad = FALSE,
        .tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
        .gender = MALE, //Can also be FEMALE
        .oam = gEventObjectBaseOam_32x32,
        .subspriteTables = gEventObjectSpriteOamTables_32x32,
        .anims = gEventObjectImageAnimTable_Standard,
        .images = sPicTable_Charmander,
        .affineAnims = gDummySpriteAffineAnimTable,
    },
    {
        .tileTag = 0xFFFF,
        .paletteTag1 = 0x1204,
        .paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
        .size = (32 * 32) / 2,
        .width = 32,
        .height = 32,
        .shadowSize = SHADOW_SIZE_M, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
        .inanimate = FALSE,
        .disableReflectionPaletteLoad = FALSE,
        .tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
        .gender = MALE, //Can also be FEMALE
        .oam = gEventObjectBaseOam_32x32,
        .subspriteTables = gEventObjectSpriteOamTables_32x32,
        .anims = gEventObjectImageAnimTable_Standard,
        .images = sPicTable_Charmeleon,
        .affineAnims = gDummySpriteAffineAnimTable,
    },
};