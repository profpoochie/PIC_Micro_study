;
; Created:   Thu Jan 27 2022
; Processor: PIC10F200
; Compiler:  MPASM (Proteus)
;====================================================================

;====================================================================
; DEFINITIONS
;====================================================================

#include p10f200.inc                ; Include register definition file

; Config
   __CONFIG _MCLRE_ON & _CP_OFF & _WDT_ON & _IntRC_OSC
   org 0x0
; Youtube header code in CircuitBread not compatible in Proteus

INIT
   MOVLW ~(1<<T0CS)
   OPTION
   MOVLW ~(1 << GP2)
   TRIS GPIO
   
LOOP 
   BSF GPIO, GP2 
   CALL DELAY 
   BCF GPIO, GP2 
   CALL DELAY 
   GOTO LOOP 
   
DELAY 
   MOVLW D'162' 
   MOVWF 10 
   MOVWF 11 
   
DELAY_LOOP
   DECFSZ 10, 
   GOTO DELAY_LOOP 
   DECFSZ 11, F 
   GOTO DELAY_LOOP 
   RETLW 0 
   
   END 
   
   
