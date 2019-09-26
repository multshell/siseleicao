class TipoAditivo < ActiveRecord::Base
    has_many :aditivos, inverse_of: :tipo_aditivo
    
    validates :descricao, presence: true
end
