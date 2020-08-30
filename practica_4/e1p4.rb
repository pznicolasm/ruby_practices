class Contacto
  attr_accessor :nombre, :fecha, :email, :tel, :dir

  def initialize(nombre,fecha,email,tel,dir)
      @nombre=nombre
      @fecha=fecha
      @email=email
      @tel=tel
      @dir=dir
  end

  def to_s
      puts 'el nombre es',nombre
      puts 'el fecha es',fecha
      puts 'el email es',email
      puts 'el tel es',tel
      puts 'el dir es',dir
  end

end

#agenda

def agregar(lista)
  puts 'dame nombre'
  nombre=gets.chomp.to_s
  puts 'dame fecha'
  fecha=gets
  puts 'dame email'
  email=gets
  puts 'dame tel'
  tel=gets
  puts 'dame dir'
  dir=gets

  contacto = Contacto.new(nombre,fecha,email,tel,dir)
  lista.append(contacto)
end

def ver_contactos(lista)
  lista.each do |contacto|
      contacto.to_s
  end
end

def encontrar(lista,nombre)
  lista.each do |contacto|
    if contacto.nombre == nombre
      puts 'se encontro'
      break
    else
      return 'cambiate el nombre papi'
    end  
  end
end

def editar(lista,nombre)
  lista.each do |contacto|
    if contacto.nombre == nombre
      puts 'cambie el nombre'
      contacto.nombre = gets
      puts contacto.nombre
    end  
  
  end
end


lista = []
agregar(lista)
agregar(lista)
ver_contactos(lista)
encontrar(lista,'pepe')
editar(lista,'pepo')