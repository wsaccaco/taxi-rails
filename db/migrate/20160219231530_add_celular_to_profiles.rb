class AddCelularToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :celular, :string
  end
end
