class AddSearchTaxiToService < ActiveRecord::Migration
  def change
    add_reference :services, :search_taxi, index: true, foreign_key: true
  end
end
