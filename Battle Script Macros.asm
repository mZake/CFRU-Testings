@Useful Stuff
@Battle Scripts
.equ FAILED, 0x81D7DF2
.equ NOEFFECT, 0x81D7E04
.equ ABSORB_REBRANCHER, 0x81D694E
.equ BS_MOVE_END, 0x81D694E
.equ BS_MOVE_MISSED, 0x81D695E

@Banks
.equ BANK_TARGET, 0x0
.equ BANK_ATTACKER, 0x1

@Comparisons
.equ EQUALS, 0x0
.equ NOTEQUALS, 0x1
.equ GREATERTHAN, 0x2
.equ LESSTHAN, 0x3
.equ ANDS, 0x4
.equ NOTANDS, 0x5

@Delays
.equ DELAY_1SECOND, 0x40
.equ DELAY_HALFSECOND, 0x20

@Booleans
.equ FALSE, 0x0
.equ TRUE, 0x1

@Macros
	.macro calculatedamage
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage
	.endm
	
	.macro returnopponentmon1toball bank
	.byte 0x76
	.byte \bank
	.byte 0x9
	.endm

	.macro returnopponentmon2toball bank
	.byte 0x77
	.byte \bank
	.byte 0xA
	.endm

	.macro jumpifmove compare, rom_address
	.byte 0x2a
	.byte EQUALS
	.4byte CURRENT_MOVE
	.2byte \compare
	.4byte \rom_address
	.endm
	
	.macro jumpifnotmove compare, rom_address
	.byte 0x2a
	.byte NOTEQUALS
	.4byte CURRENT_MOVE
	.2byte \compare
	.4byte \rom_address
	.endm
	
	.macro setmoveeffect effect
	.byte 0x2E
	.word EFFECT_BYTE
	.byte \effect
	.endm
	
	.macro jumpifmovehadnoeffect rom_address
	.byte 0x29
	.byte ANDS
	.word OUTCOME
	.byte OUTCOME_NO_EFFECT
	.word /rom_address
	.endm

	.macro attackcanceler
	.byte 0x00
	.endm

	.macro accuracycheck rom_address, param1
	.byte 0x01
	.4byte \rom_address
	.2byte \param1
	.endm

	.macro attackstring
	.byte 0x02
	.endm

	.macro ppreduce
	.byte 0x03
	.endm

	.macro critcalc
	.byte 0x04
	.endm

	.macro damagecalc
	.byte 0x05
	.endm

	.macro typecalc
	.byte 0x06
	.endm

	.macro adjustnormaldamage
	.byte 0x07
	.endm

	.macro adjustnormaldamage2
	.byte 0x08
	.endm

	.macro attackanimation
	.byte 0x09
	.endm

	.macro waitanimation
	.byte 0x0a
	.endm

	.macro graphicalhpupdate bank
	.byte 0x0b
	.byte \bank
	.endm

	.macro datahpupdate bank
	.byte 0x0c
	.byte \bank
	.endm

	.macro critmessage
	.byte 0x0d
	.endm

	.macro missmessage
	.byte 0x0e
	.endm

	.macro resultmessage
	.byte 0x0f
	.endm

	.macro printstring string
	.byte 0x10
	.2byte \string
	.endm

	.macro printstring2 string
	.byte 0x11
	.2byte \string
	.endm

	.macro waitmessage delay
	.byte 0x12
	.2byte \delay
	.endm

	.macro printfromtable table
	.byte 0x13
	.4byte \table
	.endm

	.macro printfromtable2 table
	.byte 0x14
	.4byte \table
	.endm

	.macro seteffectwithchancetarget
	.byte 0x15
	.endm

	.macro seteffecttarget
	.byte 0x16
	.endm

	.macro seteffectuser
	.byte 0x17
	.endm

	.macro clearstatus bank
	.byte 0x18
	.byte \bank
	.endm

	.macro faintpokemon bank, param2, param3
	.byte 0x19
	.byte \bank
	.byte \param2
	.4byte \param3
	.endm

	.macro dofaintanimation param1
	.byte 0x1a
	.byte \param1
	.endm

	.macro cleareffectsonfaint bank
	.byte 0x1b
	.byte \bank
	.endm

	.macro jumpifstatus bank, status, rom_address
	.byte 0x1c
	.byte \bank
	.4byte \status
	.4byte \rom_address
	.endm

	.macro jumpifsecondarystatus bank, status, rom_address
	.byte 0x1d
	.byte \bank
	.4byte \status
	.4byte \rom_address
	.endm

	.macro jumpifability bank, ability, rom_address
	.byte 0x1e
	.byte \bank
	.byte \ability
	.4byte \rom_address
	.endm

	.macro jumpifhalverset bank, status, rom_address
	.byte 0x1f
	.byte \bank
	.2byte \status
	.4byte \rom_address
	.endm

	.macro jumpifstat bank, predicate, statid, quantity, rom_address
	.byte 0x20
	.byte \bank
	.byte \predicate
	.byte \quantity
	.byte \statid
	.4byte \rom_address
	.endm

	.macro jumpifspecialstatusflag bank, mask, status, rom_address
	.byte 0x21
	.byte \bank
	.4byte \mask
	.byte \status
	.4byte \rom_address
	.endm

	.macro jumpiftype bank, type, rom_address
	.byte 0x22
	.byte \bank
	.byte \type
	.4byte \rom_address
	.endm

	.macro getexp bank
	.byte 0x23
	.byte \bank
	.endm

	.macro ifwildbattleend rom_address
	.byte 0x24
	.4byte \rom_address
	.endm

	.macro movevaluescleanup
	.byte 0x25
	.endm

	.macro storeloopingcounter param1
	.byte 0x26
	.byte \param1
	.endm

	.macro decrementmultihit rom_address
	.byte 0x27
	.4byte \rom_address
	.endm

	.macro goto rom_address
	.byte 0x28
	.4byte \rom_address
	.endm

	.macro jumpifbyte predicate, checkaddr, compare, rom_address
	.byte 0x29
	.byte \predicate
	.4byte \checkaddr
	.byte \compare
	.4byte \rom_address
	.endm

	.macro jumpifhalfword predicate, checkaddr, compare, rom_address
	.byte 0x2a
	.byte \predicate
	.4byte \checkaddr
	.2byte \compare
	.4byte \rom_address
	.endm

	.macro jumpifword predicate, checkaddr, compare, rom_address
	.byte 0x2b
	.byte \predicate
	.4byte \checkaddr
	.4byte \compare
	.4byte \rom_address
	.endm

	.macro jumpifarrayequal mem1, mem2, size, rom_address
	.byte 0x2c
	.4byte \mem1
	.4byte \mem2
	.byte \size
	.4byte \rom_address
	.endm

	.macro jumpifarraynotequal mem1, mem2, size, rom_address
	.byte 0x2d
	.4byte \mem1
	.4byte \mem2
	.byte \size
	.4byte \rom_address
	.endm

	.macro setbyte pointer, value
	.byte 0x2e
	.4byte \pointer
	.byte \value
	.endm

	.macro addbyte pointer, value
	.byte 0x2f
	.4byte \pointer
	.byte \value
	.endm

	.macro subtractbyte pointer, value
	.byte 0x30
	.4byte \pointer
	.byte \value
	.endm

	.macro copyarray destination, source, size
	.byte 0x31
	.4byte \destination
	.4byte \source
	.byte \size
	.endm

	.macro copyarraywithindex destination, source, index, size
	.byte 0x32
	.4byte \destination
	.4byte \source
	.4byte \index
	.byte \size
	.endm

	.macro orbyte pointer, value
	.byte 0x33
	.4byte \pointer
	.byte \value
	.endm

	.macro orhalfword pointer, value
	.byte 0x34
	.4byte \pointer
	.2byte \value
	.endm

	.macro orword pointer, value
	.byte 0x35
	.4byte \pointer
	.4byte \value
	.endm

	.macro bicbyte pointer, value
	.byte 0x36
	.4byte \pointer
	.byte \value
	.endm

	.macro bichalfword pointer, value
	.byte 0x37
	.4byte \pointer
	.2byte \value
	.endm

	.macro bicword pointer, value
	.byte 0x38
	.4byte \pointer
	.4byte \value
	.endm

	.macro pause delay
	.byte 0x39
	.2byte \delay
	.endm

	.macro waitstateatk
	.byte 0x3a
	.endm

	.macro healthbarupdate bank
	.byte 0x3b
	.byte \bank
	.endm

	.macro return
	.byte 0x3c
	.endm

	.macro end
	.byte 0x3d
	.endm

	.macro end2
	.byte 0x3e
	.endm

	.macro end3
	.byte 0x3f
	.endm

	.macro jumpifaffectedbyprotect rom_address
	.byte 0x40
	.4byte \rom_address
	.endm

	.macro call rom_address
	.byte 0x41
	.4byte \rom_address
	.endm

	.macro jumpiftype2 bank, type, rom_address
	.byte 0x42
	.byte \bank
	.byte \type
	.4byte \rom_address
	.endm

	.macro jumpifabilitypresent ability, rom_address
	.byte 0x43
	.byte \ability
	.4byte \rom_address
	.endm

	.macro endselectionscript
	.byte 0x44
	.endm

	.macro playanimation bank, animation, var_address
	.byte 0x45
	.byte \bank
	.byte \animation
	.4byte \var_address
	.endm

	.macro playanimation2 bank, mem_address, int
	.byte 0x46
	.byte \bank
	.4byte \mem_address
	.4byte \int
	.endm

	.macro setgraphicalstatchangevalues
	.byte 0x47
	.endm

	.macro playstatchangeanimation bank, color, int
	.byte 0x48
	.byte \bank
	.byte \color
	.byte \int
	.endm

	.macro cmd49 bank, int
	.byte 0x49
	.byte \bank
	.byte \int
	.endm

	.macro typecalc2
	.byte 0x4a
	.endm

	.macro returnatktoball
	.byte 0x4b
	.endm

	.macro switch1 bank
	.byte 0x4c
	.byte \bank
	.endm

	.macro switch2 bank
	.byte 0x4d
	.byte \bank
	.endm

	.macro switch3 bank, int
	.byte 0x4e
	.byte \bank
	.byte \int
	.endm

	.macro jumpifcannotswitch bank, rom_address
	.byte 0x4f
	.byte \bank
	.4byte \rom_address
	.endm

	.macro openpartyscreen bank, rom_address
	.byte 0x50
	.byte \bank
	.4byte \rom_address
	.endm

	.macro switchhandleorder bank, param2
	.byte 0x51
	.byte \bank
	.byte \param2
	.endm

	.macro switchineffects bank
	.byte 0x52
	.byte \bank
	.endm

	.macro trainerslidein bank
	.byte 0x53
	.byte \bank
	.endm

	.macro playse effect
	.byte 0x54
	.2byte \effect
	.endm

	.macro fanfare int
	.byte 0x55
	.4byte \int
	.endm

	.macro pokemonfaintcry bank_or_side
	.byte 0x56
	.byte \bank_or_side
	.endm

	.macro flee
	.byte 0x57
	.endm

	.macro returntoball bank
	.byte 0x58
	.byte \bank
	.endm

	.macro handlelearnnewmove param1, param2, bank_maybe
	.byte 0x59
	.4byte \param1
	.4byte \param2
	.byte \bank_maybe
	.endm

	.macro yesnoboxlearnmove rom_address
	.byte 0x5a
	.4byte \rom_address
	.endm

	.macro yesnoboxstoplearningmove rom_address
	.byte 0x5b
	.4byte \rom_address
	.endm

	.macro flash bank
	.byte 0x5c
	.byte \bank
	.endm

	.macro getmoneyreward rom_address
	.byte 0x5d
	.4byte \rom_address
	.endm

	.macro atk5e bank
	.byte 0x5e
	.byte \bank
	.endm

	.macro atk5f
	.byte 0x5f
	.endm

	.macro incrementgamestat int
	.byte 0x60
	.byte \int
	.endm

	.macro drawpartystatussummary bank_or_side
	.byte 0x61
	.byte \bank_or_side
	.endm

	.macro atk62 bank_or_side
	.byte 0x62
	.byte \bank_or_side
	.endm

	.macro jumptoattack bank
	.byte 0x63
	.byte \bank
	.endm

	.macro statusanimation bank
	.byte 0x64
	.byte \bank
	.endm

	.macro status2animation bank_or_side, rom_address
	.byte 0x65
	.byte \bank_or_side
	.4byte \rom_address
	.endm

	.macro chosenstatusanimation bank_or_side, bank_or_side2, status
	.byte 0x66
	.byte \bank_or_side
	.byte \bank_or_side2
	.4byte \status
	.endm

	.macro yesnobox
	.byte 0x67
	.endm

	.macro cancelallactions
	.byte 0x68
	.endm

	.macro adjustsetdamage
	.byte 0x69
	.endm

	.macro removeitem bank
	.byte 0x6a
	.byte \bank
	.endm

	.macro atknameinbuff1
	.byte 0x6b
	.endm

	.macro drawlvlupbox
	.byte 0x6c
	.endm

	.macro resetsentmonsvalue
	.byte 0x6d
	.endm

	.macro setatktoplayer0
	.byte 0x6e
	.endm

	.macro makevisible bank
	.byte 0x6f
	.byte \bank
	.endm

	.macro recordlastability bank
	.byte 0x70
	.byte \bank
	.endm

	.macro buffermovetolearn
	.byte 0x71
	.endm

	.macro jumpifplayerran rom_address
	.byte 0x72
	.4byte \rom_address
	.endm

	.macro hpthresholds bank
	.byte 0x73
	.byte \bank
	.endm

	.macro hpthresholds2 bank
	.byte 0x74
	.byte \bank
	.endm

	.macro useitemonopponent
	.byte 0x75
	.endm

	.macro atk76 bank, int
	.byte 0x76
	.byte \bank
	.byte \int
	.endm

	.macro setprotect
	.byte 0x77
	.endm

	.macro faintifabilitynotdamp
	.byte 0x78
	.endm

	.macro setuserhptozero
	.byte 0x79
	.endm

	.macro jumpwhiletargetvalid rom_address
	.byte 0x7a
	.4byte \rom_address
	.endm

	.macro setdamageasrestorehalfmaxhp rom_address, int
	.byte 0x7b
	.4byte \rom_address
	.byte \int
	.endm

	.macro jumptolastusedattack
	.byte 0x7c
	.endm

	.macro setrain
	.byte 0x7d
	.endm

	.macro setreflect
	.byte 0x7e
	.endm

	.macro setleechseed
	.byte 0x7f
	.endm

	.macro manipulatedamage id
	.byte 0x80
	.byte \id
	.endm

	.macro setrest rom_address
	.byte 0x81
	.4byte \rom_address
	.endm

	.macro jumpifnotfirstturn rom_address
	.byte 0x82
	.4byte \rom_address
	.endm

	.macro nop3
	.byte 0x83
	.endm

	.macro jumpifcannotsleep rom_address
	.byte 0x84
	.4byte \rom_address
	.endm

	.macro stockpile
	.byte 0x85
	.endm

	.macro stockpiletobasedamage rom_address
	.byte 0x86
	.4byte \rom_address
	.endm

	.macro stockpiletohprecovery rom_address
	.byte 0x87
	.4byte \rom_address
	.endm

	.macro negativedamage
	.byte 0x88
	.endm

	.macro statbuffchange target, rom_address
	.byte 0x89
	.byte \target
	.4byte \rom_address
	.endm

	.macro normalisebuffs
	.byte 0x8a
	.endm

	.macro setbide
	.byte 0x8b
	.endm

	.macro confuseifrepeatingattackends
	.byte 0x8c
	.endm

	.macro setloopcounter count
	.byte 0x8d
	.byte \count
	.endm

	.macro initmultihitstring
	.byte 0x8e
	.endm

	.macro forcerandomswitch rom_address
	.byte 0x8f
	.4byte \rom_address
	.endm

	.macro changetypestoenemyattacktype rom_address
	.byte 0x90
	.4byte \rom_address
	.endm

	.macro givepaydaymoney
	.byte 0x91
	.endm

	.macro setlightscreen
	.byte 0x92
	.endm

	.macro tryKO rom_address
	.byte 0x93
	.4byte \rom_address
	.endm

	.macro gethalfcurrentenemyhp
	.byte 0x94
	.endm

	.macro setsandstorm
	.byte 0x95
	.endm

	.macro weatherdamage
	.byte 0x96
	.endm

	.macro tryinfatuatetarget rom_address
	.byte 0x97
	.4byte \rom_address
	.endm

	.macro refreshhpbar bank
	.byte 0x98
	.byte \bank
	.endm

	.macro setmisteffect
	.byte 0x99
	.endm

	.macro setincreasedcriticalchance
	.byte 0x9a
	.endm

	.macro transformdataexecution
	.byte 0x9b
	.endm

	.macro setsubstituteeffect
	.byte 0x9c
	.endm

	.macro copyattack rom_address
	.byte 0x9d
	.4byte \rom_address
	.endm

	.macro metronomeeffect
	.byte 0x9e
	.endm

	.macro nightshadedamageeffect
	.byte 0x9f
	.endm

	.macro psywavedamageeffect
	.byte 0xa0
	.endm

	.macro counterdamagecalculator rom_address
	.byte 0xa1
	.4byte \rom_address
	.endm

	.macro mirrorcoatdamagecalculator rom_address
	.byte 0xa2
	.4byte \rom_address
	.endm

	.macro disablelastusedattack rom_address
	.byte 0xa3
	.4byte \rom_address
	.endm

	.macro setencore rom_address
	.byte 0xa4
	.4byte \rom_address
	.endm

	.macro painsplitdamagecalculator rom_address
	.byte 0xa5
	.4byte \rom_address
	.endm

	.macro settypetorandomresistance rom_address
	.byte 0xa6
	.4byte \rom_address
	.endm

	.macro setalwayshitflag
	.byte 0xa7
	.endm

	.macro copymovepermanently rom_address
	.byte 0xa8
	.4byte \rom_address
	.endm

	.macro trychoosesleeptalkmove rom_address
	.byte 0xa9
	.4byte \rom_address
	.endm

	.macro destinybondeffect
	.byte 0xaa
	.endm

	.macro trysetdestinybondtohappen
	.byte 0xab
	.endm

	.macro remaininghptopower
	.byte 0xac
	.endm

	.macro reducepprandom rom_address
	.byte 0xad
	.4byte \rom_address
	.endm

	.macro healpartystatus
	.byte 0xae
	.endm

	.macro cursetarget rom_address
	.byte 0xaf
	.4byte \rom_address
	.endm

	.macro setspikes rom_address
	.byte 0xb0
	.4byte \rom_address
	.endm

	.macro setforesight
	.byte 0xb1
	.endm

	.macro setperishsong rom_address
	.byte 0xb2
	.4byte \rom_address
	.endm

	.macro rolloutdamagecalculation
	.byte 0xb3
	.endm

	.macro jumpifconfusedandattackmaxed bank, rom_address
	.byte 0xb4
	.byte \bank
	.4byte \rom_address
	.endm

	.macro furycutterdamagecalculation
	.byte 0xb5
	.endm

	.macro happinesstodamagecalculation
	.byte 0xb6
	.endm

	.macro presentdamagecalculation
	.byte 0xb7
	.endm

	.macro setsafeguard
	.byte 0xb8
	.endm

	.macro magnitudedamagecalculation
	.byte 0xb9
	.endm

	.macro jumpifnopursuitswitchdmg rom_address
	.byte 0xba
	.4byte \rom_address
	.endm

	.macro setsunny
	.byte 0xbb
	.endm

	.macro maxattackhalvehp rom_address
	.byte 0xbc
	.4byte \rom_address
	.endm

	.macro copyfoestats rom_address
	.byte 0xbd
	.4byte \rom_address
	.endm

	.macro breakfree
	.byte 0xbe
	.endm

	.macro setcurled
	.byte 0xbf
	.endm

	.macro recoverbasedonsunlight rom_address
	.byte 0xc0
	.4byte \rom_address
	.endm

	.macro hiddenpowerdamagecalculation
	.byte 0xc1
	.endm

	.macro selectnexttarget
	.byte 0xc2
	.endm

	.macro setfutureattack rom_address
	.byte 0xc3
	.4byte \rom_address
	.endm

	.macro beatupcalculation rom_address1, rom_address2
	.byte 0xc4
	.4byte \rom_address1
	.4byte \rom_address2
	.endm

	.macro setsemiinvulnerablebit
	.byte 0xc5
	.endm

	.macro clearsemiinvulnerablebit
	.byte 0xc6
	.endm

	.macro setminimize
	.byte 0xc7
	.endm

	.macro sethail
	.byte 0xc8
	.endm

	.macro jumpifattackandspecialattackcannotfall rom_address
	.byte 0xc9
	.4byte \rom_address
	.endm

	.macro setforcedtarget
	.byte 0xca
	.endm

	.macro setcharge
	.byte 0xcb
	.endm

	.macro callterrainattack
	.byte 0xcc
	.endm

	.macro cureifburnedparalysedorpoisoned rom_address
	.byte 0xcd
	.4byte \rom_address
	.endm

	.macro settorment rom_address
	.byte 0xce
	.4byte \rom_address
	.endm

	.macro jumpifnodamage rom_address
	.byte 0xcf
	.4byte \rom_address
	.endm

	.macro settaunt rom_address
	.byte 0xd0
	.4byte \rom_address
	.endm

	.macro sethelpinghand rom_address
	.byte 0xd1
	.4byte \rom_address
	.endm

	.macro itemswap rom_address
	.byte 0xd2
	.4byte \rom_address
	.endm

	.macro copyability rom_address
	.byte 0xd3
	.4byte \rom_address
	.endm

	.macro trywish functype, rom_address
	.byte 0xd4
	.byte \functype
	.4byte \rom_address
	.endm

	.macro setroots rom_address
	.byte 0xd5
	.4byte \rom_address
	.endm

	.macro doubledamagedealtifdamaged
	.byte 0xd6
	.endm

	.macro setyawn rom_address
	.byte 0xd7
	.4byte \rom_address
	.endm

	.macro setdamagetohealthdifference rom_address
	.byte 0xd8
	.4byte \rom_address
	.endm

	.macro scaledamagebyhealthratio
	.byte 0xd9
	.endm

	.macro abilityswap rom_address
	.byte 0xda
	.4byte \rom_address
	.endm

	.macro imprisoneffect rom_address
	.byte 0xdb
	.4byte \rom_address
	.endm

	.macro setgrudge rom_address
	.byte 0xdc
	.4byte \rom_address
	.endm

	.macro weightdamagecalculation
	.byte 0xdd
	.endm

	.macro assistattackselect rom_address
	.byte 0xde
	.4byte \rom_address
	.endm

	.macro setmagiccoat rom_address
	.byte 0xdf
	.4byte \rom_address
	.endm

	.macro setstealstatchange rom_address
	.byte 0xe0
	.4byte \rom_address
	.endm

	.macro atke1 rom_address
	.byte 0xe1
	.4byte \rom_address
	.endm

	.macro switchoutabilities bank
	.byte 0xe2
	.byte \bank
	.endm

	.macro jumpiffainted bank, rom_address
	.byte 0xe3
	.byte \bank
	.4byte \rom_address
	.endm

	.macro secretpower
	.byte 0xe4
	.endm

	.macro pickupitemcalculation
	.byte 0xe5
	.endm

	.macro castformtransform
	.byte 0xe6
	.endm

	.macro castformswitch
	.byte 0xe7
	.endm

	.macro settypebasedhalvers rom_address
	.byte 0xe8
	.4byte \rom_address
	.endm

	.macro seteffectbyweather
	.byte 0xe9
	.endm

	.macro recycleitem rom_address
	.byte 0xea
	.4byte \rom_address
	.endm

	.macro settypetoterrain rom_address
	.byte 0xeb
	.4byte \rom_address
	.endm

	.macro pursuitwhenswitched rom_address
	.byte 0xec
	.4byte \rom_address
	.endm

	.macro snatchmove
	.byte 0xed
	.endm

	.macro removereflectlightscreen
	.byte 0xee
	.endm

	.macro pokemoncatchfunction
	.byte 0xef
	.endm

	.macro catchpoke
	.byte 0xf0
	.endm

	.macro trysetcaughtmondexflags rom_address
	.byte 0xf1
	.4byte \rom_address
	.endm

	.macro displaydexinfo
	.byte 0xf2
	.endm

	.macro capturenicknamepoke rom_address
	.byte 0xf3
	.4byte \rom_address
	.endm

	.macro subattackerhpbydmg
	.byte 0xf4
	.endm

	.macro removeattackerstatus1
	.byte 0xf5
	.endm

	.macro finishaction
	.byte 0xf6
	.endm

	.macro finishturn
	.byte 0xf7
	.endm

	.macro callasm asm_address
	.byte 0xf8
	.4byte \asm_address
	.endm

	.macro sethalfword mem_address hword
	.byte 0xf9
	.4byte \mem_address
	.2byte \hword
	.endm

	.macro setword mem_address word
	.byte 0xfa
	.4byte \mem_address
	.4byte \word
	.endm

	.macro setspecialstatusbit bank specialstatus
	.byte 0xfb
	.byte \bank
	.4byte \specialstatus
	.endm

	.macro clearspecialstatusbit bank specialstatus
	.byte 0xfc
	.byte \bank
	.4byte \specialstatus
	.endm

	.macro jumpifabilitypresenttargetfield ability rom_address
	.byte 0xfd
	.byte \ability
	.4byte \rom_address
	.endm

	.macro jumpifspecies bank species rom_address
	.byte 0xfe
	.byte \bank
	.2byte \species
	.4byte \rom_address
	.endm

	.macro cureprimarystatus bank rom_address
	.byte 0xFF, 0x02
	.byte \bank
	.4byte \rom_address
	.endm

	.macro jumpifpartnerattack moveid rom_address
	.byte 0xFF, 0x03
	.byte \moveid
	.4byte \rom_address
	.endm

	.macro setterrain
	.byte 0xFF, 0x06
	.endm

	.macro jumpifhelditemeffect bank effect rom_address
	.byte 0xFF, 0x07
	.byte \bank
	.byte \effect
	.4byte \rom_address
	.endm

	.macro counterclear bank counter_address rom_address
	.byte 0xFF, 0x08
	.byte \bank
	.4byte \counter_address
	.4byte \rom_address
	.endm

	.macro jumpifcounter bank counter_address predicate compare_byte rom_address
	.byte 0xFF, 0x09
	.byte \bank
	.4byte \counter_address
	.byte \predicate
	.byte \compare_byte
	.4byte \rom_address
	.endm
	
	.macro setcounter bank counter_address num
	.byte 0xFF, 0x0E
	.byte \bank
	.4byte \counter_address
	.byte \num
	.endm
	
	.macro jumpifgrounded bank rom_address
	.byte 0xFF, 0x0F
	.byte \bank
	.4byte \rom_address
	.endm

	.macro reloadhealthbar bank
	.byte 0xFF, 0x11
	.byte \bank
	.endm
	
	.macro setdamagetobankhealthpercent bank percent
	.byte 0xFF, 0x13
	.byte \bank
	.byte \percent
	.endm

	.macro sethalvermarker bank halver
	.byte 0xFF, 0x17
	.byte \bank
	.2byte \halver
	.endm

	.macro clearhalvermarker bank halver
	.byte 0xFF, 0x1A
	.byte \bank
	.2byte \halver
	.endm
