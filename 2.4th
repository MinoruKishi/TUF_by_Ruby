

: MAIN

VAR( D_STR_ADR L_LNGS I_ADR R_BYTE P_ADR L_ADR X N R_STR )

VAR( A_INDX_BTM A_AREA_BTM A_COUNT I J )
VAR( A_SIZE A_INDX_SIZE )
  2000 2 - >> A_SIZE
  100 >> A_INDX_SIZE
ARRAY( BYTE: A 2000  INT: A_INDX 100 )

  "host/media/dsk" >> D_STR_ADR
  D_STR_ADR >> I_ADR
  $E0 8 P!
  $01 8 P!
  $53 8 P!
  $C0 8 P! 
  D_STR_ADR STRLEN >> L_LNGS 
  L_LNGS 8 P!
  I_ADR L_LNGS + >> L_ADR
  WHILE( I_ADR L_ADR <= ){ I_ADR C@ 8 P!  I_ADR 1 + >> I_ADR }
  $00 8 P!
  8 P@ >> R_BYTE
  $E0 8 P!
  $01 8 P!
  $11 8 P!
  $80 8 P!
  8 P@ >> R_BYTE
  & R_BYTE >> P_ADR			/* RÌAhXi2oCgjðPÉÛ¶µÜ· */
  8 P@ P_ADR C!
  8 P@ P_ADR 1 + C!
  R_BYTE H. " " .

  P_ADR @ H. CRLF
  P_ADR H. " " . CRLF
  D_STR_ADR DUP . " " . STR. CRLF
  L_LNGS H. " " . I_ADR H. " " . L_ADR H. CRLF
  "---------------------" STR. CRLF

  R_BYTE 20 > IF{ 20 >> R_BYTE }
  "host/media/dsk" >> D_STR_ADR
  0 >> X
  R_BYTE >> N
  $E0 8 P!
  $01 8 P!
  $53 8 P!
  $C0 8 P! 
  D_STR_ADR STRLEN >> L_LNGS 
CRLF "L_LNGS " STR. L_LNGS . CRLF
/* $14 */

  L_LNGS 8 P!
  I_ADR L_LNGS + >> L_ADR
  WHILE( I_ADR L_ADR <= ){ I_ADR C@ 8 P!  I_ADR 1 + >> I_ADR }
  $00 8 P!
  8 P@ >> R_BYTE
  
  $E0 8 P!
  $01 8 P!
  $13 8 P!
  $80 8 P!
  8 P@ >> L_LNGS
CRLF "L_LNGS " STR. L_LNGS . CRLF
/* $00 ?? */

  "" >> R_STR
  0 >> I
  0 >> J
	0 >> POINTER
	
  WHILE( J N <= ){
	  POINTER >> A_INDEX [ J ]
	  WHILE( I L_LNGS < ){
		  POINTER A_SIZE _>= IF{ "A work area is empty!" STR. }{
        8 P@ >> A [ POINTER ]	
        POINTER 1 + >> POINTER
      }
      I 1 + >> I
    }
    $00 >> A [ POINTER ]
	  POINTER 1 + >> POINTER
    J 1 + >> J
    
	
	
	
  & A >> A_INDX_BTM
  A_INDX_BTM A_SIZE + >> A_AREA_BTM
    
"N " STR. N . CRLF
"A_INDX_BTM " STR. A_INDX_BTM . CRLF
"A_AREA_BTM " STR. A_AREA_BTM . CRLF
    
  WHILE( J N <= ){
"A_INDX_BTM " STR. A_INDX_BTM . CRLF
    A_INDX_BTM >> A_INDX [ J ]
" QQQ " STR.
    J >> A_COUNT
" RRR " STR.
CRLF "L_LNGS " STR. L_LNGS . CRLF
/* $00 */
    WHILE( I L_LNGS < ){ 
" SSS " STR.
      A_INDX_BTM A_AREA_BTM 2 - _<= IF{ "A work area is empty!" STR. }{
A_INDX_BTM H. " - " STR. & A H. CRLF
        8 P@ >> A [ A_INDX_BTM & A - ]

        A_INDX_BTM 1 + >> A_INDX_BTM
      }
      I 1 + >> I
    }
    $00 >> A [ A_INDX_BTM ]
    A_INDX_BTM 1 + >> A_INDX_BTM
    J 1 + >> J
    0 >> I
  }
/* 250 FORI=0TON:PRINT N$(I):NEXTI */
  WHILE( I A_COUNT <= ){ & A_INDX I + STR. CRLF }

/*  [vÏðA[n]ÌnÅ¦µÄ¢éBA_INDX_BTMÆ©AhXlÅ¢ÄµÜÁ½ªA±±ÍnÌæ¤ÈCfbNXlÅLqµ½Ù¤ª³ÌBASICÆàðÅ«éµA¬ª­È¢Æv¤B
 ÆA240 L=INP(8):ÅÌÊÌLÌlª0¾Á½ÌÍÈº¾ë¤©HBASICÅÍ±ÌÌLÌlÍ¢­ÂÈÌ©²×Ä¨­±Æ */

;

MAIN

