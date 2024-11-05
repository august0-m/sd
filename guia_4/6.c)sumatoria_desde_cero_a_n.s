#Recursion
#Ejercicio 6 
#Los siguientes programas fueron escritos por 2 programadores sin comunicarse.
#Programador A escribio las funciones recursivas etiquetadas como FUNCION, mientras que Programador B escribio sus casos de test.
#Las funciones debisn utilizar la convencion de llamada estandar, ya que luego se agregarian al resto del codigo de la empresa donde ambos trabajan. 
#Aunque A dice haber cumplido con esto, al evaluar, todos los test fallan. 
# Para cada programa: 

#Comentar los casos de test y explicar que se esta evaluando.

#Comentar el codigo de la funcion, explicar su funcionamiento y darle un nombre descriptivo

#Marcar el prologo y epilogo de la funcion. 

#Indicar el Caso Base y la definicion recursiva de la funcion. 

#Encontrar los errores causados por no seguir la convencion o hacer mal uso del stack. Justificar. 

#Arreglar la funcion y comprobar el funcionamiento en el emulador Ripes

#Para un caso de test, realizar un grafico del flujo que realiza el programa.                # q es un grafico de flujo???????????????

# Ejercicio C
main: 
    li a0,4 
    jal sumatoria_desde_cero_a_n 
    li a1,10         # 0 + 1 + 2 + 3 + 4 = 10
    bne a0,a1,noFunciona 
funciona: 
    li a1,1 
    j fin  
noFunciona: 
    li a1,0 
fin: 
    j fin 
#FUNCION: 
#    beq a0,zero,casoBase             #arranca mal, primero tengo que guardar los valores
#    addi sp,sp,-8 
#    sw a0,(0)sp 
#    sw ra,(4)sp 
#    addi a0,a0,-1 
#    jal FUNCION 
#    lw a1,(0)sp                 #cuando sumaba tambien era incorrecto porque cargaba de la pila a a0 que no lo habia guardado
#    add a0,a1, a0 
#    j prologo 
#    casoBase: 
#        li a0,0 
#    prologo: 
#        lw ra,(4)sp 
#        addi sp,sp,8 
#       ret
sumatoria_desde_cero_a_n:
    addi sp,sp,-8 
    sw a0,(0)sp 
    sw ra,(4)sp  
    beq a0,zero,casoBase             # caso base, si a0=0, entonces la sumatoria desde 0 hasta cero = 0
    
    addi a0,a0,-1                    # voy restando 1 para llegar al caso base 
    jal sumatoria_desde_cero_a_n     # salto a la misma funcion para aplicar recursion
    mv a1,a0                         # en a1, voy a guardar temporalemnte el resultado de mi recursion
    lw a0,(0)sp                      # cargo el "a0" anterior
    add a0,a1, a0                    # sumo resultado de recursion con a0 "anterior" 
    j prologo 
    casoBase: 
        li a0,0 
    prologo: 
        lw ra,(4)sp                 # no cargo a0 para no sobreescribir la recursion
        addi sp,sp,8 
        ret