# ejercicio 5(b)
#PotenciasEnArreglo:Dado un puntero a un arreglo de enteros sin signo de 8 bits y la cantidad de elementos,
#devuelve cuantos de ellos son potencias de 2. 
#ayuda:Pensar como una potencia de dos se ve en base binaria.   #no use eso 

.data
largo1: .byte 0x4
arreglo1: .byte 2,4,8,17
largo2: .byte 0x4
arreglo2: .byte 3,5,8,0
.text
main:
    lb a1,largo1
    la a0, arreglo1
    jal ra, ctos_son_potencia
    li a3,3
    bne a3,a0, no_funciona
    
    lb a1,largo2
    la a0, arreglo2
    jal ra, ctos_son_potencia
    li a3,1
    bne a3,a0, no_funciona
    
fin:
    li a0,999
    j fin
no_funciona:
    li a0,-10993
    j no_funciona

ctos_son_potencia:
    addi sp,sp,-4
    sw ra, 0(sp)
    mv t0, a1    # en t0 voy a tener el largo del array
    mv t1, a0       # en t1 voy a tener la direccion del primer dato del arreglo 
    mv t2,zero      # voy a usar t2 como contador
    
    recorro_array:
        beq t0,zero,fin_funcion_1    # un "while" restando long del array
        lb a0,0(t1)                  # cargo el dato en el que estoy y salto
        
        addi sp,sp,-12
        sw t0, 0(sp)
        sw t1,4(sp)
        sw t2,8(sp)
        
        jal ra,es_potencia
        
        lw t0,0(sp)
        lw t1,4(sp)
        lw t2,8(sp)
        addi sp,sp,12
        
        add t2,t2,a0
        addi t1,t1,1
        addi t0,t0,-1
        j recorro_array
    fin_funcion_1:
        mv a0,t2
        lw ra,0(sp)
        addi sp,sp,4
        ret
        
es_potencia:
    addi sp,sp,-4
    sw ra,0(sp)
    mv t0,a0
    li a0,2
    li a1,2
    beq a0,t0,fin_funcion
    bgt a0,t0,fin_funcion_no_da
    ciclo:
        jal ra, multiplicacion
        slli a1,a1,1
        blt a0,t0,ciclo
        beq a0,t0,fin_funcion
        bgt a0,t0,fin_funcion_no_da
    multiplicacion:                       # tengo 3 casos en multiplicacion, mult positiva, negativa y por cero, los separo
        addi sp,sp,-4
        sw ra,0(sp)
        add a3,zero,a0
        li a4, 1                         # a4 lo voy a usar para "controlar" los ciclos
        mult_positiva:
            bne a1,a4,ciclo_positivo    # hasta que a1 no sea = 1, sigo
            j fin_multiplicacion
            ciclo_positivo:
                add a0,a0,a3               
                addi a1,a1,-1        
                j mult_positiva
            fin_multiplicacion:
                lw ra,0(sp)
                addi sp,sp,4
                ret
    fin_funcion:
        li a0,1
        lw ra,0(sp)
        addi sp,sp,4
        ret
    fin_funcion_no_da:
        li a0,0
        lw ra,0(sp)
        addi sp,sp,4
        ret
        
        
        
        
        
        