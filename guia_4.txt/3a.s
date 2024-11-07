main: 
    li a0, 4          # a0 = 4
    li a1, 87         # a1 = 87
    li a2,-124        # a2 = -124
    li a3,-14         # a3 = -14
    jal ra, FUNCION   # salta a funcion guardando en SP ra
    li a2,-124        # a2 = -124
    bne a0, a2, noFunciona # a0 /= a2  --> salta a noFunciona
funciona:
    li a1, 1    # a1 = 1
    j fin       # salto a fin 
noFunciona: li a1, 0  # a1 = 0
fin: j fin            # salto  fin
FUNCION: addi sp,sp,-12    # guarda lugar en SP para operaciones y salvar valores de a2,a3 y ra
    sw a2,(0)sp            
    sw a3,(4)sp            
    sw ra,(8)sp            
    jal ra,FUNCIONAUX      # salto a funcionaux guardando direccion de ra
    mv s1,a0               # ???????????
    lw a0,(0)sp            # para respetar las reglas, devuelve el valor que tenia a0 y a1
    lw a1,(4)sp 
    jal ra,FUNCIONAUX     # salto a funcionaux, guardadno direccion de ra
    mv a1,s1              # ??????/
    jal ra,FUNCIONAUX     # salto a funcionaux, guardando direccion de ra
    lw ra,(8)sp           # devuelve el valor que tenia ra
    addi sp,sp, 12        # restaura el valor del stack pointer
    ret
    
FUNCIONAUX: 
    addi sp, sp,-4      # guarda dos posiciones en el stack pointer
    sw ra,(0)sp         # guarda el valor de ra en sp
    bgt a1,a0,terminar  #???????????
    mv a0,a1             # ????????
    terminar: ret

