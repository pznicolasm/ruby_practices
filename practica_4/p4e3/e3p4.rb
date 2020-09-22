# 3.- ​Crear un archivo de CSV que tenga el siguiente contenido:
# '001','Caja de sorpresas',52.50
# '002','Viaje de ida al infinito y mas allá',120
# '003','Historias de chillar',75'
# '004','Pegamento de personas',80
# 3.A ​ Crear una clase ProductsList que lo parsee y almacene la información en una colección
# de productos.
# 3.B ​ Teniendo en cuenta la lista de productos anterior, crear una clase Purchase que procese
# órdenes de compra. Dicha clase deberá:
# Implementar un método #add(producto) que agregue un producto a la orden.
# Si el producto no está en la lista, no lo agregará a la compra.
# Implementar un método #total que calcule el total de los elementos agregados.
# 3.C Incorporar lógica de procesamiento de descuentos al sistema anterior de manera que si
# el total supera los $200, se aplique un descuento del 10%
# 3.D ​ Extender la funcionalidad para que le procesamiento de descuentos permita aplicar los
# siguientes descuentos:
# - Si la compra totaliza más de $200 se aplica un 10% de descuento
# - Si se llevan 2 unidades de "Historias de chillar" el precio del producto baja a $65
# 3.E ​ Extender las solución anterior de manera que se puedan agregar y modificar reglas
# descuentos y promociones


require 'csv'

productos = [] #crea lista vacia

def read_in_csv_data(csv_file_name,productos) #read el csv
	CSV.foreach(csv_file_name) do |row|
			index = row[0]
			titulo =row[1]
			precio = row[2]
			producto = [row[0],row[1],row[2]]
			productos << producto #anade el producto a la lista productos
			
	end
end

read_in_csv_data('archivo.csv',productos)

orden = Array.new

def add(producto,productos,orden)
  if (productos.find { |x| x[1] == producto }).nil? #encuentra el producto por posicion. nulo?
		puts 'no se encontro'
	else 
		puts 'se encontro'
		item = productos.select{|(x,y,z)| y==producto} #selecciona los 3 items del array y compara el 2do
		p item
		orden << item[0] #la orden es el producto encontrado
	end
end

def total(orden)
	choclo = orden.map { |n| n[1] }.count { |x| x == 'Historias de chillar' }
	total = orden.map { |n| n[2].to_i }.sum
	if choclo >= 2
		cho = choclo * 10		 	
		total = total - cho
	end
	if total > 200
		desc = (total * 10) / 100
		total = total - desc
		puts total
	else
		puts total
	end
end

add('Historias de chillar',productos,orden)
add('Historias de chillar',productos,orden)
add('Pegamento de personas',productos,orden)
total(orden)