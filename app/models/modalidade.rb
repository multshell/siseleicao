class Modalidade < ActiveRecord::Base
    has_many :contratos, inverse_of: :modalidade
    
    validates :descricao, presence: true
end
