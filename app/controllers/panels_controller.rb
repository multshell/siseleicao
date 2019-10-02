class PanelsController < ApplicationController
  def index
    
    @urnas = Urna.all
    @totalurnas = @urnas.size
    @totalurnasapuradas = @urnas.where(finalizada: true).size
    @urnasnaoapuradas = @totalurnas - @totalurnasapuradas
    @perurnasapuradas = (@totalurnasapuradas.to_f * 100)/@totalurnas.to_f
    @perurnasnaoapuradas = (@urnasnaoapuradas.to_f * 100)/@totalurnas.to_f
    @totaleleitores = @urnas.find(1).eleicao.numeroeleitores
    @votacoesfinalizadas = Votacao.joins(:urna, :candidato).where(urnas: { finalizada: true })
    @apurados = @votacoesfinalizadas.sum(:votos)
    #@apurados = Votacao.joins(:urna).where(urnas: { finalizada: true }).sum(:votos)
    @naoapurados = @totaleleitores - @apurados
    @pereleitoresnaoapurados = (@naoapurados.to_f * 100)/@totaleleitores.to_f
    @pereleitoresapurados = (@apurados.to_f * 100)/@totaleleitores.to_f
    @abstencoes = @totaleleitores - @apurados
    @perabstencoes = (@abestencoes.to_f * 100)/@totaleleitores.to_f
    @votosbrancos = @votacoesfinalizadas.where(candidatos: { numero: '98'}).sum(:votos)
    @votosnulos = @votacoesfinalizadas.where(candidatos: { numero: '99'}).sum(:votos)
    @validos = @apurados - @votosbrancos - @votosnulos
    @pervalidos =  (@validos.to_f * 100)/@apurados.to_f
    @perbrancos = (@votosbrancos.to_f * 100)/@apurados.to_f
    @pernulos = (@votosnulos.to_f * 100)/@apurados.to_f
    #@votosvalidos = 
    
    #@resultados = Candidato.join(:votacoes)
    #@resultados = Candidato.includes(:votacoes).map { |candidato| resultados_candidatos.new(candidato.numero,  candidato.nome_campanha, candidato.votacoes.sum(:votos)) }
    #@resultado_ordenado = @resultados.sort
    #@votacoes = Votacao.joins(:candidato).select('votacoes.candidato_id').uniq
    #@votacoes = Votacao.group(:candidato_id).sum(:votos)
    
    #slq = "select c.numero as 'numero',
	 #               c.nome_campanha as 'nome',
	  #              (sum(v.votos)) as candidato_votos
	   #             from candidatos c inner join votacoes v
	    #            on c.id = v.candidato_id
	     #           group by v.candidato_id"
	  
	  #@apurados = ActiveRecord::Base.connection.execute("select (sum(v.votos)) as apurados from votacoes v inner join urnas u on v.urna_id = u.id where u.finalizada = true")
	  @candidatos = Candidato.all
	  #@votacoes = ActiveRecord::Base.connection.execute("select c.numero as candidato_numero, c.nome_campanha as candidato_nome, (sum(v.votos)) as candidato_votos from candidatos c inner join votacoes v on c.id = v.candidato_id group by c.numero, c.nome_campanha order by candidato_votos desc")
    #@votacoes = ActiveRecord::Base.connection.execute("select c.numero as candidato_numero, c.nome_campanha as candidato_nome, (sum(v.votos)) as candidato_votos from candidatos c inner join votacoes v on c.id = v.candidato_id group by c.numero, c.nome_campanha order by c.numero")
    @votacoes = ActiveRecord::Base.connection.execute("select c.numero as candidato_numero, c.nome_campanha as candidato_nome, (sum(v.votos)) as candidato_votos from candidatos c inner join votacoes v on c.id = v.candidato_id inner join urnas u on v.urna_id = u.id where u.finalizada = true group by c.numero, c.nome_campanha order by candidato_votos desc")
    #@votacoes = ActiveRecord::Base.connection.execute("select c.numero as candidato_numero, c.nome_campanha as candidato_nome, (sum(v.votos)) as candidato_votos from candidatos c inner join votacoes v on c.id = v.candidato_id inner join urnas u on v.urna_id = u.id group by c.numero, c.nome_campanha order by candidato_votos desc")
  end
  
end
