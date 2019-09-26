class Votacao < ActiveRecord::Base
    belongs_to :urna
    belongs_to :candidato
    belongs_to :eleicao
    
    validates_presence_of :urna_id, message: 'não pode ser deixado em branco'
    validates_presence_of :eleicao_id, message: 'não pode ser deixado em branco'
    validates_presence_of :candidato_id, message: 'não pode ser deixado em branco'
    validates :candidato, uniqueness: { scope: :urna, message: "já possui votos registrados nessa urna" }
    validates_numericality_of :votos, greater_than_or_equal_to: 0,
                                message: " - deve ser um número maior ou igual a 0"
end
