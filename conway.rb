class Conway 
    def muestras
        pobladores = 15
        celulas = [pobladores]
        for i in 0...pobladores
            celulas[i] = [pobladores]
            for j in 0...pobladores
                celulas[i][j] = rand(0..1)
            end
        end
        return celulas
    end    


    def buscarVecinos(x,y)

        contador = 0;

        #Revisar celda izquierda de la posición actual
        if estado(x-1, y) 
            contador += 1
        end

        # Revisar superior izquierda
        if estado(x-1, y-1)
            contador += 1
        end

        # Revisar inferior izquierda
        if estado(x-1, y+1)
            contador += 1
        end

        # Revisar celda de arriba del posicion actual
        if estado(x  , y-1)
            contador += 1
        end

        # celda derecha de la posicion actual
        if estado(x  , y+1)
            contador += 1
        end

        #  Esquina superior izquierda de la posicion actual
        if estado(x+1, y-1)
            contador += 1
        end

        # Revisar esquina inferior derecha
        if estado(x+1, y+1)
            contador += 1
        end 

        # Revisar celda de abajo de la posicion actual
        if estado(x+1, y)
            contador += 1
        end
        
        return contador;
    end
    
    def estado(x,y) 
        if muestras[x] 
            if muestras[x][y] == 1
                return true;
            else
                return false;
            end
        end
    end

    def generaciones   
        for x in 0...muestras.size
            for y in 0...muestras.size

                valor    = muestras[x][y]
                contador = buscarVecinos(x,y)
                result   = 0


                # Si esta viva y tiene menos de dos vecinos muere
                if valor && contador < 2
                    result = 0;
                end

                # si tiene valor y tiene 2 o tres vecinos vive 
                if valor && (contador == 2 || contador == 3)
                    result = 1;
                end

                # si tiene mas de tres vecinos muere
                if valor && contador > 3
                    result = 0;
                end
                
                # Si no tiene valor y tiene tres vecinos vivos Nace
                if !valor && contador == 3
                    result = 1;
                end

                muestras[x][y] = result;

            end
            #return muestras
        end

        print "------------------- \n"
        print muestras
        print "------------------- \n"

    end

end

def play

    puts "Iniciar generación ¿y/n?"
    response = gets.chomp

    if response == "y"

        puts "¿Cuantas generaciones deseas ver?"
        numberGenerations = gets.chomp.to_i
    
        for i in 0...numberGenerations
            Conway.new.generaciones
            puts "Generacion número: #{i+1}"
        end
        play
    elsif response == "n"
    end
end

play