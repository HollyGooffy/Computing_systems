LXI H, 0x002A  ;
MVI B, 1        ;
MVI C, 0        ;
MVI D, 0        ;

SUM_LOOP:
    MOV E, M     ;
    MOV A, B     ;
    ANI 1        ;
    JZ EVEN_POS  ;

ODD_POS:        ;
    MOV A, C    ;
    ADD E       ;
    MOV C, A    ;
    JMP NEXT

EVEN_POS:       ;
    MOV A, D    ;
    ADD E       ;
    MOV D, A    ;

NEXT:
    INX H       ;
    INR B       ;
    MOV A, B
    CPI 11      ;
    JNZ SUM_LOOP ;

END:
    MOV M, D    ;
    INX H
    MOV M, C    ;
    HLT         ;

ORG 0x002A      ;
DB 1, 1, 1, 1, 1, 1, 1, 1, 1, 1




LXI H, 0x002A
MVI B, 1
MVI A, 0
MOV C, A
MOV D, A

SUM_LOOP:
    MOV     A, B
    CPI     11
    JZ      END
    MOV     E, M
    MOV     A, B
    ORA     A
  JPE EVEN

ODD:
  MOV A, C
  ADD E
  MOV C, A
  JMP NEXT

EVEN:
  MOV A, D
  ADD E
  MOV D, A

NEXT:
  INX H
  INR B
  JMP SUM_LOOP

END:
  MOV M, D
  INX H
  MOV M, C
  HLT