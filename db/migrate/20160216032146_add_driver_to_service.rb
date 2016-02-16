class AddDriverToService < ActiveRecord::Migration
  def change
    add_reference :services, :driver, index: true, foreign_key: true
  end
end
