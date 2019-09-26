class Fornecedor < ActiveRecord::Base
    has_many :contratos, inverse_of: :fornecedor
    
    validates :nome, presence: true
end
