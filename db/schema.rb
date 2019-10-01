# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191001130133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aditivos", force: :cascade do |t|
    t.string   "numero",          limit: 50
    t.integer  "contrato_id"
    t.integer  "tipo_aditivo_id"
    t.integer  "valor_cents",                default: 0
    t.date     "data_ass"
    t.date     "data_venc"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "aditivos", ["contrato_id"], name: "index_aditivos_on_contrato_id", using: :btree
  add_index "aditivos", ["tipo_aditivo_id"], name: "index_aditivos_on_tipo_aditivo_id", using: :btree

  create_table "candidatos", force: :cascade do |t|
    t.string   "numero",            limit: 2
    t.string   "nome_completo",     limit: 200
    t.string   "nome_campanha",     limit: 200
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "eleicao_id"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size",    limit: 8
    t.datetime "foto_updated_at"
  end

  create_table "contratos", force: :cascade do |t|
    t.integer  "numero"
    t.string   "ano",           limit: 4
    t.integer  "entidade_id"
    t.integer  "fornecedor_id"
    t.integer  "valor_cents",             default: 0
    t.text     "objeto"
    t.integer  "modalidade_id"
    t.date     "data_ass"
    t.date     "data_venc"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "contratos", ["entidade_id"], name: "index_contratos_on_entidade_id", using: :btree
  add_index "contratos", ["fornecedor_id"], name: "index_contratos_on_fornecedor_id", using: :btree
  add_index "contratos", ["modalidade_id"], name: "index_contratos_on_modalidade_id", using: :btree
  add_index "contratos", ["numero", "ano"], name: "index_contratos_on_numero_and_ano", unique: true, using: :btree

  create_table "eleicoes", force: :cascade do |t|
    t.string   "descricao",        limit: 200
    t.integer  "numerournas"
    t.integer  "numeroeleitores"
    t.integer  "numerocandidatos"
    t.integer  "total_votos"
    t.datetime "tempo_apuracao"
    t.datetime "inicio_apuracao"
    t.datetime "final_apuracao"
    t.string   "status",           limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "entidades", force: :cascade do |t|
    t.string   "sigla",      limit: 10
    t.string   "nome",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string   "nome",       limit: 100
    t.string   "contato",    limit: 50
    t.string   "telefone",   limit: 15
    t.string   "email",      limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer  "eleicao_id"
    t.datetime "data_hora"
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "logs", ["eleicao_id"], name: "index_logs_on_eleicao_id", using: :btree

  create_table "modalidades", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_aditivos", force: :cascade do |t|
    t.string   "descricao",  limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "urnas", force: :cascade do |t|
    t.string   "escola",        limit: 200
    t.string   "localidade",    limit: 200
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "eleicao_id"
    t.string   "numero",        limit: 200
    t.integer  "total_votacao"
    t.boolean  "finalizada",                default: false
    t.string   "secoes",        limit: 300
    t.integer  "eleitores"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votacoes", force: :cascade do |t|
    t.integer  "votos"
    t.integer  "urna_id"
    t.integer  "candidato_id"
    t.integer  "eleicao_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votacoes", ["candidato_id"], name: "index_votacoes_on_candidato_id", using: :btree
  add_index "votacoes", ["eleicao_id"], name: "index_votacoes_on_eleicao_id", using: :btree
  add_index "votacoes", ["urna_id"], name: "index_votacoes_on_urna_id", using: :btree

  add_foreign_key "aditivos", "contratos"
  add_foreign_key "aditivos", "tipo_aditivos"
  add_foreign_key "contratos", "entidades"
  add_foreign_key "contratos", "fornecedores"
  add_foreign_key "contratos", "modalidades"
  add_foreign_key "logs", "eleicoes"
  add_foreign_key "votacoes", "candidatos"
  add_foreign_key "votacoes", "eleicoes"
  add_foreign_key "votacoes", "urnas"
end
