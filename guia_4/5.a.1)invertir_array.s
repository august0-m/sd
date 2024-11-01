# ejercicio 5(a) InvertirArreglo:Dado un puntero a un arreglo de enteros de 32 bits y la cantidad de elementos,cambia 
# cada valor del arreglo por su inverso aditivo.
.data
largo: .word 0x4
arreglo: .word 14,10,-5,0
arreglo_esperado: .word -14,-10,5,0 
.text
main:
    la a0,largo
    la a1, arreglo
    la a2 arreglo_esperado
    jal ra, invertir
    add a3,a2,a1
    bne a3,zero, no_funciona
    
    li a1,4
    jal ra, invertir
    add a3,a2,a1
    bne a3,zero, no_funciona
    
    li a1,-9
    jal ra, invertir
    add a3,a2,a1
    bne a3,zero, no_funciona
    
    li a1,0
    jal ra, invertir
    add a3,a2,a1
    bne a3,zero, no_funciona
    
    li a0,1
    j fin
no_funciona:
    li a0,-1
    j fin
fin:
    j fin
invertir:
    addi,sp,sp,-4
    sw ra,0(sp)
    not a2,a1
    addi a2,a2,1
    lw ra,0(sp)
    ret
    ciclo:
        lalalala
        cada coso para invertir
        cuando termino con longitud retorno