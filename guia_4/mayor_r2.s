# ejercicio 2.(c) mayor en r2  ##no se como hacer para poner varios test en este "programa"
main:
    li a0, 1
    li a1, 1
    li a2, 10
    li a3, 10
    jal ra, mayor_en_r2
    j fin
    #bne a1,a4,noFunciona
    #li a0,5
    #li a1,5
    #li a2,1
    #li a3,1
    #jal ra, mayor_en_r2
    #bne a1,a4, noFunciona
    #li a0,1
    #li a1,1
    #li a2,1
    #li a3,1
    #jal ra, mayor_en_r2
    #bne a1,a4,noFunciona
    #j funciona
#no_funciona:
#    li a6,90
#    j fin
fin:
    j fin    
mayor_en_r2:
    addi sp,sp,-16
    sw ra,0(sp)
    blt a0,a2,segundo_caso
    blt a3,a1, primer_caso
    li a6,0
    j fin_ciclo
primer_caso:
    li a6,1
    lw ra,0(sp)
    addi sp,sp,16
    ret
segundo_caso:
    blt a1,a3,12
    li a6,0
    j fin_ciclo
    li a6,-1
fin_ciclo:
    lw ra,0(sp)
    addi sp,sp,16
    ret