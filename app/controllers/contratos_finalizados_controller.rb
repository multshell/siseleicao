class ContratosFinalizadosController < SistemaController
  before_action :set_contrato, only: [:edit, :update, :destroy]
  before_action :set_options_for_select, only: [:new, :edit, :create, :update, :destroy]

  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @hoje = Date.current
    @todoscontratos = Contrato.all.order("id ASC")
    @contratos = Contrato.where('? > data_venc', @hoje)
    @todos = @todoscontratos.size
    @ativos = @todoscontratos.where('? < data_venc', @hoje).count
    @finalizados = @contratos.count
    @vigencia_rest
  end
  
  def show
    @aditivos = Aditivo.where('contrato_id = ?', @contrato.id)
  end

  # GET /fornecedores/new
  def new
    @contrato = Contrato.new
    authorize @contrato
    set_numero_e_ano
  end

  # GET /fornecedores/1/edit
  def edit
    authorize @contrato
  end

  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @contrato = Contrato.new(contrato_params)
    
    if @contrato.save
      redirect_to contratos_path, notice: "O Contrato (#{@contrato.numero}/#{@contrato.ano}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    if @contrato.update(contrato_params)
      redirect_to contratos_path, notice: "O Contrato (#{@contrato.numero}/#{@contrato.ano}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    authorize @contrato
    contrato_numero = @contrato.numero
    contrato_ano = @contrato.ano
    
    if @contrato.destroy
      redirect_to contratos_path, notice: "O Contrato (#{contrato_numero}/#{contrato_ano}) foi excluído com sucesso!"
    else
      render :index
    end
    
  end

  private
  
    def set_options_for_select
      @entidade_options_for_select = Entidade.all
      @fornecedor_options_for_select = Fornecedor.all
      @modalidade_options_for_select = Modalidade.all
    end  
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato
      @contrato = Contrato.find(params[:id])
    end
    
    def set_numero_e_ano
      time = Time.zone.now
      @contrato.ano = time.year.to_s
      
      if Contrato.last == nil
        @contrato.numero = 1
      elsif Contrato.last.ano == time.year.to_s
        @contrato.numero = Contrato.last.numero + 1
      else
        @contrato.numero = 1
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def contrato_params
      params.require(:contrato).permit(:id, :numero, :ano, :entidade_id, :fornecedor_id, :valor, :objeto, :modalidade_id, :data_ass, :data_venc)
    end
end
