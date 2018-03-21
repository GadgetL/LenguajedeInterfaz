;Resolver la integral
;int_0^2 ((-3x^2)+3x+4)

segment .data
	num1 equ 3	;valor de la 1ra constante
	exp1 equ 2	;valor del 1er exponente
	num2 equ 3	;valor 2da constante
	exp2 equ 1	;valor 2do exponente
	num3 equ 4	;valor 3era constante
	exp3 equ 0	;valor 3er exponente
	msg db 10, "El resultado de la integral es "
	lng equ $-msg

segment .bss
	div1 resb 1	;para el 1er divisor
	div2 resb 1	;para el 2do divisor
	div3 resb 1	;para el 3er divisor
	rest1 resb 1	;para evaluar en 2 el 1er factor
	rest2 resb 2	;para evaluar en 2 el 2do factor
	rest3 resb 1	;para evaluar en 2 el 3er factor
	rdiv2 resb 1	;resultado despues de dividir
	r2 resb 1	;resultado negado
	rfin resb 1

segment .text
	global _start
_start:
	;calcular el valor de los exponentes y dividendos
	mov eax, exp1	;asigna a eax valor del exponente1
	add eax, '0'	;se le suma 0 para tener el valor en ASCII
	add eax, 1	;se le suma 1, simulando n+1 para resolver la integral
	mov [div1], eax	;el valor n+1 sera el mismo para el divisor y el exponente 
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, div1	;imprimir valor del divisor
	mov edx,1	;longitud de div1
	int 0x80	;llamada al sistema de interrupciones

	mov eax, exp2	;asigna a eax valor del exponente2
	add eax, '0'	;se le suma 0 para tener el valor en ASCII
	add eax, 1	;se le suma 1, simulando n+1 para resolver la integral
	mov [div2], eax	;el valor n+1 sera el mismo para el divisor y el exponente 
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, div2	;imprimir valor del divisor
	mov edx,1	;longitud de div1
	int 0x80	;llamada al sistema de interrupciones

	mov eax, exp3	;asigna a eax valor del exponente3
	add eax, '0'	;se le suma 0 para tener el valor en ASCII
	add eax, 1	;se le suma 1, simulando n+1 para resolver la integral
	mov [div3], eax	;el valor n+1 sera el mismo para el divisor y el exponente 
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, div3	;imprimir valor del divisor
	mov edx,1	;longitud de div1
	int 0x80	;llamada al sistema de interrupciones

	;calcular el valor de las variables tomando en cuenta el nuevo valor de los
	;exponentes. Obviando que el resultado de la integral con limite 0, es 0
	;saltaré esa operacion. Solo se evaluará el resultado con x=2
	;se multiplican los valores obtenidos de x^n por el valor de la constante	
	
	mov eax, 2	;asigna a eax valor del X=2
	mov ebx, 2	;se multiplica
	mul ebx		;dos veces porque exp=3
	mul ebx
	add eax, '0'	;se le suma 0 para tener el valor en ASCII
	mov [rest1], eax	;se asigna el resultado a rest1
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, rest1	;imprimir valor del resultado1
	mov edx,1	;longitud
	int 0x80	;llamada al sistema de interrupciones	

	mov eax, 2	;asigna a eax valor del X=2
	mov ebx, 2	;se multiplica
	mul ebx		;1 vez porque exp=2
	mov ebx, 3	;se multiplica por la constante 3
	mul ebx
	add eax, '0'	;se le suma 0 para tener el valor en ASCII
	mov [rest2], eax	;se asigna el resultado a rest2
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, rest2	;imprimir valor del resultado1
	mov edx,1	;longitud
	int 0x80	;llamada al sistema de interrupciones	

	mov eax, 2	;asigna a eax valor del X=2, no se multiplica porque exp=1
	mov ebx, 4	;se multiplica por la constante 4
	mul ebx
	add eax, '0'	;se le suma 0 para tener el valor en ASCII
	mov [rest3], eax;se asigna el resultado a rest1
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, rest3	;imprimir valor del resultado1
	mov edx,1	;longitud
	int 0x80	;llamada al sistema de interrupciones

	;y se divide entre el div respectivo	

	mov eax, 12	;asigna a eax valor del rest2
	mov ebx, 2	;se asigna divisor
	mov edx, 0
	div ebx
	add eax, 48	;se le suma 0 para tener el valor en ASCII
	mov [rdiv2],eax ;se asigna el resultado 
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, rdiv2	;imprimir valor 
	mov edx,1	;longitud
	int 0x80	;llamada al sistema de interrupciones

	mov eax, [rdiv2]
	sub eax, 48
	mov ebx, [rest3]
	sub eax, 48	
	add eax, ebx
	add eax, '0'
	mov [r2],eax ;se asigna el resultado
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, r2	;imprimir valor 
	mov edx,1	;longitud
	int 0x80	;llamada al sistema de interrupcione


	mov eax, 4   
	mov ebx, 1	 ;stdout
	mov ecx, msg ;msg pantalla
	mov edx, lng ;longitud del mensaje
	int 0x80	;lamada al sistema de interrucciones


	mov eax, [r2]	
	sub eax, '0'
	mov ebx, [rest1]
	sub ebx, '0'
	sub eax,ebx
	add eax, '0'
	mov [rfin],eax ;se asigna el resultado a vlim
	mov eax, 4	;llamada al sistema write
	mov ebx, 1	;stdout
	mov ecx, rfin	;imprimir valor 
	mov edx,1	;longitud
	int 0x80	;llamada al sistema de interrupciones
	
 
	mov eax,1	
	int 0x80	
