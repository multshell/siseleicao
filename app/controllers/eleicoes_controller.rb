class EleicoesController < SistemaController
  before_action :set_eleicao, only: [:edit, :update, :destroy, :show]
  
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @eleicoes = Eleicao.all
  end
  
  def show
  end
  
  # GET /fornecedores/new
  def new
    @eleicao = Eleicao.new
    authorize @eleicao
  end
  
  # GET /fornecedores/1/edit
  def edit
    authorize @eleicao
  end
  
  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @eleicao = Eleicao.new(eleicao_params)
    
    if @eleicao.save
      descricao_log = current_user.name + " incluiu a Eleição " + @eleicao.inspect
      Log.create!(data_hora: Time.current, descricao: descricao_log)
      redirect_to eleicoes_path, notice: "A Eleicao (#{@eleicao.descricao}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end
  
  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
      
    @teste = Eleicao.find(@eleicao.id)
    alterados_log = ""
    eleicao = @eleicao.descricao
      
    if @eleicao.update(eleicao_params)
      
      n1 = false
      n2 = false
      n3 = false
      n4 = false
      
      if @teste.descricao != @eleicao.descricao
        n1 = true
        alterados_log = alterados_log + " descricao: " + @eleicao.descricao
      end
      if @teste.numerournas != @eleicao.numerournas
        n2 = true
        alterados_log = alterados_log + " numerournas: " + @eleicao.numerournas.to_s
      end
      if @teste.numeroeleitores != @eleicao.numeroeleitores
        n3 = true
        alterados_log = alterados_log + " numeroeleitores: " + @eleicao.numeroeleitores.to_s
      end
      if @teste.numerocandidatos != @eleicao.numerocandidatos
        n4 = true
        alterados_log = alterados_log + " numerocandidatos: " + @eleicao.numerocandidatos.to_s
      end
      descricao_log = current_user.name + " alterou a eleicao: " + @eleicao.id.to_s + ", descricao: " + eleicao + ", para as seguintes informações: " + alterados_log
      
      if n1 or n2 or n3 or n4
        Log.create!(data_hora: Time.current, descricao: descricao_log)
      end
      
      redirect_to eleicoes_path, notice: "A Eleicao (#{@eleicao.descricao}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end
  
  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    authorize @eleicao
    eleicao_descricao = @eleicao.descricao
    descricao_log = current_user.name + " excluiu a Eleição " + @eleicao.inspect
    #e_id = @eleicao.id
    if @eleicao.destroy
      Log.create!(data_hora: Time.current, descricao: descricao_log)
      redirect_to eleicoes_path, notice: "A Eleicao (#{eleicao_descricao}) foi excluída com sucesso!"
    else
      render :index
    end
  end
  
  private
    
    def set_eleicao
      @eleicao = Eleicao.find(params[:id])
    end
    
    def eleicao_params
      params.require(:eleicao).permit(:descricao, :numerournas, :numeroeleitores, :numerocandidatos, :total_votos, :tempo_apuracao, :inicio_apuracao, :final_apuracao, :status)
    end
    
end