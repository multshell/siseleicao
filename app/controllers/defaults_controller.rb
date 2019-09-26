class DefaultsController < SistemaController
    
  def index
    @hoje = Date.current
    @todoscontratos = Contrato.all
    @todos = @todoscontratos.size
    @ativos = @todoscontratos.where('? < data_venc', @hoje).count
    @finalizados = @todoscontratos.where('? > data_venc', @hoje).count
    @i = 0
    
    Contrato.all.each do |c|
      vr = (c.data_venc - @hoje).to_i
      if vr <= 45 and vr > 0 then
        @i = @i + 1
      end
    end
    
    @vencendo = @i
  end
end