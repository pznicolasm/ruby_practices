def fibonacci (n)
  if (n <= 4000000)
    if (n.even?)
      sig = 1
      act = n
      res = act + sig
    end
    fibonacci (n+sig)
  end
end

fibonacci (0)
puts 'la suma es: #{}'

