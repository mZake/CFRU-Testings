#include "global.h"
#include "constants/event_objects.h"

#define EVENT_OBJ_PAL_TAG_NONE 0x1102
#define gEventObjectBaseOam_16x16 ((const struct OamData*) 0x83A36F8)
#define gEventObjectBaseOam_16x32 ((const struct OamData*) 0x83A3710)
#define gEventObjectBaseOam_32x32 ((const struct OamData*) 0x83A3718)
#define gEventObjectBaseOam_64x64 ((const struct OamData*) 0x83A3720)
#define gEventObjectSpriteOamTables_16x16 ((const struct SubspriteTable*) 0x83A3748)
#define gEventObjectSpriteOamTables_16x32 ((const struct SubspriteTable*) 0x83A379C)
#define gEventObjectSpriteOamTables_32x32 ((const struct SubspriteTable*) 0x83A37F0)
#define gEventObjectSpriteOamTables_64x64 ((const struct SubspriteTable*) 0x83A38D0)
#define gEventObjectImageAnimTable_PlayerNormal ((const union AnimCmd* const*) 0x83A3470)
#define gEventObjectImageAnimTable_Standard ((const union AnimCmd* const*) 0x83A3368)
#define gEventObjectImageAnimTable_Surfing ((const union AnimCmd* const*) 0x83A3584)
#define gEventObjectImageAnimTable_FieldMove ((const union AnimCmd* const*) 0x83A3638)
#define gEventObjectImageAnimTable_Fishing ((const union AnimCmd* const*) 0x83A3668)
#define gEventObjectImageAnimTable_VsSeekerBike ((const union AnimCmd* const*) 0x83A3640)

// Images declarations
extern const u8 gFollowingMonPic0001_Bulbasaur_PNGTiles[];
extern const u8 gFollowingMonPic0002_Ivysaur_PNGTiles[];
extern const u8 gFollowingMonPic0003_Venusaur_PNGTiles[];
extern const u8 gFollowingMonPic0004_Charmander_PNGTiles[];
extern const u8 gFollowingMonPic0005_Charmeleon_PNGTiles[];

// Palettes declarations
extern const u16 gFollowingMonPic0001_Bulbasaur_PNGPal[];
extern const u16 gFollowingMonPic0002_Ivysaur_PNGPal[];
extern const u16 gFollowingMonPic0003_Venusaur_PNGPal[];
extern const u16 gFollowingMonPic0004_Charmander_PNGPal[];
extern const u16 gFollowingMonPic0005_Charmeleon_PNGPal[];

static const struct SpritePalette sObjectEventSpritePalettes12[] =
{
    {gFollowingMonPic0001_Bulbasaur_PNGPal, 0x1200},
    {gFollowingMonPic0002_Ivysaur_PNGPal, 0x1201},
    {gFollowingMonPic0003_Venusaur_PNGPal, 0x1202},
    {gFollowingMonPic0004_Charmander_PNGPal, 0x1203},
    {gFollowingMonPic0005_Charmeleon_PNGPal, 0x1204},
};
