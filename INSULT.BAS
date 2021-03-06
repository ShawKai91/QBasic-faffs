DIM Insult(50, 3) AS STRING
RANDOMIZE TIMER / 3: CLS

RESTORE InsultList
FOR J = 0 TO 2
    FOR I = 0 TO 49
        READ Insult(I, J)
    NEXT
NEXT
MakeInsult:
    COLOR 1: PRINT "Thou"
    COLOR 14: FOR J = 0 TO 2: PRINT Insult(RND * 50, J); " "; : NEXT
    WHILE BTN$ <> CHR$(27)
        BTN$ = INKEY$
        IF BTN$ = CHR$(32) THEN PRINT : GOSUB MakeInsult
    WEND
    COLOR 15: PRINT : PRINT "Thou hast ended the program you"
    FOR J = 0 TO 2: PRINT Insult(RND * 50, J); " "; : NEXT
END
'ษหอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออหป
InsultList:                                                           
'Columm 1                                                             
DATA "artless", "bawdy", "beslubbering", "bootless", "churlish"       
DATA "cockerd", "clouted", " craven", "currish", "dankish"            
DATA "dissembling", "droning", "errant", "fawning", "fobbing"         
DATA "froward", "frothy", "gleeking", "goatish", "gorbellied"         
DATA "impertinent", "infectious", "jarring", "loggerheaded", "lumpish"
DATA "mammering", "mangled", "mewling", "paunchy", "pribbling"        
DATA "puking", "puny", "qualling", "rank", "reeky"                    
DATA "roguish", "ruttish", "saucy", "spleeny", "spongy"               
DATA "surly", "tottering", "unmuzzled", "vain", "venomed"             
DATA "villainous", "warped", "wayward", "weedy", "yeasty"             
                                                                           
'Columm 2                                                             
DATA "base-court", "bat-fowling", "beef-witted", "beetle-headed", "boil-brained"
DATA "clapper-clawed", "clay-brained", "common-kissing", "crook-pated", "dismal-dreaming"
DATA "dizzy-eyed", doghearted", "dread-bolted", "earth-vexing", "elf-skinned"
DATA "fat-kidneyed", "fen-sucked", "flap-mouthed", "fly-bitten", "folly-fallen"
DATA "fool-born", "full-gorged", "guts-griping", "half-faced", "hasty-witted"
DATA "hedge-born", "hell-hated", "idle-headed", "ill-breeding", "ill-nurtured"
DATA "knotty-pated", "milk-livered", "motley-minded", "onion-eyed", "plume-plucked"
DATA "pottle-deep", "pox-marked", "reeling-ripe", "rough-hewn", "rude-growing"
DATA "rump-fed", "shard-borne", "sheep-biting", "spur-galled", "swag-bellied"
DATA "tardy-gaited", "tickle-brained", "toad-spotted", "unchin-snouted", "weather-bitten"
                                                                          
'Columm 3                                                             
DATA "apple-jhon", "baggage", "barnacle", "bladder", "boar-pig"       
DATA "bugbear", "bum-bailey", "canker-blossom", "clack-dish", "clotpole"
DATA "coxcomb", "codpiece", "death-token", "dewberry", "flap-dragon"  
DATA "flax-wench", "flirt-grill",  "foot-licker", "fustilarian", "giglet"
DATA "gudgeon", "haggard", "harpy", "hedge-pig", "horn-beast"         
DATA "hugger-mugger", "joithead", "lewdster", "lout", "maggot-pie"    
DATA "malt-worm", "mammet", "measle", "minnow", "miscreant"           
DATA "moldwarp", "mumble-news", "nut-hook", "pigeon-egg", "pignut"    
DATA "puttock", "pumpion", "ratsbane", "scut", "skainsmate"           
DATA "strumpet", "varlet", "vassal", "whey-face", "wagtail"           
'ศสอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออสผ

