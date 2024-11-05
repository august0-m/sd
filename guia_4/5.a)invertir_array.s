# ejercicio 5(b) InvertirArreglo:Dado un puntero a un arreglo de enteros de 32 bits y la cantidad de elementos,cambia 
# cada valor del arreglo por su inverso aditivo.
.data
largo: .word 0x4
arreglo: .word 14,10,-5,0
#arreglo_esperado: .word -14,-10,5,0 
.text
main:
    la a0,largo
    la a1, arreglo
    #la a2 arreglo_esperado
    jal ra, invertir_arreglo
    li a0,1
    j fin
no_funciona:
    li a0,-1
    j fin
fin:
    j fin
invertir_arreglo:        # obs: a1 es la direccion al principio del array, tengo un iterador, al que arranca en cero y lo voy aumentand en 4 bytes
    addi,sp,sp,-4
    sw ra,0(sp)            
    lw t0,0(a0)             #largo en t0
    mv t1,a1
    ciclo:
        beq t0,zero,fin_ciclo
        lw t2, 0(t1)
        not t2,t2
        addi t2,t2,1
        sw t2,0(t1)
        addi t1,t1,4
        addi t0,t0,-1
        j ciclo
    fin_ciclo:
        lw ra,0(sp)
        addi sp,sp,-4
        ret 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        