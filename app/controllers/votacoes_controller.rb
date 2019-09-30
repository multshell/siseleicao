class VotacoesController < SistemaController
  before_action :set_votacao, only: [:edit, :update, :destroy]
  before_action :set_options_for_select, only: [:new, :edit, :show, :create, :update, :destroy]
    
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @votacoes = Votacao.all
  end
  
  def show
    @urna = Urna.find(params[:id])
    @votacao = Votacao.new
    @votacao.urna = @urna
    @votacao.eleicao = Eleicao.find(1)
    authorize @votacao
  end
  
  # GET /fornecedores/new
  def new
    @votacao = Votacao.new
    authorize @votacao
  end
  
  # GET /fornecedores/1/edit
  def edit
    authorize @votacao
  end
  
  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @votacao = Votacao.new(votacao_params)
    
    if @votacao.save
      descricao_log = current_user.name + " incluiu a Votacao " + @votacao.inspect
      Log.create!(data_hora: Time.current, descricao: descricao_log)
      redirect_to apuracao_urna_path(@votacao.urna_id), notice: "Os Votos do (#{@votacao.candidato.nome_campanha}) foram registrados com sucesso!"
    else
      render :new
    end
  end
  
  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    
    @teste = Votacao.find(@votacao.id)
    alterados_log = ""
    @nome_candidato = @votacao.candidato.nome_campanha
    
    if @votacao.update(votacao_params)
      
      n1 = false
      n2 = false
      
      if @teste.candidato_id != @votacao.candidato_id
        n1 = true
        alterados_log = alterados_log + " nome_campanha: " + @votacao.candidato.nome_campanha
      end
      if @teste.votos != @votacao.votos
        n2 = true
        alterados_log = alterados_log + " votos: " + @votacao.votos.to_s
      end
      descricao_log = current_user.name + " alterou a votacao: " + @votacao.id.to_s + ", Candidato: " + @nome_candidato + ", para as seguintes informações: " + alterados_log
      
      if n1 or n2
        Log.create!(data_hora: Time.current, descricao: descricao_log)
      end
      
      redirect_to apuracao_urna_path(@votacao.urna_id), notice: "Os Votos do (#{@votacao.candidato.nome_campanha}) foram atualizados com sucesso!"
    else
      render :edit
    end
  end
  
  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    authorize @votacao
    votacao_candidato_nome_campanha = @votacao.candidato.nome_campanha
    descricao_log = current_user.name + " excluiu a Votacao " + @votacao.inspect
    
    if @votacao.destroy
      Log.create!(data_hora: Time.current, descricao: descricao_log)
      redirect_to votacoes_path, notice: "Os Votos do (#{votacao_candidato_nome_campanha}) foram excluídos com sucesso!"
    else
      render :index
    end
  end
  
  private
  
    def set_options_for_select
      @eleicao_options_for_select = Eleicao.all
      @urna_options_for_select = Urna.all
      @candidato_options_for_select = Candidato.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_votacao
      @votacao = Votacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votacao_params
      params.require(:votacao).permit(:votos, :urna_id, :candidato_id, :eleicao_id)
    end
end