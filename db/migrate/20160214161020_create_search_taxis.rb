class CreateSearchTaxis < ActiveRecord::Migration
  def change
    create_table :search_taxis do |t|
      t.timestamp :search_datetime
      t.string :search_geo_start
      t.string :search_geo_end
      t.text :search_referencia
      t.string :search_status

      t.timestamps null: false
    end
  end
end
