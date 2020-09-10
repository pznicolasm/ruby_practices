def palindromo(n)
    n=n.to_s 
    ninv=n.to_s.reverse
    ninv=n
end

def max(min, max)
lista = [ ]
rango = min..max
rango.each do |a|
    rango.each do |b|
        x = a * b
        if palindromo(x)
            lista.unshift(max)
        end
    end
end
lista.max
end

puts max(100,999)