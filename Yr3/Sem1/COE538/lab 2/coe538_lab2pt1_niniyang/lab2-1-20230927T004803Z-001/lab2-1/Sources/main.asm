********************************************************************
* Demonstration Program *
* *
* This program illustrates how to use the assembler. *
* It adds together two 8 bit numbers and leaves the result *
* in the ‘SUM’ location. *
* Author: Peter Hiscocks *
********************************************************************
; export symbols

          XDEF Entry, _Startup ; export ‘Entry’ symbol
          ABSENTRY Entry ; for absolute assembly: mark this as applicat. entry point
                      

; Include derivative-specific definitions
          INCLUDE 'derivative.inc'

********************************************************************
* Code section *
********************************************************************

      ORG $3000

********************************************************************
* The actual program starts here *
********************************************************************

          ORG $4000

Entry:
_Startup:
  LDAA #$FF ; ACCA = $FF
  STAA DDRH ; Config. Port H for output
  STAA PERT ; Enab. pull-up res. of Port T

   LDAA PTT ; Read Port T

  STAA PTH ; Display SW1 on LED1 connected to Port H
  BRA Loop ; Loop 

********************************************************************
* Interrupt Vectors *
********************************************************************