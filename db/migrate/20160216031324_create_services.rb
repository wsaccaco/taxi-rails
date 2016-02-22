class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.datetime :serv_datetime_start
      t.string :serv_waypoint
      t.float :serv_precio
      t.datetime :serv_time
      t.string :serv_status

      t.timestamps null: false
    end
  end
end
