set clock off
set talk off
set safety off
set readborder on
set echo off
define wind ventana1 from 2,2 to 23,78 shad title'Facturaci¢n' color g+/gr
activate wind ventana1
move wind ventana1 to 1,2
sw='s' 
do while sw='s' or sw='S'
clear
@1,2 say'Codigo:'
@2,2 say'Nombre:'
@1,40 say 'Rif:'
@2,40 say 'Nit:'
@3,2 say'Direcci¢n:'
@4,2 say'Telefono:'
define wind ventana2 from 2,2 to 5,75 shad color w+/r 
activate wind ventana2
move wind ventana2 center
clear
resp=space(1)
@1,3 say'Conoce Usted el Codigo del Cliente?:' get resp
read
if resp='n' or resp='N'
	use cliente
	brow
	deac wind ventana2
	activate wind ventana1
	move wind ventana1 to 1,2
	nom=space(30)
	ri=space(15)
	ni=space(15)
	direci=space(30)
	cod=0
	te=0
	stor codigo to cod 
	stor nombre to nom
	stor rif to ri
	stor nit to ni
	stor direccion to direci
	stor telefono to te
	@1,14 get cod function'b' color w+/r , w+/gr
	@2,14  get nom function'b'color w+/r , w+/gr
	@1,45 get ri function'b'color w+/r , w+/gr
	@2,45 get ni function'b'color w+/r , w+/gr
	@3,14 get direci function'b'color w+/r , w+/gr
	@4,14 get te function'b'color w+/r , w+/gr
	clear gets
	wait window'Ingrese Productos'
else
	use cliente
	index on codigo to cliente
	reindex
	cod=0
	deac wind ventana2
	activate wind ventana1
	move wind ventana1 to 1,2
	@1,14 get cod function 'b' color w+/r , w+/gr
	read
	seek cod
	if found()
		nom=space(30)
		ri=space(15)
		ni=space(15)
		direci=space(30)
		te=0
		stor nombre to nom
		stor rif to ri
		stor nit to ni
		stor direccion to direci
		stor telefono to te
		@2,14  get nom function'b'color w+/r , w+/gr
		@1,45 get ri function'b'color w+/r , w+/gr
		@2,45 get ni function'b'color w+/r , w+/gr
		@3,14 get direci function'b'color w+/r , w+/gr
		@4,14 get te function'b'color w+/r , w+/gr
		clear gets
	else
		wait wind'Cliente Inexistente, Precione una Tecla...' 
		wait wind'Pasando a busqueda Simplificada...' timeout(3)
		activate wind ventana2
		move wind ventana1 to 1,2
		brow
		deac wind ventana2
		activate wind ventana1
		move wind ventana1 to 1,2
		nom=space(30)
		ri=space(15)
		ni=space(15)
		direci=space(30)
		cod=0
		te=0
		stor codigo to cod 
		stor nombre to nom
		stor rif to ri
		stor nit to ni
		stor direccion to direci
		stor telefono to te
		@1,14 get cod function'b'color w+/r , w+/gr
		@2,14  get nom function'b'color w+/r , w+/gr
		@1,45 get ri function'b'color w+/r , w+/gr
		@2,45 get ni function'b'color w+/r , w+/gr
		@3,14 get direci function'b'color w+/r , w+/gr
		@4,14 get te function'b'color w+/r , w+/gr
		clear gets
	endif
endif
@5,1 say'-------------------------------------------------------------------------'
@7,1 say'-------------------------------------------------------------------------'
@6,1 say'Codigo'
@6,12 say'Descrip'
@6,31 say'Cant'
@6,37 say'Precio U.'
@6,48 say'Imp'
@6,55 say'PVP'
@6,65 say'Total'
a=8
sumpreu=0
sumprev=0
impues=0
sw='s'
do while sw='s'
use bas_rep
index on codigo to bas_rep
reindex
codi=0
@a,1 get codi function 'b' color w+/r , w+/gr
read
if lastkey()=27
	cancel
endif
if lastkey()=6
	exit
endif
seek codi
if found()
	desc=space(18)
	can=0
	preu=0
	Imp=0
	prev=0
	stor descripcio to desc
	stor precio_u to preu 
	stor impuesto to imp
	stor precio_v to prev
	@a,12 get desc color w+/r , w+/gr
	clear gets
	@a,31 get can function'b' color w+/r , w+/gr
	read
	clear gets
	@a,37 get preu  color w+/r , w+/gr
	@a,48 get imp  function'b'color w+/r , w+/gr
	@a,55 get prev function'b'color w+/r , w+/gr
	total=0
	total=prev*can
	@a,65 get total function 'b' color w+/r , w+/gr
	clear gets
else
	wait wind'Producto no encontrado...'
	wait wind'Pasando a busqueda Simplificada...' timeout(1)
	use bas_rep
	index on descripcio to bas_rep
	reindex
	brow noedit
	desc=space(18)
	can=0
	preu=0
	Imp=0
	prev=0
	stor codigo to codi 
	stor descripcio to desc
	stor precio_u to preu 
	stor impuesto to imp
	stor precio_v to prev
	@a,1 get codi function 'b'color w+/r , w+/gr
	@a,12 get desc color w+/r , w+/gr
	clear gets
	@a,31 get can function'b' color w+/r , w+/gr
	read
	clear gets
	@a,37 get preu  color w+/r , w+/gr
	@a,48 get imp  function'b'color w+/r , w+/gr
	@a,55 get prev function'b'color w+/r , w+/gr
	total=0
	total=prev*can
	@a,65 get total function 'b'color w+/r , w+/gr
	clear gets
endif
sumpreu=sumpreu+(preu*can)
sumprev=sumprev+(prev*can)
impues=sumprev-sumpreu
if a=19 
	exit
endif
a=a+1
enddo
define wind ventana3 from 21,40 to 30,78 title'Total' shad color w+/r
activate wind ventana3
@1,1 say'Total Precio Unitario:' get sumpreu
@3,1 say'Total Impuesto:'get impues
@5,1 say'Total Precio Venta:' get sumprev
clear gets
activate wind ventana2
move wind ventana2 to 32,2
@1,3 say'Desea realizar otra venta?:' get sw
read
deac wind ventana3
deac wind ventana2
activate wind ventana1
enddo
deac wind all
close data
set clock on



	