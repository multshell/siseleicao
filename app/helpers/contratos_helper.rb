module ContratosHelper
    
    def set_numero(valor)
        s = valor.numero.to_s + "/" + valor.ano.to_s
        return s
    end
end
