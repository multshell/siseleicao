class ApuracaoUrnasController < SistemaController
  before_action :set_urna, only: [:edit, :update, :destroy, :show]
  before_action :set_options_for_select, only: [:new, :edit, :create, :update, :destroy]
    
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @urnas = Urna.all
  end
  
  def show
    @votacoes = Votacao.where('urna_id = ?', @urna.id)
    @apurados = @votacoes.size
    @votosapurados = @votacoes.sum(:votos)
  end
  
  # GET /fornecedores/new
  def new
    @urna = Urna.new
    authorize @urna
  end
  
  # GET /fornecedores/1/edit
  def edit
    authorize @urna
  end
  
  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @urna = Urna.new(urna_params)
    
    if @urna.save
      redirect_to apuracao_urnas_path, notice: "A Urna (#{@urna.id} - #{@urna.escola}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end
  
  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    
    @teste = Urna.find(@urna.id)
    alterados_log = ""
    
    if @urna.update(urna_params)
      
      n1 = false
      
      if @teste.total_votacao != @urna.total_votacao
        n1 = true
        alterados_log = alterados_log + " total_votacao: " + @urna.total_votacao.to_s
      end
      descricao_log = current_user.name + " alterou o total de votos da urna: " + @urna.id.to_s + ", para as seguintes informações: " + alterados_log
      
      if n1
        Log.create!(data_hora: Time.current, descricao: descricao_log)
      end
      
      redirect_to apuracao_urna_path(@urna), notice: "A Urna (#{@urna.id} - #{@urna.escola}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end
  
  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    authorize @urna
    urna_id = @urna.id
    urna_escola = @urna.escola
    
    if @urna.destroy
      redirect_to urnas_path, notice: "A Urna (#{urna_id} - #{urna_escola}) foi excluída com sucesso!"
    else
      render :index
    end
  end
  
  private
  
    def set_options_for_select
      @eleicao_options_for_select = Eleicao.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_urna
      @urna = Urna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urna_params
      params.require(:urna).permit(:escola, :numero, :localidade, :total_votacao, :eleicao_id)
    end
end
