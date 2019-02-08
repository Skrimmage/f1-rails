class AddResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results, id: false do |t|
      t.integer :result_id, primary_key: true, unique: true
      t.integer :race_id
      t.integer :driver_id
      t.integer :constructor_id
      t.integer :number
      t.integer :grid
      t.integer :position
      t.string  :position_text
      t.integer :position_order
      t.float   :points
      t.integer :laps
      t.string  :time
      t.integer :milliseconds
      t.integer :fastest_lap
      t.integer :rank
      t.string  :fastest_lap_time
      t.string  :fastest_lap_speed
      t.integer :status_id

      t.timestamps
    end
  end
end
