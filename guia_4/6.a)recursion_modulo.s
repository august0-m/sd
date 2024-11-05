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

# Ejercicio A
# en los test vemos que al finalizar si a0=0 no funciona el programa, si a0=1 entonces funciona
main: 
    li a0, 13 
    li a1, 5 
    jal a_modulo_b 
    li a1, 3  # 13 mod(5) = 3 
    bne a0, a1, noFunciona 
funciona:
    li a1, 1 
    j fin  
noFunciona: 
    li a1, 0 
fin: 
    j fin 
#la funcion fallaba en que no comparaba el registro en el que estaba haciendo la recursion y no manejaba la direccion de retorno
#FUNCION: 
#    blt a0, a1, terminar 
#    sub a2, a0, a1                                 # codigo original
#    jal FUNCION  
#terminar:
#     ret

#codigo corregido 
a_modulo_b: 
#epilogo
    addi sp,sp,4
    sw ra,0(sp)
#epilogo
    blt a0, a1, terminar # caso base, cuando el numero ya de por si es menor al modulo, sino voy recursivamente restando a ese numero el modulo 
    sub a0, a0, a1 
    j a_modulo_b  
terminar:
#prologo
     sw ra,0(sp)
     addi sp,sp,4
     ret
#prologo
        
        
        
        
        
        
        
        
        
        
        
        