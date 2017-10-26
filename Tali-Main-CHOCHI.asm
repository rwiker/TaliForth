; -----------------------------------------------------------------------------
; MAIN FILE 
; Tali Forth for the l-star and replica 1
; Scot W. Stevenson <mheermance@gmail.com>
;
; First version  9. Dec 2016
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Used with the Ophis assembler and the py65mon simulator
; -----------------------------------------------------------------------------
; This image is designed loaded in high ram via the Woz mon and started with
; 5A00R
.org $C100-4
.word $C100
.word end_of_code-$C100	

.outfile "tali-chochi.bin"

.org $C100
	lda #<k_nmiv
	sta $FFFA
	lda #>k_nmiv
	sta $FFFB
	lda #<k_resetv
	sta $FFFC
	lda #>k_resetv
	sta $FFFD
	lda #<k_irqv
	sta $FFFE
	lda #>k_irqv
	sta $FFFF
	
	jmp k_resetv

.alias RamSize          $8000

; =============================================================================
; FORTH CODE 
FORTH: 
.require "Tali-Forth.asm"

; =============================================================================
; KERNEL 
.require "Tali-Kernel-CHOCHI.asm"

; =============================================================================
; LOAD ASSEMBLER MACROS
.require "macros.asm"

end_of_code:

; =============================================================================
; END
