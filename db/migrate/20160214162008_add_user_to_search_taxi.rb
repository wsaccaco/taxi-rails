class AddUserToSearchTaxi < ActiveRecord::Migration
  def change
    add_reference :search_taxis, :user, index: true, foreign_key: true
  end
end
