class VotacaoEleicoesController < ApplicationController
  before_action :set_eleicao, only: [:edit, :update, :destroy, :show]
  before_action :set_options_for_select, only: [:new, :edit, :create, :update, :destroy]
    
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @eleicoes = Eleicao.all.order("id asc")
  end
  
  def show
    @votacoes1 = Votacao.joins(:urna, :candidato).where(urnas: {finalizada: true}).order("votos desc")
    #@votacoescandidato = @votacoes.where('candidato_id = ?', @candidato.id)
    #@totalvotos = @votacoescandidato.sum(:votos)
    #@eleicao = Eleicao.find(1)
    @votosapurados = @votacoes1.sum(:votos)
    @faltosos = @eleicao.numeroeleitores - @votosapurados
    @brancos = @votacoes1.where(candidatos: { numero: '98'}).sum(:votos)
    @nulos = @votacoes1.where(candidatos: { numero: '99'}).sum(:votos)
    @validos = @votosapurados - @brancos - @nulos
    #@votacoesfinalizadas = Votacao.joins(:urna, :candidato).where(urnas: { finalizada: true })
    @votacoes = ActiveRecord::Base.connection.execute("select c.numero as candidato_numero, c.nome_campanha as candidato_nome, (sum(v.votos)) as candidato_votos from candidatos c inner join votacoes v on c.id = v.candidato_id inner join urnas u on v.urna_id = u.id where u.finalizada = true group by c.numero, c.nome_campanha order by candidato_votos desc")
  end
  
  private
  
    def set_options_for_select
      @eleicao_options_for_select = Eleicao.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_eleicao
      @eleicao = Eleicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urna_params
      params.require(:eleicao).permit(:descricao, :numerournas, :numeroeleitores, :numerocandidatos, :total_votos, :tempo_apuracao, :inicio_apuracao, :final_apuracao, :status)
    end
end
