# ejercicio 2.(b) division: div(x,y) = x/y (x,y e Z) ##creo q funca
main:
########caso 1
# asigno prueba
    li a0, 6
    li a1,2
# guardo a0
    addi sp, sp, -4 # reservo espacio en pila
    sw a0, 0(sp) # guardar a0 en pila
# salto a la funcion guardando direccion de retorno
    jal ra, division
# restauro a0    
    lw a0, 0(sp) # cargo a1 desde pila y restauro direccion de el stack pointer
    addi sp, sp, 4
# chequeo si no funciona, sino, sigo    
    blt a0,a4,noFunciona
########caso 2
    li a0,5
    li a1,5
    
    addi sp, sp, -4 # reservo espacio en pila
    sw a0, 0(sp) # guardar a0 en pila
    
    jal ra, division
    
    lw a0, 0(sp) # cargo a1 desde pila y restauro direccion de el stack pointer
    addi sp, sp, 4
########caso 3
    li a0,1
    li a1,14
    
    addi sp, sp, -4 # reservo espacio en pila
    sw a0, 0(sp) # guardar a0 en pila
    
    jal ra, division
    
    lw a0, 0(sp) # cargo a1 desde pila y restauro direccion de el stack pointer
    addi sp, sp, 4
    
    blt a0,a4,noFunciona
    j funciona
noFunciona:
    li a3,-1
    j fin
funciona:
    li a3,1
    j fin
fin:
    j fin    
########### funcion llamada
division:
    addi sp,sp,-16 
    sw ra,0(sp)
    li a4, 0                #a4 funcionaria como contador
    beq a1,zero, mult_cero  # dividir por 0 lo tomo como un caso especial
    blt a0,a1,fin_ciclo     # si numerador es menor a denominador salgo
vuelvo:
    bge a0,a1,ciclo        # si a0 >=a1 sigo en el ciclo
    j fin_ciclo
ciclo:
    sub a0,a0,a1          # la idea es a0-a1, cuenta como "1 vez dividiendo" y sumo en a4 1 que es el contador
    addi a4,a4,1
    j vuelvo
mult_cero:
    li a0,0
    j fin_ciclo
fin_ciclo:
    lw ra,0(sp)
    addi sp,sp,16
    ret 
