class CandidatosController < SistemaController
  before_action :set_candidato, only: [:edit, :update, :destroy, :show]
  before_action :set_options_for_select, only: [:new, :edit, :create, :update, :destroy]
    
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @candidatos = Candidato.all
  end
  
  def show
  end
  
  # GET /fornecedores/new
  def new
    @candidato = Candidato.new
    authorize @candidato
  end
  
  # GET /fornecedores/1/edit
  def edit
    authorize @candidato
  end
  
  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @candidato = Candidato.new(candidato_params)
    
    if @candidato.save
      descricao_log = current_user.name + " incluiu o Candidato " + @candidato.inspect
      Log.create!(data_hora: Time.current, descricao: descricao_log)
      redirect_to candidatos_path, notice: "O Candidato (#{@candidato.nome_campanha}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end
  
  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    
    @teste = Candidato.find(@candidato.id)
    alterados_log = ""
    
    if @candidato.update(candidato_params)
      
      n1 = false
      n2 = false
      n3 = false
      n4 = false
      
      if @teste.numero != @candidato.numero
        n1 = true
        alterados_log = alterados_log + " numero: " + @candidato.numero
      end
      if @teste.nome_completo != @candidato.nome_completo
        n2 = true
        alterados_log = alterados_log + " nome_completo: " + @candidato.nome_completo
      end
      if @teste.nome_campanha != @candidato.nome_campanha
        n3 = true
        alterados_log = alterados_log + " nome_campanha: " + @candidato.nome_campanha
      end
      if @teste.eleicao_id != @candidato.eleicao_id
        n4 = true
        alterados_log = alterados_log + " eleicao_id: " + @candidato.eleicao_id.to_s
      end
      descricao_log = current_user.name + " alterou o candidato: " + @candidato.id.to_s + ", para as seguintes informações: " + alterados_log
      
      if n1 or n2 or n3 or n4
        Log.create!(data_hora: Time.current, descricao: descricao_log)
      end
      
      redirect_to candidatos_path, notice: "O Candidato (#{@candidato.nome_campanha}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end
  
  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    authorize @candidato
    candidato_nome_campanha = @candidato.nome_campanha
    descricao_log = current_user.name + " excluiu o Candidato " + @candidato.inspect
    
    if @candidato.destroy
      Log.create!(data_hora: Time.current, descricao: descricao_log)
      redirect_to candidatos_path, notice: "O Candidato (#{candidato_nome_campanha}) foi excluído com sucesso!"
    else
      render :index
    end
  end
  
  private
  
    def set_options_for_select
      @eleicao_options_for_select = Eleicao.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_candidato
      @candidato = Candidato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidato_params
      params.require(:candidato).permit(:numero, :nome_completo, :nome_campanha, :eleicao_id)
    end
end
