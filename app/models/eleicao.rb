class Eleicao < ActiveRecord::Base
    has_many :votacoes
    has_many :urnas
    has_many :candidatos
    has_many :logs
    
    validates_presence_of :descricao, message: "deve ser preenchido"
    validates_numericality_of :numerournas, greater_than: 0,
                                message: " - deve ser um número maior do que 0"
    validates_numericality_of :numeroeleitores, greater_than: 0,
                                message: " - deve ser um número maior do que 0"
    validates_numericality_of :numerocandidatos, greater_than: 0,
                                message: " - deve ser um número maior do que 0"
end
