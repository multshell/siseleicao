json.extract! entidade, :id, :sigla, :nome, :created_at, :updated_at
json.url entidade_url(entidade, format: :json)
