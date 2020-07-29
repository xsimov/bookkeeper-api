# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_729_090_709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'providers', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'contact_phone'
  end

  create_table 'shopping_orders', force: :cascade do |t|
    t.bigint 'provider_id'
    t.string 'description'
    t.datetime 'ordered_at', null: false
    t.datetime 'estimated_arrival_at', null: false
    t.datetime 'received_at'
    t.integer 'estimated_price_in_cents', default: 0
    t.integer 'final_price_in_cents', default: 0
    t.index ['provider_id'], name: 'index_shopping_orders_on_provider_id'
  end
end
