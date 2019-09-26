class Entidade < ActiveRecord::Base
    has_many :contratos, inverse_of: :entidade
    
    
    validates :sigla, presence: true
    validates :nome, presence: true
end
