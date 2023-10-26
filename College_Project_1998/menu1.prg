set talk off
set color to w+/b+
clear
set date to dmy
cla=space(20)
opci=0
cli=space(20)
nomb=space(10)
usu=space(10)
a=0
i=0
b=24
for i =1 to 13
	wait wind'Espere un Momento por Favor' timeout (0.01)
	@a,0,b,80 box '°'
	b=b-1
	a=a+1
endfor
define wind ventana0 from 2,2 to 23,75 shad color g+/gr+
activate wind ventana0
move window ventana0 to 1,2
@1,17 say' Sistema Automatizado para el control'
@2,14 say' Interno de la empresa de Compra Venta de'
@3,25 say' Mercancia FIAT REFH'
@4,05 say' Av. Principal de San JosŠ nø207 al Frente de Electroauto Olimer'
@5,26 say' Rif: j-30295396-0'
@15,15 say'1._ Cargar el Programa Principal'color w+/gr , g+/n
@16,15 say'2._ Salir del Sistema Administrativo'color w+/gr , g+/n
@18,16 say'Introduzca la Opci¢n:'color w+/gr , g+/n 
@18,38 get opci color g+/gr , g+/n  valid (opci=1) or (opci=2) function 'k' 
read
if opci=1
@15,01 clear to 18,75
set color to g+/n
@15,11,17,61 box
@16,12 say 'Cargando 5%  Û'
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 10% ÛÛÛ'
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 20% ÛÛÛÛÛÛ' 
wait window 'Cargando el programa Principal'timeout (0.01)
@16,12 say 'Cargando 25% ÛÛÛÛÛÛÛ'
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 30% ÛÛÛÛÛÛÛÛÛ'
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 40% ÛÛÛÛÛÛÛÛÛÛÛÛ' 
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 55% ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ'
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 60% ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ'
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 75% ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ'
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 80% ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ' 
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 90% ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ'
wait window 'Cargando el programa Principal' timeout (0.01)
@16,12 say 'Cargando 100%ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ'
wait window 'Cargando el programa Principal' timeout (0.01)
set color to g+/gr
@18,50 say 'Completado'
deac wind all
define wind ventana1 from 2,2 to 20,75 shad title 'Seguridad del Programa' color g+/gr+ 
activate wind ventana1
@ 10,10 say ' Clave Secreta:' get cla color w+/gr , n/n 
read
use seguri
index on clave to seguri
reindex
seek cla
brow
stor clave to cli
stor nombre to nomb
if cla=cli 
	set clock to 17,61
	do while .t.
		fecha=date()
		op=0
		define wind ventana1 from 2,2 to 23,75 shad title 'Menu Principal' color g+/gr+ 
		activate wind ventana1
		@ 19,8 say 'Muevase con las Flechas  ¢  para seleccionar su opci¢n' color w*/gr 
		@ 1,6 say 'SISTEMA AUTOMATIZADO PARA EL CONTROL DE LA EMPRESA FIAT REFH' color w+/gr , r/b
		@ 16,45 say 'Fecha Actual:' color w+/gr , g+/n
		@ 16,61 get fecha color g+/gr , g+/n
		@ 12,45 say 'Usuario:' color w+/gr , g+/n
		@ 12,58 get nomb color w+/gr , g+/n
		@ 14,45 say 'Hora Actual:'color w+/gr , g+/n
		clear gets
		@ 2,6,16,34 box
		@ 3,7 prompt '\<1. Incluir' color g+/gr , g+/n  
		@ 5,7 prompt '\<2. Modificar'color g+/gr , g+/n
		@ 7,7 prompt '\<3. Eliminar'color g+/gr , g+/n
		@ 9,7 prompt '\<4. Consulta'color g+/gr , g+/n
		@ 11,7 prompt '\<5. Reportes'color g+/gr , g+/n
		@ 13,7 prompt '\<6. Seguridad'color g+/gr , g+/n  
		@ 15,7 prompt '\<7. Ventas'color g+/gr , g+/n
		@ 3,23 prompt '\<8. Respaldo'color g+/gr , g+/n
		@ 5,23 prompt '\<9. Salir'color g+/gr , g+/n
	
			menu to op
				do case
					Case op=1 
						do menu_inc
					Case op=2
						do menu_mod
					Case op=3
						do menu_eli
					Case op=4
						do menu_cons
					Case op=5 
						do menu_rep
					Case op=6 
						do menu_seg
					Case op=7
						do menu-ven
					Case op=8
						do respaldo
					case op=9
						exit
	
			endcase
		enddo
		deac wind all
		clear
		set clock off
		clear
		cancel
	else
		wait window 'Clave incorrecta' timeout (1)
		deac wind all
		set clock off
		clear
		cancel
	endif
else
	deac wind all
	clear
	cancel
endif
