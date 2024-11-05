# ejercicio 2.(d) division: div(x,y) = x/y (x,y e Z) ##creo q funca
main:
########caso 1
# asigno prueba
    li a0, 5
    li a1,-5
#                    #     guardo a0
 #                         addi sp, sp, -4 # reservo espacio en pila
 #                         sw a0, 0(sp) # guardar a0 en pila
# salto a la funcion guardando direccion de retorno
    jal ra, division
#                         restauro a0    
#                         lw a0, 0(sp) # cargo a1 desde pila y restauro direccion de el stack pointer
#                         addi sp, sp, 4
# chequeo si no funciona, sino, sigo    
    li a5,-1
    blt a4,a5,noFunciona

########caso 2
    li a0,6
    li a1,-5
    
    jal ra, division

    li a5,-1       #siendo a5 la rta esperada
    blt a4,a5,noFunciona
########caso 3
    li a0,1
    li a1,14
    
    jal ra, division
    li a5,0
    blt a5,a4,noFunciona
########caso 4
    li a0,1
    li a1,-1
    
    jal ra, division
    
    li a5,-1
    blt a5,a4,noFunciona

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
    blt a0,zero,invertir
    blt a1,zero,invertir
    #j ciclo_positivo
    blt a0,a1,fin_ciclo     # si numerador es menor a denominador salgo
    if_positivo:
        bge a0,a1,ciclo_positivo        # si a0 >=a1 sigo en el ciclo
        li t2,1
        beq t0,t2,invertir_rta
        beq t1,t2,invertir_rta
        j fin_ciclo
    ciclo_positivo:
        sub a0,a0,a1          # la idea es a0-a1, cuenta como "1 vez dividiendo" y sumo en a4 1 que es el contador
        addi a4,a4,1
        j if_positivo
    mult_cero:
        li a0,0
        j fin_ciclo
    invertir:
        blt a0,zero,inv_a0
        blt a1,zero,inv_a1
        inv_a0:
            not a0,a0
            addi a0,a0,1
            li t0,1
            j ciclo_positivo
        inv_a1:
            not a1,a1
            addi a1,a1,1
            li t1,1
            j ciclo_positivo
        invertir_rta:
            not a4,a4
            addi a4,a4,1
            ret
    fin_ciclo:
        lw ra,0(sp)
        addi sp,sp,16
        ret 
        
        
        
        
        
        
        
        
        
        
        
        
        
     
     
     
     
     
     
     
     
     
     
     
     
        